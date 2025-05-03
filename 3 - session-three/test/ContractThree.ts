import { time, loadFixture,} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import hre from "hardhat";

describe("SolidityDataTypes", function () {
  async function deploy() {
    const [account1] = await hre.ethers.getSigners();
    const functionsExercise = await hre.ethers.getContractFactory("functionsExercise");
    const INITIAL_BALANCE = 5;
    const deployfunctionsExercise = await functionsExercise.deploy(INITIAL_BALANCE);
    return { deployfunctionsExercise, account1 };
  }
  
  describe("DEPLOYMENT TEST CASE", function () {
    it("01 GETTING BALANCE", async function () {
      const { deployfunctionsExercise } = await loadFixture(deploy);
      expect(deployfunctionsExercise).not.to.be.undefined;
      const balance = await deployfunctionsExercise.getBalance();
      console.log(`Initial balance is now ${balance}`);
    });

    it("02 ADDING BALANCE", async function () {
      const { deployfunctionsExercise } = await loadFixture(deploy);
      expect(deployfunctionsExercise).not.to.be.undefined;
      await deployfunctionsExercise.addBalance(50);
      const balance = await deployfunctionsExercise.getBalance();
      console.log(`Initial balance is now ${balance}`);
    });

    it("03 CALCULATOR FUNCTION", async function () {
      const { deployfunctionsExercise } = await loadFixture(deploy);
      expect(deployfunctionsExercise).not.to.be.undefined;

      await deployfunctionsExercise.calculator(1, 50);
      let balance = await deployfunctionsExercise.getBalance();
      console.log(`Initial balance is now ${balance}`);

      await deployfunctionsExercise.calculator(2, 50);
      balance = await deployfunctionsExercise.getBalance();
      console.log(`Initial balance is now ${balance}`);

      await deployfunctionsExercise.calculator(3, 50);
      balance = await deployfunctionsExercise.getBalance();
      console.log(`Initial balance is now ${balance}`);

      await deployfunctionsExercise.calculator(4, 50);
      balance = await deployfunctionsExercise.getBalance();
      console.log(`Initial balance is now ${balance}`);
    });
  });
});
