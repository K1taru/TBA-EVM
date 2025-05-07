// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
  // State Variables
  uint256 public count;
  string public words;

  function setValues(string memory _text, uint256 _number) public {
    count = _number;
    words = _text;
  }

  function getValueOfCount() external view returns (uint256) {
    return count;
  }

  function getValueOfWords() external view returns (string memory) {
    return words;
  }
}
