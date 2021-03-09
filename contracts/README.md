# From geth repo
* `make all`
* `./build/bin/geth --dev --http --http.api eth,net,web3,personal,miner console`

# From harvey contracts repo
* `brownie test`

(may need `brownie networks add Ethereum "local" host=http://127.0.0.1:8545 chainid=1337` first)
