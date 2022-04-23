const Web3 = require('web3')
const cfg = require('../config');
const axios = require('axios')
const web3 = new Web3(new Web3.providers.HttpProvider(cfg.SKALE_URL))
const ct = web3.eth.Contract(cfg.CONTACT_ABI, cfg.CONTACT_ADDRESS);

async function getNodeAddress() {
    let resp
    try {
        // string memory nodeUrl, uint nodePort
        resp = await ct.methods.getNode(nodeId).call();
    } catch (e) {
        console.log("something went wrong:", e)
    }
    return resp;
}

async function forwardRequest(rpcUrl, req) {
    let resp
    try {
        resp = await axios.post(rpcUrl, req)
    } catch (e) {
        console.log("something went wrong:", e)
    }
    return resp
}

module.exports = {getNodeAddress, forwardRequest};