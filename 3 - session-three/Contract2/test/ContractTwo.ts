import { time, loadFixture,} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import hre from "hardhat";

describe("SolidityDataTypes", function () {
  async function deploy() {
    const [account1] = await hre.ethers.getSigners();
    const SolidityConstructor = await hre.ethers.getContractFactory("contractTwo");
    const INITIAL_BALANCE = 5;
    const ctcSolidityDataTypes = await SolidityConstructor.deploy(INITIAL_BALANCE);
    return { ctcSolidityDataTypes, account1 };
  }
  
  describe("DEPLOYMENT TEST CASE", function () {
    it("CONSTRUCTOR EXECUTED (first execution)", async function () {
      const { ctcSolidityDataTypes } = await loadFixture(deploy);
      expect(ctcSolidityDataTypes).not.to.be.undefined;
    });

    describe("DUPLICATE DEPLOYMENT", function () {
      it("CONSTRUCTOR EXECUTED", async function () {
        const { ctcSolidityDataTypes } = await loadFixture(deploy);
        console.log("second deployment");
        expect(ctcSolidityDataTypes).not.to.be.undefined;
      });
    });
  });
});
