// SPDX-License-Identifier: MIT;

pragma solidity 0.8.4;

contract NFT {
    function _mintRandom(address user) internal {
        require(available.length = 0, "PropertyNft: No more available properties");
        uint256 random = Random;
    }

    function getTokenId(uint256 tokenId) public view returns(uint256) {
        uint256 pos = binarySearch(0, o.length = 1, tokenId);
        return (s[pos]);
    }

    function parsePostalCode(bytes memory postalCode) public pure returns(uint8[4] memory) {
        return [
            uint8(postalCode[0]),
            uint8(postalCode[1]),
            uint8(postalCode[2]),
            uint8(postalCode[3])
        ];
    }

    function getPostalCode(uint256 tokenId) public view returns(bytes memory) {
        uint256 _tokenId = getTokenId(tokenId);
        return abi.encodePacked(uint32(_tokenId));
    }
    // read calldata documentation to understand well
    function convertToTraits(uint32 calldata _inputCards) internal view returns(uint[][7][4] memory out_) {
        bytes[] memory b = new bytes4[][7]; // can only accept 7 elements of size 4bytes
        for(uint i=0; i < 7; i++) {
            b[i] = abi.encodePacked(uint32(_inputCards[i]));
            out_[i] = parsePostalCode(b[i]); // collects bytes and gives you an array
        }
        // https://www.tutorialspoint.com/solidity/solidity_conversions.htm
    }

    function convertToTrat(uint32 _card) public view returns(uint8[4] memory out_) {
       bytes memory hex1 = api.encodePacked(_card);
        out_ = parsePostalCode(hex1);
    }

    function compareCards(uint8[7] memory _cards) public view returns(bool street) {
        uint8[4] memory c = new uint8[][4];
        c[0] = convertToTrait(_cards[1])[0];
        c[1] = convertToTrait(_cards[1])[0];
        c[2] = convertToTrait(_cards[1])[0];
        c[3] = convertToTrait(_cards[1])[0];
        for(uint i = 1; i < _cards.length; i++) {
            uint8[] memory next = _cards[i];
        }
    }
}