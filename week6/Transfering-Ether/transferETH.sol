// SPDX-License-Identifier: MIT;

pragma solidity 0.8.0;

contract MyContract {
    function sendEther(address payable to, uint amount) external {
        to.transfer(amount);
        // to.transfer(100); 
        // 1 wei = 10 ^ -18 ether = 0.000....1
    } // address payable/ sendable address

    function receiveEther() external payable {
        msg.value; // amount of ether balance
        address(this).balance;
    }

    fallback() external {
        //
    }

    receive() external payable{
        //
    }
}