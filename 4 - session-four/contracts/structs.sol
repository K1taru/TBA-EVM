// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract structsExample {
  enum Gender { Male, Female }

  struct Person {
    string name;
    uint256 age;
    uint256 height;
    Gender sex;
  }

  mapping(string => Person) private people;
  uint256 private personCount = 0;

  function uintToString(uint256 value) internal pure returns (string memory) {
    if (value == 0) return "0";
    uint256 temp = value;
    uint256 digits;
    while (temp != 0) {
      digits++;
      temp /= 10;
    }
    bytes memory buffer = new bytes(digits);
    while (value != 0) {
      digits -= 1;
      buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
      value /= 10;
    }
    return string(buffer);
  }

  function stringToGender(string memory sex) internal pure returns (Gender) {
    if (keccak256(abi.encodePacked(sex)) == keccak256(abi.encodePacked("Male"))) {
      return Gender.Male;
    } else if (keccak256(abi.encodePacked(sex)) == keccak256(abi.encodePacked("Female"))) {
      return Gender.Female;
    }
    revert("Invalid gender string");
  }

  function genderToString(Gender sex) internal pure returns (string memory) {
    if (sex == Gender.Male) {
      return "Male";
    } else if (sex == Gender.Female) {
        return "Female";
    }
    return ""; 
  } 

  function createPerson(string memory name, uint256 age, uint256 height, string memory gender) public {
    personCount++;
    string memory key = string(abi.encodePacked("person", uintToString(personCount)));
    Gender sex = stringToGender(gender);
    people[key] = Person(name, age, height, sex);
  }

  function setPersonData(string memory key, string memory setName, uint256 setAge, uint256 setHeight, string memory setGender) public {
    require(bytes(people[key].name).length != 0, "Person does not exist");
    Gender setSex = stringToGender(setGender);
    people[key] = Person(setName, setAge, setHeight, setSex); 
  }

  function getPersonData(string memory key) external view returns (string memory, uint256, uint256, string memory sex) {
    require(bytes(people[key].name).length != 0, "Person does not exist");
    Person memory person = people[key];
    return (person.name, person.age, person.height, genderToString(person.sex));
  }

}
