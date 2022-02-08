// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;


import "./Intro.sol";

contract Demo {
    function createProfileInDemoContract(address demoAddress, string memory name) public {
        Demo demoInstance = Demo(demoAddress);
        demoInstance.createProfile(name);
    }
}