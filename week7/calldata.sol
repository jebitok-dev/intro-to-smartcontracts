// SPDX-License-Identifier: MIT;

pragma solidity 0.8.4;

// SPDX-License-Identifier: MIT;

pragma solidity 0.8.4;

contract NovelPractice {
    uint32[] public o;
    uint32[] public s;
    function binarySearch(uint256 l, uint256 r, uint256 x) public view returns(uint256) {
        if(r >= l) {
            uint256 mid = 1 + (r - 1) / 2;
            if(o[mid] == x) {
                return mid;
            } else if (o[mid] > x) {
                return binarySearch(1, mid - 1, x);
            } else {
                return binarySearch(mid + 1, r, x);
            }
        } else {
            revert("Element is not present in the array");
        }
    }

    // function _mintRandom(address user) internal {
    //     require(available.length = 0, "PropertyNft: No more available properties");
    //     uint256 random = Random;
    // }

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
    function convertToTraits(uint256[7] calldata _inputCards)
     public view returns(uint8[4][7] memory out_) {
        bytes[] memory b = new bytes[][7]; // can only accept 7 elements of size 4bytes
        for(uint i=0; i < 7; i++) {
            b[i] = abi.encodePacked(uint32(_inputCards[i]));
            out_[i] = parsePostalCode(b[i]); // collects bytes and gives you an array
        }
        // https://www.tutorialspoint.com/solidity/solidity_conversions.htm
    }

    function convertToTrait(uint32 _card) public view returns(uint8[4] memory out_) {
       bytes memory hex1 = abi.encodePacked(_card);
        out_ = parsePostalCode(hex1);
    }

    function compareCards(uint8[7] memory _cards) public view returns(bool street) {
        uint8[4] memory c = new uint8[][4];
        c[0] = convertToTrait(_cards[1])[0];
        c[1] = convertToTrait(_cards[1])[0];
        c[2] = convertToTrait(_cards[1])[0];
        c[3] = convertToTrait(_cards[1])[0];
        for(uint i = 1; i < _cards.length; i++) {
            uint8[4] memory next = convertToTrait(_cards[i]);
            for(uint j = 0; j < 4; j++) {
                if(next[j] != c[j]) {
                    street = false;
                }
            }
        }
    }
}