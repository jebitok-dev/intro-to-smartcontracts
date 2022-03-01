import {expect} from "chai";
import {ethers} from "hardhat";
import {Greeter} from "../contracts";

let Greeteeer: Greeter;

const deployedContract = "";
const text: string = "WE DID THIS BEFORE TESTING";
describe("check that greeting is saved onchain", function () {
  before(async function () {
    const Greeteeer = (await ethers.getContractAt(
      "Greeter",
      deployedContract
    )) as Greeter;
    await Greeteeer.setGreeting(text);
  })

    it("should return the new greeting once it's changed",
    async function () {
        const currentGreeting: string = await Greeteeer.great();
        expect(currentGreeting).to.equal(text);
    });
});
