// SPDX-License-Identifier: Unlicense

//ETHAmsterdam 2022 Hackathon by ETHGlobal
//Last update: 24.04.2022

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract decentrapi is Ownable {

    //Variables
    string public serviceName;
    string public serviceVersion;

    struct Node{
        uint index;
        uint port;
        string url;
    }
    //(bytes32) hashed(nodeUrl,nodePort) => (struct) NODE
    mapping (bytes32 => Node) nodes;

    bytes32[] private nodeIndex;

    //Events
    event NodeAdded(address indexed sender, string nodeUrl, uint nodePort, uint nodeId);
    //event NodeRemoved(address indexed sender);

/*
    constructor(string memory _serviceName, string memory _serviceVersion){
        serviceName = _serviceName;
        serviceVersion = _serviceVersion;

        //TODO:
        //apiNodeHash
        //loadBalancerHash
    }
*/

    function addNode(string memory _url, uint _port) public onlyOwner returns(bool success){
        require(keccak256(abi.encodePacked(_url)) != keccak256(abi.encodePacked("")), "addNode: Url must be provided");
        require(_port != 0, "addNode: Port must be provided");

        bytes32 hashedUrl = keccak256(abi.encodePacked(_url, _port, address(this)));
        uint index = nodeIndex.length;

        nodes[hashedUrl].index  = index;
        nodes[hashedUrl].port   = _port;
        nodes[hashedUrl].url    = _url;

        nodeIndex.push(hashedUrl);

        emit NodeAdded(msg.sender, _url, _port, index);
        return true;
    }

    //function updateNode(uint nodeId) public onlyOwner returns(bool success){}

/*
    function removeNode(uint nodeId) public onlyOwner returns(bool success){}
        //TODO

        emit NodeRemoved();
        return true;
    }
*/

    function getNode(uint nodeId) public view returns(string memory nodeUrl, uint nodePort){
        require(nodeId < nodeIndex.length, "getNode: nodeId does not exist");

        bytes32 hashedUrl = nodeIndex[nodeId];

        return (nodes[hashedUrl].url, nodes[hashedUrl].port);
    }

    function getNodeUrlHash(uint nodeId) public view returns(bytes32 hash){
        require(nodeId < nodeIndex.length, "getNodeUrlHash: nodeId does not exist");

        return nodeIndex[nodeId];
    }

    function getNodeId(bytes32 nodeUrlHash) public view returns(uint nodeId){
        uint index = nodes[nodeUrlHash].index;
        require(nodeIndex[index] == nodeUrlHash, "getNodeId: nodeUrlHash does not exist");

        return index;
    }

    function getNodeAmount() public view returns(uint amount){
        return nodeIndex.length;
    }

    function isNode(string memory _url, uint _port) public view returns(bool){
        require(nodeIndex.length > 0, "isNode: There are no nodes");
        require(keccak256(abi.encodePacked(_url)) != keccak256(abi.encodePacked("")), "isNode: Url must be provided");
        require(_port != 0, "isNode: Port must be provided");

        bytes32 hashedUrl = keccak256(abi.encodePacked(_url, _port, address(this)));
        uint index = nodes[hashedUrl].index;

        if (nodeIndex[index] == hashedUrl) {
            return true;
        } else {
            return false;
        }
    }

    //SKALE RNG Endpoint
    //https://docs.skale.network/skaled/3.14.x/random-number-generator
    function getRandom() public view returns (bytes32 addr) {
        assembly {
            let freemem := mload(0x40)
            let start_addr := add(freemem, 0)
            if iszero(staticcall(gas(), 0x18, 0, 0, start_addr, 32)) {
              invalid()
            }
            addr := mload(freemem)
        }
    }
}