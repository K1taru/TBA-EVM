import { time, loadFixture,} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-toolbox"
import { expect } from "chai";
import hre from "hardhat";

describe("SolidityConstructor", function () {
  async function deploy() {
    const [account1] = await hre.ethers.getSigners();
    const ContractTwo = await hre.ethers.getContractFactory("ContractTwo");
    const ctcContractTwo = await ContractTwo.deploy();
    return { ctcContractTwo, account1 };
  }
  
  describe("DEPLOYMENT SUCCESS", function () {
    it("SUCCESS", async function () {
      const { ctcContractTwo } = await loadFixture(deploy);
      expect(ctcContractTwo).not.to.be.undefined;
    });
  });
});