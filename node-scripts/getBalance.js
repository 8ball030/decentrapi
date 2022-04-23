// SPDX-License-Identifier: Unlicense

/**
 * >>> decentrapi <<<
 *
 * Last update: 23.04.2022
 */

 require('dotenv').config();
 const { ethers } = require('ethers');

 let provider;


 const getBalance = async () => {
    console.log("Now testing decentapi...");

    let account = process.env.PUBLIC_ADDRESS;
    let balance = await provider.getBalance(account);

    console.log(`Balance from ${account}: `, balance);
}


function initialise(){
    provider = new ethers.providers.JsonRpcProvider(process.env.SKALE_RPC_URL);

    if(provider){
        console.log("Connected to skale.com");
        console.log("Provider: ", provider);

        getBalance();
    }else{
        console.log("Could not connect. Exiting.")
        process.exit(1);
    }
}


initialise();