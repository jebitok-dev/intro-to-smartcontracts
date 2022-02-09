// SPDX-License-Identifier: MIT;

pragma solidity 0.8.4;

interface IWhitelist {
    function isWhiteListed(address _address) external view returns(bool);
    function Whitelist(address _address) external payable;
}