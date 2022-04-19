//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// contract to add a person to storage
contract FirstContract{
    // to store each person using an "object" like structure
    struct Person{
       string name;
       uint256 age;
       uint256 height;
    }

    // creating an array variable for people
    Person[] public people;

    // using mapping to get value from the array using the name
    mapping(string => uint256) public nameToAge;

    // function to add a person to people
    function addPerson(string memory _name, uint256 _age, uint256 _height) public{
        people.push(Person({name: _name, height: _height, age:_age}));
        nameToAge[_name] = _age;
    }
}