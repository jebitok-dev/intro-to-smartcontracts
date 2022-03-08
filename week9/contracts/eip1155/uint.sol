uint256 baseTokenNFT = 12345 << 128;
uint128 indexNFT = 50;

uint256 baseTokenFT = 54321 << 128;

balanceOf(baseTokenNFT, msg.sender); // Get balance of the base token for non-fungible set 12345 (this MAY be used to get balance of the user for all of this token set if the implementation wishes as a convenience).
balanceOf(baseTokenNFT + indexNFT, msg.sender); // Get balance of the token at index 50 for non-fungible set 12345 (should be 1 if user owns the individual non-fungible token or 0 if they do not).