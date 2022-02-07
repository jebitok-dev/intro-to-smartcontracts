// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract Intro {
    uint256 num = 5;
    // public, private, external, internal
    // state immutability of a function
    function theFirstThing() public {
        num = num + 1;
        // remix automatically compiles for you
    }
}

contract Intro1 {
    string firstName;
    string lastName;
    uint256 age;
    string Address;
    enum 

    constructor (
        string memory _firstName,
        string memory _lastName, 
        uint256 _age,
        string memory _Address 
    ) {
        firstName = _firstName;
        lastName = _lastName;
        age = _age;
        Address = _Address
    }
}

contract ATM {

    //authentication
    //check balance
    // withdraw
    // transfer
    // buy airtime
    // internet sub

    address admin;
    uint256 atmBalance

    constructor() {
        admin = msg.sender;
        atmBalance = 100000;
    }

    modifier onlyAdmin {
        require(msg.sender == admin, "Only admin is allowed to call this function")
    }

    function changeAdmin() public onlyAdmin{

    }

    fallback() external payable{}

    function atmBalance() public returns(uint256) {
        return address(this).balance;
    }

    function withdraw(uint _amount) public onlyAdmin{
        (bool sent, bytes data) = msg.sender.call {value: _amount * 10**18}("");
        require(sent, "unable to send");
    }
    // lowlevels calls to send ether...you'll get results back either boolean
    // won't revert. Callback data you get from smart contract 
    //call .get using lowlevel call
    function transfer(address to, uint256 amount) public payable returns {
        require(msg.value == amount, "check the amount you are sending");
        payable(to).transfer(amount);
        return true; 
       }
}
