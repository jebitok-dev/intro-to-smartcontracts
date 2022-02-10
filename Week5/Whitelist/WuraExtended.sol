//SPDX-License-Identifier: MIT

pragma solidity 0.8.4;

import "./Iwura.sol";
contract WuraExtended is NuraContract(address[0]) {
    constructor(address owner1) WuraContract(owner) {
        firstNumber = 2;
    }

    function WhiteList(address _address) external override paymentRequired payable {
        WhiteListedAddresses[_address] = true;
    }
 }


