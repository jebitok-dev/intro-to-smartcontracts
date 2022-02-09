// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Storage {
    uint256 number;

    function store(uint256 num) public returns(uint) {
       return number = num;
    }

    function callStore(uint _x) public returns(uint256 X) {
        return 
        store(_x);
    }

    function retrieve() public view returns(uint256) {
        return number;
    }
}