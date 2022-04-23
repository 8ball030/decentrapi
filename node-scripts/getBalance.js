// SPDX-License-Identifier: Unlicense

/**
 * >>> decentrapi <<<
 *
 * Last update: 23.04.2022
 */

 require('dotenv').config();
 const { ethers, BigNumber} = require('ethers');

 let skaleProvider;
 let decentrapiProvider;


//  const getBalance = async () => {


//     let account = process.env.PUBLIC_ADDRESS;
//     let balance = await skaleProvider.getBalance(account);

//     console.log("balance: ", balance);

//     console.log(`Balance from ${account}: `, balance);
// }

const getBalanceFromSkaleNetwork = async () => {
    try{
        let tmp = await skaleProvider.getNetwork();
        console.log("Connected to skale.com");
        console.log("skaleProvider: ", tmp);
        console.log("ID: ", tmp.chainId);

        let account = process.env.PUBLIC_ADDRESS;
        let balance = await skaleProvider.getBalance(account);

        console.log(`Balance from ${account}: `, BigNumber.from(balance));

        return balance;
    }
    catch(error){
        console.log("Something is wrong: ", error.code);
        process.exit(1);
    }
}

const getBalanceFromDecentrapiNetwork = async () => {
    try{
        console.log("Now testing decentapi...");

        let tmp = await decentrapiProvider.getNetwork();
        console.log("decentrapiProvider: ", tmp);

        let account = process.env.PUBLIC_ADDRESS;
        let balance = await decentrapiProvider.getBalance(account);

        console.log(`Balance from ${account}: `, BigNumber.from(balance));

        return balance;
    }
    catch(error){
        console.log("Something is wrong: ", error.code);
        process.exit(1);
    }
}


const getBalances = async () => {
    skaleProvider = new ethers.providers.JsonRpcProvider(process.env.SKALE_RPC_URL);
    decentrapiProvider = new ethers.providers.JsonRpcProvider(process.env.DECENTRAPI_RPC_URL);

    let amountFromScale = await getBalanceFromSkaleNetwork();
    let amountFromDecentrapi = await getBalanceFromDecentrapiNetwork();

    console.log("amountFromScale: ", amountFromScale);
    console.log("amountFromDecentrapi: ", amountFromDecentrapi)

    //TODO: Compare the results
}

getBalances();