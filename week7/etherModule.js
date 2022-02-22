import {BigNumber, ethers} from "ethers";

const BigNumber = require('ethers');

function turnToWei(val) {
    console.log(Bi)
}

function turnToEther(val) {
    const val1 = new ethers.BigNumber.from(val)
    console.log(new ethers.BigNumber.from(val1))
}

turnToEther('10000000000000000000')
turnToEther('function balanceOf(address owner)')

console.log(ethers.utils.solidityKeccak256(['string'], ['function  balanceOf(address owner') external returns]))

let val3 = "Web3 Bridge!";

function functionSignature(val3) {
    let byte32 = ethers.utils.formatBytes32String(val3)
    console.log(ethers.utils.parseBytes32String(bytes32))
}
