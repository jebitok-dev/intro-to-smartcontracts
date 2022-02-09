pragma solidity ^0.8.4;
// this is a storage dynamic array its persistent on storage not memory(not wiped off)
contract arrays {
    uint[] test=[1, 2, 3];

    function get() public view returns(uint256[] memory){
        uint256[] memory test1 = new uint[](4);
        return test1;
    }

    function see() public view returns(uint[] memory) {
        return test;
    }
}

contract arr {
    uint [] arr;

    function foo() external {
        arr.push(2);
    }

    uint[4] arr;

    function 
}