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

    function createProdile(string memory _name) public {
        Profile memory userProfile = Profile(currentID, _name);
        profiles.push(userProfile);
        addressToProfile[msg.sender].id == 0;
        currentID = currentID + 1;
    }

    function getProfile(address userAddress) external view returns(Profile memory) {
        return addressToProfile(userAddress);
    }
}