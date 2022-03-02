interface IDiamondCut {
    enum FacetCutAction {Add, Replace, Remove}

    struct FacetCut {
        address facetAddress;
        FacetCutAction action;
        bytes4[] functionSelectors;
    }

    function diamondCut(
        FacetCut[] calldata _diamondCut,
        address _init,
        bytes calldata _calldata
    ) external;
}
contract FacetA {
  struct FacetData {
    address owner;
    bytes32 dataA;
  }

  function facetData()
    internal
    pure
    returns(FacetData storage facetData) {
    bytes32 storagePosition = keccak256("diamond.storage.FacetA");
    assembly {facetData.slot := storagePosition}
  }

  function setDataA(bytes32 _dataA) external {
    FacetData storage facetData = facetData();
    require(facetData.owner == msg.sender, "Must be owner.");
    facetData.dataA = _dataA;
  }

  function getDataA() external view returns (bytes32) {
    return facetData().dataA;
  }
}