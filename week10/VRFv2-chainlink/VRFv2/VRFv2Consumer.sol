// SPDX-License-Identifier: MIT
// An example of a consumer contract that relies on a subscription for funding.
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/LinkTokenInterface.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

contract VRFv2Consumer is VRFConsumerBaseV2 {
  VRFCoordinatorV2Interface COORDINATOR;
  LinkTokenInterface LINKTOKEN;

  // Your subscription ID.
  uint64 s_subscriptionId;

  // Rinkeby coordinator. For other networks,
  // see https://docs.chain.link/docs/vrf-contracts/#configurations
  address vrfCoordinator = 0x6168499c0cFfCaCD319c818142124B7A15E857ab;

  // Rinkeby LINK token contract. For other networks,
  // see https://docs.chain.link/docs/vrf-contracts/#configurations
  address link = 0x01BE23585060835E02B77ef475b0Cc51aA1e0709;

  // The gas lane to use, which specifies the maximum gas price to bump to.
  // For a list of available gas lanes on each network,
  // see https://docs.chain.link/docs/vrf-contracts/#configurations
  bytes32 keyHash = 0xd89b2bf150e3b9e13446986e571fb9cab24b13cea0a43ea20a6049a85cc807cc;

  // Depends on the number of requested values that you want sent to the
  // fulfillRandomWords() function. Storing each word costs about 20,000 gas,
  // so 100,000 is a safe default for this example contract. Test and adjust
  // this limit based on the network that you select, the size of the request,
  // and the processing of the callback request in the fulfillRandomWords()
  // function.
  uint32 callbackGasLimit = 100000;

  // The default is 3, but you can set this higher.
  uint16 requestConfirmations = 3;

  // For this example, retrieve 2 random values in one request.
  // Cannot exceed VRFCoordinatorV2.MAX_NUM_WORDS.
  uint32 numWords =  1;

  uint256[] public s_randomWords;
  uint256 public s_requestId;
 // uint32[6] public traits;
  address s_owner;

  constructor(uint64 subscriptionId) VRFConsumerBaseV2(vrfCoordinator) {
    COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
    LINKTOKEN = LinkTokenInterface(link);
    s_owner = msg.sender;
    s_subscriptionId = subscriptionId;
  }

  // Assumes the subscription is funded sufficiently.
  function requestRandomWords() external onlyOwner {
    // Will revert if subscription is not set and funded.
    s_requestId = COORDINATOR.requestRandomWords(
      keyHash,
      s_subscriptionId,
      requestConfirmations,
      callbackGasLimit,
      numWords
    );
  }
  
  function fulfillRandomWords(
    uint256, /* requestId */
    uint256[] memory randomWords
  ) internal override {
    s_randomWords = randomWords;
  }

  modifier onlyOwner() {
    require(msg.sender == s_owner);
    _;
  }

function peek() public view returns(bytes memory){
  return abi.encodePacked(s_randomWords[0]);
}


  function resolveNo(bytes calldata in__) public view returns(uint256[6] memory traits,uint256[6] memory tees) {
  uint256 f=uint256(bytes32(in__[:4])) %100;
uint256 s=uint256(bytes32(in__[4:8])) %100;
uint256 t=uint256(bytes32(in__[8:12])) % 100;
uint256 fo=uint256(bytes32(in__[12:16])) % 100;
uint256 fif=uint256(bytes32(in__[16:20])) % 100;
uint256 six=uint256(bytes32(in__[20:24])) % 100;
traits[0]=f;
traits[1]=s;
traits[2]=t;
traits[3]=fo;
traits[4]=fif;
traits[5]=six;

tees[0]=uint256(bytes32(in__[:4]));
tees[1]=uint256(bytes32(in__[4:8]));
tees[2]=uint256(bytes32(in__[8:12]));
tees[3]=uint256(bytes32(in__[12:16]));
tees[4]=uint256(bytes32(in__[16:20]));
tees[5]=uint256(bytes32(in__[20:24]));
//return traits;
}

// function see() public view returns(uint32[6] memory){
//   return traits;
// }

}