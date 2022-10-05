const { ethers } = require("hardhat");

async function main() {
  const donationContract = await ethers.getContractFactory("Donation");
  const deployedContract = await donationContract.deploy();
  console.log("deployedContract >> ", deployedContract.address);
}

main()
  .then(() => {
    process.exit(1);
  })
  .catch((e) => {
    console.log(e);
    process.exit(0);
  });
