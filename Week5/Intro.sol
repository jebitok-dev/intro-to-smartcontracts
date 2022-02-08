// SPDX-License-Identifier: UNLICENSE

pragma solidity ^0.8.4;

contract first {
    uint currentID;

    struct Profile {
        uint id;
        string name;
    }

    mapping(address => Profile) public addressToProfile;

    Profile[] profiles;

    modifier onlyOneAccount(address creator) {
        require(addressToProfile[creator].id == 0, "you can only create one account");
        _;
    }

    function createProfile(address creator, string memory _name) public onlyOneAccount(creator) {
        Profile memory userProfile = Profile(currentID, _name);
        profiles.push(userProfile);
        addressToProfile[msg.sender].id == 0;
        currentID = currentID + 1;
    }

    function getProfile(address userAddress) external view returns(Profile memory) {
        return addressToProfile[userAddress];
    }
}