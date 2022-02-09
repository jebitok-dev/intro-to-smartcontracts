// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "./IWhitelist.sol";

contract Calculator {
    IWhitelist WhitelistContractInstance;

    constructor(address WhitelistContractAddr) {
        WhitelistContractInstance = IWhitelist(WhitelistContractAddr);
    }

    function addition(uint256 firstVal, uint256 secondVal) external pure returns(bool status, uint256 result) {
        
        bool isWhiteListed = callIsWhiteListed(msg.sender);
        if(!isWhiteListed) status = false; result = 0;
        return(true, firstVal + secondVal);
    }

    function subtract(uint256 firstVal, uint256 secondVal) external view returns(bool status, uint256 result) {
        bool isWhiteListed = callIsWhiteListed(msg.sender);

        if(!isWhiteListed) return (result = 0);

        return(true, firstVal - secondVal);
    }

    function callIsWhiteListed(address addr) internal view returns(bool status) {
        status = WhitelistContractInstance.isWhiteListed(addr);
    }

}