# Ethereum Smart Contract

Ethereum Smart Contract project bootstrapped with [`solidity`](https://solidity.readthedocs.io/en/v0.8.0/), [`truffle`](https://www.trufflesuite.com/docs/truffle/overview) and [`openzeppelin`](https://docs.openzeppelin.com/contracts/4.x/).

## Getting Started

First, install node_modules:

```bash
npm i
```

Install and run Ganache:

Then compile the smart contract:

```bash
truffle compile --all
```

Run migrate for deployment after compile the smart contract in `build/contracts`:

```bash
truffle migrate
```

Run in ropsten network, check truffle-config.js to see network setup (please setup your infura.io key before run)

> '--skipDryRun' are handled for node v14, details are as follows: (https://github.com/trufflesuite/truffle/issues/1927)

```bash
truffle migrate --network ropsten --skipDryRun
```

You can edit the smart contracts by modifying `contracts/`.

## Learn More

To learn more about Solidity Smart Contract, take a look at the following resources:

- [Solidity Documentation](https://solidity.readthedocs.io/en/v0.8.0/) - learn about basic solidity structures and syntax.
- [Learn Truffle](https://www.trufflesuite.com/docs/truffle/overview) - an development environment, testing framework and asset pipeline for blockchains.
- [Openzeppelin](https://docs.openzeppelin.com/contracts/4.x/) - provide tools for developing ERC721 standard smart contracts.

## License

Haven't decided.