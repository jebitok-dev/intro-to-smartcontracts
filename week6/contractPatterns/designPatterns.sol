// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
// access control - onlyOwner

contract testAccess {
    address tokenAddress;
    address admin;

    constructor() {
        admin = msg.sender;
    }

    function setTokenAddress(address _tokenAddress) public {
        require(msg.sender == admin, "you are not admin");
        tokenAddress = _tokenAddress;
    }

    function getAdmin() public view returns(address) {

    }
}

//describe something broke or stopped working
// SamCzsun
interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns(bool);
}

contract TestCircuitBreaker {
    IERC20 token = IERC20(0x34d9297629323795CE29190159206cDD81e6B2d2);
    uint256 age;
    string name;
    bool paused;

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
    }

    function Claim() public {
        require(paused == false, "this function is currently not available");
        token.transfer(msg.sender, 20);
    }

    function toggleClaim() public {
        require(msg.sender == admin, "only admin please"); // modifier to re-use
        paused = !paused;
    }
}