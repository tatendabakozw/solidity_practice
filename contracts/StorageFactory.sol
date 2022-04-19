//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// importing first contract into the simple storage contract
import "./FirstContract.sol";

contract StorageFactory{

    // there is need tp store the number of smart contracts created so that we know which one to interact with
    FirstContract[] public first_contract_array;

    // to create a simple first cotract from here
    function createFirstContract() public{
        FirstContract first_contract = new FirstContract();

        // pushing created contract to array of contracts
        first_contract_array.push(first_contract);
    }

    // whenever we want to interact with a smart contact there are two thongs needed
    // - address
    // - ABI

    // intercating with functions inside first contract
    function sfStore(uint256 _firstContractIndex, uint256 age, string memory name, uint256 height) public {

        // creating instance of first contract with specific index
        FirstContract first_contract = FirstContract(address(first_contract_array[_firstContractIndex]));

        // interacting with functions inside first contract
        first_contract.addPerson(name,age,height);
    }
}