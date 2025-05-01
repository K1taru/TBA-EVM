const hre = require("hardhat");

async function main () {
  const currentTimeStamp = Math.floor(Date.now() / 1000);
  const unlockTime = currentTimeStamp + 100;

  const lockedAmount = hre.ethers.parseEther("0.0001");
  const lock = await hre.ethers.deployContract("Lock", [unlockTime], { 
    value: lockedAmount }
  )

  await lock.waitForDeployment();

  console.log(`Lock with ${ethers.formatEther(lockedAmount)} deployed to ${lock.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
})
