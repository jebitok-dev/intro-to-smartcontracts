// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract TestToken {
    mapping(address => uint256) public balances;
    string public name;
    string public symbol;
    uint256 public totalSupply;

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        balances[msg.sender] = _totalSupply;
    }

    function transfer(address _to, uint _amount) public returns(bool) {
        uint userBal = balances[msg.sender];
        require(_amount <= userBal, "insufficient balance");
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        return true;
    }
}