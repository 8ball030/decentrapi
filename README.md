# To run the node scripts to demonstrate the denctralised api.


# Node scripts

## Install
```bash
npm install
```

```bash 
export SKALE_RPC_URL=https://amsterdam.skalenodes.com/v1/attractive-muscida
export PUBLIC_ADDRESS=0x314e0dB1f7cD3657f3155697e3B7351Db632950e

export DECENTRAPI_RPC_URL=https://decentrapi.eth.link

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
Now testing decentapi...
Balance from 0x314e0dB1f7cD3657f3155697e3B7351Db632950e:  BigNumber { _hex: '0x06f05b59d3b20000', _isBigNumber: true }
```


