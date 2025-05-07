// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract structsExample {

  struct Person {
    string name;
    uint256 age;
    uint256 height;
  }

  Person public person1; // I think this is enough already, tested it without the constructor()

  constructor() { //abi ninja working without constructor before I wrote this
    person1 = Person("", 0, 0);
  }

  function setPersonData(string memory setName, uint256 setAge, uint256 setHeight) public {
    person1 = Person(setName, setAge, setHeight);
  }

  function getPersonData() public view returns (string memory, uint256, uint256) {
    return ( person1.name, person1.age, person1.height);
  }

}