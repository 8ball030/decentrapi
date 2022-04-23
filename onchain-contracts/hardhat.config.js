require("@nomiclabs/hardhat-waffle");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  networks: {
      skale: {
          url: "https://amsterdam.skalenodes.com/v1/attractive-muscida",
          accounts: ["0xab21767a22dcbc335669fc0f777fafb230e8edaa59201cd4dee22e90ea0dad69"]
      },
  },
  solidity: "0.8.12",
};