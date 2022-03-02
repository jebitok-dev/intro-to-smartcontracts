function addFunctions(
  address _facetAddr,
  bytes4[] memory _functionSelectors
) internal {
  DiamondStorage storage ds = diamondStorage();
  uint16 selectorCount = uint16(ds.selectors.length);

  for (uint256 idx; idx < _functionSelectors.length; idx++) {
    bytes4 selector = _functionSelectors[idx];

    ds.facetAddressAndSelectorPosition[selector] =
      FacetAddressAndSelectorPosition(_facetAddr, selectorCount);
    ds.selectors.push(selector);
    selectorCount++;
  }
}