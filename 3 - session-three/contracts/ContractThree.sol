// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract functionsExercise {
  uint256 balance = 0;

  constructor(uint256 initialBalance) {
    balance = initialBalance;
  }

  function addBalance(uint256 toAdd) public {
    balance += toAdd;
  }

  function getBalance() public view returns (uint256) {
    return balance;
  }

  function calculator (uint mode, uint256 amount) public {
    if (mode == 1) {
      balance += amount;
    }

    else if (mode == 2) {
      balance -= amount;
    }
    
    else if (mode == 3) {
      balance *= amount;
    }

    else if (mode == 4) {
      balance /= amount;
    }
  }
}