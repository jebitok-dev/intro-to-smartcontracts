//@ts-ignore
import {ethers} from "hardhat";
import {Signer} from "ethers";

async function checkEther() {
  const address = "0x6635f83421bf059cd8111f180f0727128685bae4";
  const Ether = ethers.getContractAt(
    "IERC20",
    "0x2ce271ac90acd69529f6a5340f090c336a993741"
  );
  const bal = await Ether.balanceOf(address);
  console.log(bal);
//@ts-ignore
  await hre.network.provider.request({
    method: "hardhat_impersonateAccount",
    params: [address],
  });

  const signer:Signer = await ethers.getSigner(address);
  //@ts-ignore
  await DAI.connect(signer).transfer(address, "1000000000000"); //has a lower balance than one being sent
}

checkEther().catch((err) => {
  console.log(err);
  process.exitCode = 1;
});
//@ts-ignore
const bal = await Ether.balanceOf(address);
console.log(bal);
