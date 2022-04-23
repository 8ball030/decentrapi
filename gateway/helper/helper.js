const Web3 = require('web3')
const web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'))


async function getNodeAddress(randNumber) {
    const ct = web3.eth.Contract(contract_abi, contract_address);
    ct.methods.getNode(randNumber).call()
    return "host:port";
}

async function getBalance(addr) {
    return;
}

module.exports = { getNodeAddress, getBalance };