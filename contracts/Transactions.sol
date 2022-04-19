// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Transactions{
    uint256 transactionsCount;
    event Transfer(address from, address receiver, uint amount, string message, uint256 timestamp, string keyword);

    // defining new dataype to use for each transaction
    struct TransferStruct {
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TransferStruct[] transactions;

    // add to the blockchain
    function addToBlockChain(address payable receiver, uint amount, string memory message, string memory keyword) public {
        // add the count of transaction
        transactionsCount += 1;

        // push transaction to the list of all transactions
        transactions.push(TransferStruct(msg.sender, receiver, amount, message, block.timestamp, keyword ));

        // to make the transfer we have to emit the event
        emit Transfer(msg.sender, receiver, amount, message, block.timestamp, keyword);

    }

    // return all transactions
    function getAllTransactiions() public view returns (TransferStruct[] memory) {
        return transactions;
    }

    // return transactions count
    function getTransactionCount() public view returns (uint256) {
        return transactionsCount;
    }
}