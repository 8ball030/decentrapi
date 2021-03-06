# [Decentrapi](https://docs.google.com/presentation/d/1O1EehwxhhLyNl4AlzLjUaeczu3Q1HyoHoTumAj3trgk/edit?usp=sharing)




# To run the node scripts to demonstrate the denctralised api.

Clone the repository, and recursively clone the submodules:


# Setup 
`git clone --recursive https://github.com/8ball030/decentrapi.git`

`git submodule update --init --recursive`


# API node

```bash
pipenv --python 3.8
pipenv run pip install -e .
pipenv shell
```

# Multisigwallet-cli

```
cd third_party/multisigwallet-cli && yarn install && cd ../../
```

# Node scripts

## Install
```bash
npm install
```

```bash 
export SKALE_RPC_URL=https://amsterdam.skalenodes.com/v1/attractive-muscida
export DECENTRAPI_RPC_URL=https://decentrapi.eth.link

export PUBLIC_ADDRESS=0x314e0dB1f7cD3657f3155697e3B7351Db632950e

node getBalance.js
```


```output
Connected to skale.com
Provider:  JsonRpcProvider {
  _isProvider: true,
  _events: [],
  _emitted: { block: -2 },
  disableCcipRead: false,
  formatter: Formatter {
    formats: {
      transaction: [Object],
      transactionRequest: [Object],
      receiptLog: [Object],
      receipt: [Object],
      block: [Object],
      blockWithTransactions: [Object],
      filter: [Object],
      filterLog: [Object]
    }
  },
  anyNetwork: false,
  _networkPromise: Promise { <pending> },
  _maxInternalBlockNumber: -1024,
  _lastBlockNumber: -2,
  _maxFilterBlockRange: 10,
  _pollingInterval: 4000,
  _fastQueryDate: 0,
  connection: { url: 'https://amsterdam.skalenodes.com/v1/attractive-muscida' },
  _nextId: 42
}

Now testing original rpc endpointj
Balance from 0x314e0dB1f7cD3657f3155697e3B7351Db632950e:  BigNumber { _hex: '0x06f05b59d3b20000', _isBigNumber: true }

Now testing decentapi...
Balance from 0x314e0dB1f7cD3657f3155697e3B7351Db632950e:  BigNumber { _hex: '0x06f05b59d3b20000', _isBigNumber: true }


Assert response == True 
```


