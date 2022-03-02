### Should you use Diamonds

Pros:

- Facet reusability
- Modular upgradeability
- Modular permission system
- Storage slot management
- Avoiding max contract size issues

Cons:

- More Complexity
- Harder to maintain
- Not many big real life projects yet
- Not supported by tools like Etherscan, but an alternative for at least Etherscan exists: Louper

- DiamondCut
- DiamondStorage
- DiamondLoupe
- implementation of Diamond: 
    - diamond-1-hardhat (Simple implementation)
    - diamond-2-hardhat (Gas-optimized)
    - diamond-3-hardhat (Simple loupe functions)
- Add Function
    - adding it to the array
    - updating the mapping
    - incrementing the total function count
- Remove Functions
    - find out the position in the array by checking its position from the mapping (selectorPosition).
    -  removing elements from the middle of an array in Solidity, one creates empty slots in the array. That's why we also have to copy over the currently last selector to the empty slot and call pop.

    ### Resources
    - [LibDiamond - Github](https://github.com/mudgen/diamond-1-hardhat/blob/9a1bbf8699ae142b561f9196eb757410dedc5492/contracts/libraries/LibDiamond.sol)
    - [LibDiamod - TypeScript Code- Github](https://github.com/Timidan/diamond-3-hardhat-typechain/blob/main/contracts/libraries/LibDiamond.sol)
    - [Diamond Standard Article](https://soliditydeveloper.com/eip-2535)
    - [Diamond Standard Images for better understanding](https://www.google.com/search?q=diamond+standard+pattern+in+solidity&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiiv9GS7Kf2AhWchP0HHSolBa0Q_AUoAnoECAEQBA&biw=767&bih=708&dpr=1.25)