// SPDX-License-Identifier: MIT;

pragma solidity ^0.6.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.1.0/contracts/math/SafeMath.sol";

contract myMathOperation {
    using SafeMath for uint256;

    function addMyMath(uint256 a, uint256 b) public view returns(uint256) {
        // return a + b;
        return a.add(b);
    }

    function subMyMath(uint256 b, uint256 d) public view returns(uint256) {
        return b.sub(d);
    }
}
