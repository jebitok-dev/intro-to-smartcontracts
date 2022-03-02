fallback() external payable {
    LibDiamond.DiamondStorage storage ds;
    bytes32 position = LibDiamond.DIAMOND_STORAGE_POSITION;
    assembly {
        ds.slot := position
    }
    address facet =
        ds.facetAddressAndSelectorPosition[msg.sig].facetAddress;
    require(facet != address(0));

    assembly {
        calldatacopy(0, 0, calldatasize())
        let result := delegatecall(
            gas(),
            facet,
            0,
            calldatasize(),
            0,
            0,
        )
        returndatacopy(0, 0, returndatasize())
        switch result
            case 0 {
                revert(0, returndatasize())
            }
            default {
                return(0, returndatasize())
            }
    }
}
