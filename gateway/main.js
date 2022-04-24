'use strict';

const express = require('express');
const helper = require("./helper/helper");


// Constants
const PORT = 31001;
const HOST = '0.0.0.0';
const TEST_URL = "https://amsterdam.skalenodes.com/v1/attractive-muscida"

// App
const app = express();
app.get('/healthz', (req, res) => {
    res.send('ok');
});

app.post('/', async (req, res) => {
    let respNode
    try {
        // get node address from smart contract
        const respAddr = await helper.getNodeAddress()

        // forward the request to node
        let rpcUrl = respAddr[0] + ":" + respAddr[1]
        // let rpcUrl = TEST_URL

        respNode = await helper.forwardRequest(rpcUrl, req)
    } catch (e) {
        console.log("something went wrong:", e)
    }
    // console.log("respNode:", respNode.data)
    res.send(respNode.data)
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);