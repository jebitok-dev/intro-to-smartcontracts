// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract TestContract {

    string[5] stringArray;
// Array initialised/declared outside a function has a location of "store"
//uint[5] numberArray2 = [uint(50), 60, 70, 80, 90];
    function fixedStringArray() public returns(string[5] memory) {
        stringArray = ["one", "two", "three", "four", "five"];
        return stringArray;
    }
// Array initialised inside a function has a location of "memory"
// Memory variables are temporary and cannot be declared outside a function
    function fixedNumberArray() public pure returns(uint[5] memory) {
        uint[5] memory numberArray = [uint(50), 60, 70, 80, 90];
        return numberArray;
    }
// Dynamic array of length = 10
    function dynamicArray() external pure {
        uint[] memory newArray = new uint[](10);
        newArray[1] = (0);
    }
}