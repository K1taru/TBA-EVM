// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "hardhat/console.sol";

contract contractOne {
  uint256 balance;
  address owner;
  mapping(string => uint256) accounts;

  constructor() {
    balance = 70;
    owner = address(0);
    accounts["TBA"] = 99;
    accounts["string"] = 55;

    console.log("Balance is", balance);
    console.log("Owner is", owner);
    console.log("Account is", accounts["theblokc"]);
    console.log("Account is", accounts["k1taru"]);
  }
}