// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract SimpleBank {

  mapping(address => uint256) private balances;

  event SetBalance(address indexed account, uint256 amount);
  event Deposited(address indexed account, uint256 amount);
  event Withdrawn(address indexed account, uint256 amount);

  function setBalance(uint256 amount) external {
    balances[msg.sender] = amount;
    emit SetBalance(msg.sender, amount);
  }

  function getBalance() public view returns (uint256) {
    return balances[msg.sender];
  }

  function increaseBalance(uint256 amount) external payable {
    require(amount > 0, "Invalid deposit amount");
    balances[msg.sender] += amount;
    emit Deposited(msg.sender, msg.value);
  }

  function decreaseBalance(uint256 amount) external {
    require(balances[msg.sender] >= amount, "Insufficient balance");
    balances[msg.sender] -= amount;
    emit Withdrawn(msg.sender, amount);
  }

}