// SPDX-License-Identifier: MIT;

pragma solidity 0.8.4;

contract FunctionModifers {
    // uint a = 10;
    address admin;
    function basicSyntax(uint a) external myModifier(a) myModifier2(a) {
        // modifier is executed first then placeholder which is the function
    }

    function onlyPerson() external onlyAdmin() {
        
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "only admin can call this function");
        _;
    }

    modifier myModifier(uint a) { // internal by default
        require(a == 10, "my error message");
        _; // placeholder that stands for function
    }

       modifier myModifier2(uint a) { // internal by default
        require(a == 10, "my error message");
        _; // placeholder that stands for function
    }
    // first modifier then next & foo function
}