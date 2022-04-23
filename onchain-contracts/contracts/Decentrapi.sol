// SPDX-License-Identifier: Unlicense

//ETHAmsterdam 2022 Hackathon
//Last update: 23.04.2022

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
    //(bytes32) hashedUrl => NODE
    mapping (bytes32 => Node) nodes;

    bytes32[] private nodeIndex;

    //Events
    event NodeAdded(address indexed sender, string nodeUrl, uint nodePort, uint nodeId);
    event NodeRemoved(address indexed sender);

/*
    constructor(string memory _serviceName, string memory _serviceVersion){
        serviceName = _serviceName;
        serviceVersion = _serviceVersion;

        //apiNodeHash
        //loadBalancerHash
    }
*/

    function addNode(string memory _url, uint _port) public onlyOwner returns(bool success){
        require(keccak256(abi.encodePacked(_url)) != keccak256(abi.encodePacked("")), "addNode: URL must be provided");
        require(_port != 0);

        bytes32 hashedUrl = keccak256(abi.encodePacked(_url, address(this)));
        uint index = nodeIndex.length;

        nodes[hashedUrl].index = index;
        nodes[hashedUrl].port = _port;
        nodes[hashedUrl].url = _url;

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
        bytes32 hashedUrl = nodeIndex[nodeId];
        require(nodes[hashedUrl].index == nodeId, "getNodeUrlHash: nodeId does not exist");

        return hashedUrl;
    }

    function getNodeId(bytes32 nodeUrlHash) public view returns(uint nodeId){
        uint index = nodes[nodeUrlHash].index;
        require(nodeIndex[index] == nodeUrlHash, "getNodeId: nodeUrlHash does not exist");

        return index;
    }

    function getNodeAmount() public view returns(uint amount){
        return nodeIndex.length;
    }
}