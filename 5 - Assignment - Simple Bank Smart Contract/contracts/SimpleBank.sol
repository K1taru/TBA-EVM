// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract SimpleBank {
  address public owner;

  mapping(address => uint256) public balances;

  event SetBalance(address indexed account, uint256 amount);
  event Deposited(address indexed account, uint256 amount);
  event Withdrawn(address indexed account, uint256 amount);

  modifier onlyOwnerPrivileges {
    require(msg.sender == owner, "Not Authorized");
    _;
  }

  constructor() {
    owner = msg.sender;
  }

  function setBalance(address user, uint256 amount) external onlyOwnerPrivileges {
    balances[user] = amount;
    emit SetBalance(user, amount);
  }

  function getBalance() external view returns (uint256) {
    return balances[msg.sender];
  }

  function increaseBalance() external payable {
    require(msg.value > 0, "Invalid deposit amount");
    balances[msg.sender] += msg.value;
    emit Deposited(msg.sender, msg.value);
  }

  function decreaseBalance(uint256 amount) external {
    require(balances[msg.sender] >= amount, "Insufficient balance");
    balances[msg.sender] -= amount;
    payable(msg.sender).transfer(amount);
    emit Withdrawn(msg.sender, amount);
  }

}