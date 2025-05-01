// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "hardhat/console.sol";

contract contractTwo {
  uint256 balance = 2;

  constructor(uint256 deposit) {
    console.log(" 1. Balance is now", balance);
    balance += deposit;
    console.log(" 2. Balance is now", balance);
  
  }
}