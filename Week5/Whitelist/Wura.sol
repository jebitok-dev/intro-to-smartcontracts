//SPDX-License-Identifier: MIT;

absrcact contract WuraContract is IWura {
    mapping(address => bool) internal WhiteListedAddresses;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier paymentRequired {
        require(msg.value == 1000);
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function isWhiteListed(address _address) external override view returns(bool) {
        return WhiteListedAddresses[_address];
    }

    function blacklist(address _address) external onlyOwner {
        
    }
}
