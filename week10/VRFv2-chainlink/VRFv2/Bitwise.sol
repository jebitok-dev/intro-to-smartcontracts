function toNumericTraits(
    uint256 _randomNumber,
    int16[NUMERIC_TRAITS_NUM] memory _modifiers,
    uint256 _hauntId
) internal pure returns (int16[NUMERIC_TRAITS_NUM] memory numericTraits_) {
    if (_hauntId == 1) {
        for (uint256 i; i < NUMERIC_TRAITS_NUM; i++) {
            uint256 value = uint8(uint256(_randomNumber >> (i * 8)));
            if (value > 99) {
                value /= 2;
                if (value > 99) {
                    value = uint256(keccak256(abi.encodePacked(_randomNumber, i))) % 100;
                }
            }
            numericTraits_[i] = int16(int256(value)) + _modifiers[i];
        }
    } else {
        for (uint256 i; i < NUMERIC_TRAITS_NUM; i++) {
            uint256 value = uint8(uint256(_randomNumber >> (i * 8)));
            if (value > 99) {
                value = value - 100;
                if (value > 99) {
                    value = uint256(keccak256(abi.encodePacked(_randomNumber, i))) % 100;
                }
            }
            numericTraits_[i] = int16(int256(value)) + _modifiers[i];
        }
    }
}