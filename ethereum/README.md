## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**











forge script script/MintToken.s.sol --rpc-url 127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast


forge script script/BurnToken.s.sol --rpc-url 127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast


forge script script/DeployToken.s.sol --rpc-url 127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast



sui client call --package 0xfb21b7fa0a17973b3d3f3102b36354ff290bd3840c23b7e4248f22c461337387 \
    --module token \
    --function mint \
    --args 0x902b92ba4455831089a6ba18aa06eb2cc64d477dcf40587b451b92c791653e23 \
          1000000 \
          0xdb47e8bd66365981658f9753cf2fc3afdebc7855f79fed75e532895a9b749ad0 \
          0xf9b68d2dc7ea1c58981b7b13563e7bc43d10e5cb2e83242515369f72e28082d6 \
    --gas-budget 1000000


sui client call \
    --package 0xfb21b7fa0a17973b3d3f3102b36354ff290bd3840c23b7e4248f22c461337387 \
    --module token \
    --function burn \
    --args 0x902b92ba4455831089a6ba18aa06eb2cc64d477dcf40587b451b92c791653e23 \
          0xc55d5e13c5e3b635e2dbafc920a250ccaf3d9a867f0a2956b4351db2ca63b2ed \
          0xf9b68d2dc7ea1c58981b7b13563e7bc43d10e5cb2e83242515369f72e28082d6 \
    --gas-budget 500000000


sui client publish --gas-budget 500000000 --gas 0x5862e615a5068aca9c869a9fe17be86cbbe6c761d258063e17f270baa4352389

sui client publish --gas-budget 500000000 --gas 0xdb47e8bd66365981658f9753cf2fc3afdebc7855f79fed75e532895a9b749ad0

0xdb47e8bd66365981658f9753cf2fc3afdebc7855f79fed75e532895a9b749ad0


sui client import --key suiprivkey1qqpe6ka0z6ray5nuugq5fssa68cjz3uwem24e8uuuwmyra6n0387w8urc5m

sui client switch --address 0xdb47e8bd66365981658f9753cf2fc3afdebc7855f79fed75e532895a9b749ad0


sui keytool convert suiprivkey1qqpe6ka0z6ray5nuugq5fssa68cjz3uwem24e8uuuwmyra6n0387w8urc5m



sui client transfer --to 0xdb47e8bd66365981658f9753cf2fc3afdebc7855f79fed75e532895a9b749ad0 --object-id 0x29205e76714ec35eb1aa7a6c67e975af1ee8b682742ad07db9f2cd7d36e9686e --gas-budget 1000















Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
