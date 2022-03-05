// SPDX-License-Identifier: MIT;

pragma solidity ^0.8.4;

interface IERC20 {
    function codeHash(address owner) external returns(uint256);
    function balanceOf(address owner) external returns(uint256);
}