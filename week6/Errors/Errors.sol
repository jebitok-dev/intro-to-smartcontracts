// SPDX-License-Identifier: MIT;

pragma solidity 0.8.4;

contract ErrorContract {
    uint a;
    function throwError() external {
        a = 10;
        // BOOM error!
        // gas will be consumed: avoid errors: trigger them if one of your arguemnets of function are out of range
    }

    function throwErr() external {
        // was the first to be used in solidity and was depricated
        // throw
    }
        
        uint b;
    function revertErr() view external {
        // specify why it was reverted
        if(b == 10) {
            revert("this is why it reverts");
        }
    }

    function requireErr() view external {
        require(a != 10, 'this is why it reverts');
        // errors that can happen in lifecycle method of the contract
    }

    function assertErr() view external {
        assert(a != 10);
        // can never happen in the smart contract
    }

    function willThrow() pure external {
        // revert("because reasons"); //view on deploy
        require(true == false, 'because reasons');
        assert(true == false);
    }

    function foo() external returns(bool) {
        B c = new B();
        address(c).call(abi.encodePacked("bar()"));
        return false;
    }
}

contract B {
    function bar() pure external {
        revert("because of other reasons");
    }
}