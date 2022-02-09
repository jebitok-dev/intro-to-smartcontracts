// SPDX-License-Identifier: 

pragma solidity ^0.8.4;

contract A {
    string name;

    function setName(string memory _name) external {
        name = _name;
    }

    function getName() external view returns(string memory) {
        return name;
    }
}

contract B {
    address contractA;
    constructor(address _contractA) {
        contractA = _contractA;
    }

    function AsetName(string memory a) external returns(bool) {
        (bool status,) = contractA.call(abi.encodeWithSignature("setName(string", a));
        require(status, "calling setName failed");
        return status;
    }

    function AssetName1() external returns(bytes memory) {
        (bool status, bytes memory data) = contractA.call(abi.encodeWithSignature("getName()"));
        require(status, "failed");
        return data;
    }

    
    function AssetName() external returns(bytes memory) {
        (bool status, bytes memory data) = contractA.call(abi.encodeWithSelector(A.getName.selector));
        require(status, "failed");
        return data;
    }
}