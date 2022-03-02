function removeFunctions(
    address _facetAddr,
    bytes4[] memory _functionSelectors
) internal {
  DiamondStorage storage ds = diamondStorage();
  uint256 selectorCount = ds.selectors.length;

  for (uint256 idx; idx < _functionSelectors.length; idx++) {
    bytes4 selector = _functionSelectors[idx];

    FacetAddressAndSelectorPosition memory old =
        ds.facetAddressAndSelectorPosition[selector];
    selectorCount--;

    if (old.selectorPosition != selectorCount) {
      // replace selector with last selector
      bytes4 lastSelector = ds.selectors[selectorCount];
      ds.selectors[old.selectorPosition] = lastSelector;
      ds.facetAddressAndSelectorPosition[lastSelector]
        .selectorPosition = old.selectorPosition;
    }

    // delete last selector
    ds.selectors.pop();
    delete ds.facetAddressAndSelectorPosition[selector];
  }
}

   function removeFunctions(address _facetAddress, bytes4[] memory _functionSelectors) internal {
        require(_functionSelectors.length > 0, "LibDiamondCut: No selectors in facet to cut");
        DiamondStorage storage ds = diamondStorage();
        uint256 selectorCount = ds.selectors.length;
        require(_facetAddress == address(0), "LibDiamondCut: Remove facet address must be address(0)");
        for (uint256 selectorIndex; selectorIndex < _functionSelectors.length; selectorIndex++) {
            bytes4 selector = _functionSelectors[selectorIndex];
            FacetAddressAndSelectorPosition memory oldFacetAddressAndSelectorPosition = ds.facetAddressAndSelectorPosition[selector];
            require(oldFacetAddressAndSelectorPosition.facetAddress != address(0), "LibDiamondCut: Can't remove function that doesn't exist");
            // can't remove immutable functions -- functions defined directly in the diamond
            require(oldFacetAddressAndSelectorPosition.facetAddress != address(this), "LibDiamondCut: Can't remove immutable function.");
            // replace selector with last selector
            selectorCount--;
            if (oldFacetAddressAndSelectorPosition.selectorPosition != selectorCount) {
                bytes4 lastSelector = ds.selectors[selectorCount];
                ds.selectors[oldFacetAddressAndSelectorPosition.selectorPosition] = lastSelector;
                ds.facetAddressAndSelectorPosition[lastSelector].selectorPosition = oldFacetAddressAndSelectorPosition.selectorPosition;
            }
            // delete last selector
            ds.selectors.pop();
            delete ds.facetAddressAndSelectorPosition[selector];
        }
    }