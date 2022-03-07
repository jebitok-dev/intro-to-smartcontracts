import { Signer } from 'ethers'
import { ethers, network } from 'hardhat'
const UNIROUTER = '0xf164fC0Ec4E93095b804a4795bBe1e041497b92a'
const USDT = '0xdAC17F958D2ee523a2206206994597C13D831ec7'
const USDTHolder = '0x428e42D4cCBd57E2B4613DC066bcBC28C82a16Fc'
const UNI = '0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984'
const amountIn = 10000e6

async function swap() {
  const provider = await ethers.provider
  const usdtSigner:Signer = await ethers.getSigner(USDTHolder)
  const router = await ethers.getContractAt('IRouter', UNIROUTER, usdtSigner)
  const usdtContract = await ethers.getContractAt('IERC20', USDT, usdtSigner)
  const uniContract = await ethers.getContractAt('IERC20', UNI)
  console.log(`balance before${await uniContract.balanceOf(USDTHolder)} `)
  console.log(`setting balance to 1000ether`)

  await network.provider.send('hardhat_setBalance', [
    USDTHolder,
    '0x1000000000000000000000000000',
  ])
  //@ts-ignore
  await hre.network.provider.request({
    method: 'hardhat_impersonateAccount',
    params: [USDTHolder],
  })

  console.log(`approving ${UNIROUTER} to spend ${amountIn}`)
  await usdtContract.approve(UNIROUTER, amountIn)

  console.log(`swapping ${amountIn}USDT`)

  await router.swapExactTokensForTokens(
    amountIn,
    0,
    [USDT, '0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2', UNI],
    USDTHolder,
    16466093203,
  )

  console.log(`Balance now is ${await uniContract.balanceOf(USDTHolder)}`)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
swap().catch((error) => {
  console.error(error)
  process.exitCode = 1
})