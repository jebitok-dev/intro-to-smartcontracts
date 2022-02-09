// SPDX-License-Identifier: MIT;

pragma solidity 0.8.4;

contract WhitelistContract {
    mapping(address => bool) internal WhitelistedAddresses;
    modifier paymentRequired {
        require(msg.value == 1000);
        _;
    }

    function isWhiteListed(address _address) external view returns(bool) {
        return WhitelistedAddresses[_address];
    }

    function Whitelist(address _address) external paymentRequired payable {
        WhitelistedAddresses[_address] = true;
    }

    function blackList(address _address) external {
        WhitelistedAddresses[_address] = false;
    }

}

// whitelisted accounts have some priviledges
