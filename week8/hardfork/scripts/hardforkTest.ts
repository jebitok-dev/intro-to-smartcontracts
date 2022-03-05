//@ts-ignore
import {ethers} from "hardhat";
import {BigNumber, BigNumberish, BytesLike, providers, Signer} from "ethers";

async function checkEther() {
  const address = "0x6635f83421bf059cd8111f180f0727128685bae4";
  const Ether = ethers.getContractAt(
    "IERC20",
    "0x2ce271ac90acd69529f6a5340f090c336a993741"
  );
  const bal = await ethers.balanceOf(address);
  console.log("balance before", bal);
//@ts-ignore
  await hre.network.provider.request({
    method: "hardhat_impersonateAccount",
    params: [address],
  });

  const signer:Signer = await ethers.getSigner(address);
  //@ts-ignore
  // await DAI.connect(signer).transfer(address, "1000000000000"); //has a lower balance than one being sent
  const together: BytesLike = new ethers.utils.AbiCoder().encode(
    ['address', 'uint256'],
    [address, 2],
  )

  const position:BytesLike = ethers.utils.solidityKeccak256(
    //@ts-ignore
    [bytes],
    [together],
  )
  const dec:BigNumberish = BigNumber.from(position);
      //@ts-ignore
  const balance = await providers.getStorageAt(Ether.address, dec)
  console.log(balance)
  await ethers.provider.send("hardhat_setStorageAt", [
    Ether.address,
    position,
    '0x00000000000000000000000000000000000000000000000000000000000f4240',
    "f4240",
  ])
}

checkEther().catch((err) => {
  console.log(err);
  process.exitCode = 1;
});
//@ts-ignore

// run $ npx hardhat run scripts/hardforkTest.ts --network localhost