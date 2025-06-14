import { time, loadFixture,} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import hre from "hardhat";

describe("SolidityDataTypes", function () {
  async function deploy() {
    const [account1] = await hre.ethers.getSigners();
    const SolidityDataTypes = await hre.ethers.getContractFactory("contractOne");
    const ctcSolidityDataTypes = await SolidityDataTypes.deploy();
    return { ctcSolidityDataTypes, account1 };
  }
  
  describe("DEPLOYMENT SUCCESS", function () {
    it("SUCCESS", async function () {
      const { ctcSolidityDataTypes } = await loadFixture(deploy);
      expect(ctcSolidityDataTypes).not.to.be.undefined;
    });
  });
});
