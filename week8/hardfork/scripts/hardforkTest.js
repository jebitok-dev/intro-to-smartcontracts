import {ethers} from "hardhat";

async function checkEther() {
  const address = "0x6635f83421bf059cd8111f180f0727128685bae4";
  const Ether = ethers.getContractAt(
    "IERC20",
    "0x2ce271ac90acd69529f6a5340f090c336a993741",
    console.log(await (await Ether).balanceOf(address))
  );
  const bal = await Ether.balanceOf(address);
  console.log(bal);
}

checkEther().catch((err) => {
  console.log(err);
  process.exitCode = 1;
});

const bal = await Ether.balanceOf(address);
console.log(bal);
