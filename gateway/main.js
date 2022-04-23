'use strict';

const express = require('express');
const helper = require("./helper/helper");


// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/healthz', (req, res) => {
    res.send('ok');
});

app.post('/', async (req, res) => {
    const randNumber = 1 // TODO: get the random number
    // get node address from smart contract
    const addr = await helper.getNodeAddress(randNumber)

    // call the node
    const resp = await helper.getBalance(addr, req)
    res.send(resp)
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);