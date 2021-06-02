const Migrations = artifacts.require("Migrations");

module.exports = async (deployer, network, accounts) => {
  let adapter = Migrations.interfaceAdapter;
  const web3 = adapter.web3;
  console.log("Network: ", network);
  console.log("Accounts : %o", accounts);
  const publisherAccount = accounts[0];

  // todo: deploy contracts

  console.log("All contract deployments are finished");
};
