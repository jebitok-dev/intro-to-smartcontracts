function ownerOf(uint256 tokenId) public view virtual override returns(address) {
	require(_exists(tokenId), "ERC721A: owner query for nonexistent token");

	uint256 lowestTokenToCheck;
	if(tokenId >= maxBatchSize) {
		lowestTokenCheck = tokenId - maxBatchSize + 1;
  }

	for(uint256 curr = tokenId; curr >= lowesrTokenToCheck; curr--) {
		address owner = _owners[curr];
		if(owner != address(0)) {
			return owner;
		}
	}
		revert("ERC721A: unable to determine the owner of token");
}