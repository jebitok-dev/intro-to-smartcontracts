// SPDX-License-Identifier: MIT;

pragma solidity 0.8.4;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract buyW3B {
    IERC20 web3BridgeToken;

   uint256 startDate = block.timestamp;
   uint256 EndDate = startDate + 2 days;

   uint256 rate = 100;

   uint256 minimumBuy;
   uint256 maximumBuy;

   event Buy(address by, uint256 value);

    constructor(address web3BridgeTokenAddr, uint256 _maximumBuy, uint256 _minimumBuy) {
        web3BridgeToken = IERC20(web3BridgeTokenAddr);
        minimumBuy = _minimumBuy;
        maximumBuy = _maximumBuy;
    }

    function buy() public payable{
        require(block.timestamp >= startDate, "token sale not started yet");
        require(block.timestamp <= EndDate, "Sorry, you missed");
        require(msg.value >= minimumBuy, "you can't buy below minimum buy");
        require(msg.value <= maximumBuy, "You can't buy above maximum buy");

        web3BridgeToken.transfer(msg.sender, msg.value * rate);
        emit Buy(msg.sender, msg.value * rate);
    }

    function checkBalance() external view returns(uint256) {
        return address(this).balance;
    }

    function checkTokenBalance() public view returns(uint256) {
        return web3BridgeToken.balanceOf(address(this));
    }
}