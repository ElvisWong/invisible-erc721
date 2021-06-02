const HDWalletProvider = require("@truffle/hdwallet-provider");

module.exports = {
  // Uncommenting the defaults below
  // provides for an easier quick-start with Ganache.
  // You can also follow this format for other networks;
  // see <http://truffleframework.com/docs/advanced/configuration>
  // for more details on how to specify configuration options!
  // skipDryRun to tackle with node.js v14 - https://github.com/trufflesuite/truffle/issues/1927
  networks: {
    // live: {
    //   provider: function () {
    //     return new HDWalletProvider(
    //       config.get("publisher.privateKey"),
    //       `wss://mainnet.infura.io/ws/v3/${config.get("infura.mainnet")}`,
    //       0,
    //       1
    //     );
    //   },
    //   network_id: 1,
    //   skipDryRun: true,
    // },
    // ropsten: {
    //   provider: function () {
    //     return new HDWalletProvider(
    //       config.get("publisher.privateKey"),
    //       `wss://ropsten.infura.io/ws/v3/${config.get("infura.ropsten")}`,
    //       0,
    //       1
    //     );
    //   },
    //   network_id: "3",
    //   skipDryRun: true,
    // },
    // rinkeby: {
    //   provider: function () {
    //     return new HDWalletProvider(
    //       config.get("publisher.privateKey"),
    //       `wss://rinkeby.infura.io/ws/v3/${config.get("infura.rinkeby")}`,
    //       0,
    //       1
    //     );
    //   },
    //   network_id: "4",
    //   skipDryRun: true,
    // },
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*",
    },
    test: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*",
      skipDryRun: true,
    },
  },
  plugins: ["truffle-contract-size"],
  compilers: {
    solc: {
      version: "^0.8.0",
      docker: false,
      settings: {
        optimizer: {
          enabled: true,
          runs: 200,
        },
      },
    },
  },
  environments: {
    live: {},
  },
};
