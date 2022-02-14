// SPDX-License-Identifier: MIT;

pragma solidity 0.8.4;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/extensions/IERC20Metadata.sol";

contract ERC20Token is IERC20Metadata {
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint)) private _allowances;

    constructor(string memory name_, string memory symbol_, uint8 decimals_, uint256 totalSupply_) {
        _name = name_;
        _symbol = symbol_;
        _decimals = decimals_;
        _totalSupply = totalSupply_ * 10 ** decimals_;
        _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    function name() external override view returns (string memory) {
        return _name;
    }

    function symbol() external override view returns(string memory) {
        return _symbol;
    }

    function decimals() external override view returns(uint8) {
        return _decimals;
    }

    function balanceOf(address account) external override view returns (uint256) {
        return _balances[account];
    }

    function totalSupply() external override view returns(uint256) {
        return _totalSupply;
    }

    function _transfer(address _from, address _to, uint256 _amount) public {
        uint256 userBalance = _balances[msg.sender];
        require(userBalance >= _amount, "insufficient balance");
        _balances[_from] -= _amount;
        _balances[_to] += _amount;
    }

    function transfer(address _to, uint256 _amount) external override returns(bool) {
        // uint256 userBalance = _balances[msg.sender];
        // require(userBalance >= _amount, "insufficient balance");
        _transfer(msg.sender, _to, _amount);
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }

    function approve(address _spender, uint256 _amount) external override returns (bool) {
        _allowances[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }

    function allowance(address _owner, address _spender) public override view returns(uint256) {
        return _allowances[_owner][_spender];
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) external override returns(bool) {
        uint256 _allowance = allowance(_from, msg.sender);
        require(_allowance >= _amount, "Insufficient allowance");
        _allowances[_from][msg.sender] -= _amount;
        _transfer(_from, _to, _amount);
        return true;
    }
}