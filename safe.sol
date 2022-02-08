// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract Safe {
    mapping(address => uint256) public balance;

    uint totalBalance;

    function save() public payable returns(bool) {
        require(msg.value != 0, "you cannot deposit 0 amount");
        balance[msg.sender] += msg.value;
        totalBalance += msg.value;
        return true;
    }
    // have to test vulnerability of contract before deploying it
    //out smart a contract i.e front-running
    function withdrw(uint amount) public returns(bool) {
        require(balance[msg.sender] >= 10 ether);
        require(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;
        totalBalance -= amount;
        payable(msg.sender).transfer(amount);
        return true;
    }

    function forceWithdraw() public returns(bool) {
        uint balanceOfUser = balance[msg.sender];
        uint penalty =balanceOfUser * (0.05 * 100000);
        balance[msg.sender] -= 0;
        totalBalance -= balanceOfUser;
        payable(address(this)).transfer(penalty/100000);
        payable(msg.sender).transfer(balanceOfUser - (penalty/10000));
    }

    function get() public returns(uint256) {
        return 1 days;
    }
}
