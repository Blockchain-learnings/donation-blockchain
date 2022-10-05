const { expect } = require("chai");

describe("Donation contract", () => {
  let owner, acc1, acc2;
  let donationContract, donationContractDeployed;

  describe("deployment verification", async () => {
    beforeEach(async () => {
      [owner, acc1, acc2] = await ethers.getSigners();
      const donationContract = await ethers.getContractFactory("Donation");
      const deployedContract = await donationContract.deploy();
      await deployedContract.deployed();
    });

    it("at deployment verify name", async () => {
      const count = await deployedContract.count();
      expect(count).to.equal(0);
    });
  });
});
