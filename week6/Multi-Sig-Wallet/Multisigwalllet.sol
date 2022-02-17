// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

/*
- multi-sig is wallet owned by a given number of people. to transfer funds a given number of people can approve/verify before its approved/sent.
- consider number of people owning the address, number of confirmations to approve transaction */

contract MultiSig {
    address[] owners;

    mapping(address => bool) ownersMapping;

    uint minimumApprovalRequired;

    struct TransactionData {
        uint id;
        address toAddress;
        uint256 amount;
        address requestedBy;
        uint256 timeStamp;
        uint numberOfApproval;
        bool status;
    }

    TransactionData[] transactionArray;

    constructor(address[] memory _owners, uint _minimumApprovalRequired) {
        owners = _owners;
        minimumApprovalRequired = _minimumApprovalRequired;

        for(uint i; i < _owners.length; i++) {
            // ownersMapping[_owners[i]] = true;
            address _owner = _owners[i];
            ownersMapping[_owner] = true;
        }
    }

    modifier onlyOwners {
        require(ownersMapping[msg.sender] == true, "only the owners can call this function");
        _;
    }

    function requestTransaction(uint _amount, address _to) external onlyOwners returns(uint) {
        uint _id = transactionArray.length;
        TransactionData memory transact = TransactionData(_id, _to, _amount, msg.sender, block.timestamp, 0, false);
        transactionArray.push(transact);
        return _id;
    }

    function approveTransaction(uint _transactionId) external onlyOwners returns(uint) {
        transactionArray[_transactionId].numberOfApproval++;
        return ++transactionArray[_transactionId].numberOfApproval;
    }

    function checkTransactionApprovalCount(uint _transactionId) external view returns(uint) {
        return transactionArray[_transactionId].numberOfApproval;
    }

    // send transaction: change status to true after it has been executed to prevent repeat of execution
    function sendTransaction(uint _txID) external onlyOwners returns(bool) {
        TransactionData memory transactionToBeSent = transactionArray[_txID];
        require(transactionToBeSent.numberOfApproval >= minimumApprovalRequired, "minimum approval not reached yet);
        require(transactionToBeSent.status == false, "This transaction has been fulfilled");
        transactionArray[_txID].status = true;
        uint amountToSend = transactionToBeSent.amount;
        address addressTo = transactionToBeSent.toAddress;
        // bool success = payable(addressTo).send(amountToSend);
        payable(addressTo).transfer(amountToSend);
        return true;
    }

    receive() external payable {}

}

// Assignment: write another example of proof of existence contract(to be submitted)