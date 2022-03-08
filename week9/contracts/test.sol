pragma solidity ^0.8.4;

import {IN, fillinData} from "./libraries/appendData.sol";
contract test11 {
    using fillinData for IN;
    mapping(uint256 => IN) insss;

    function fillIn(IN calldata _in) external {
        _in.reg(insss);
    }
}
