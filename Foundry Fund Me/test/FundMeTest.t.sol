// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    // Here we will deploy the contract
    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
    }

    function testMinimumDollarIsFive() public view {
        assertEq(5e18, fundMe.MINIMUM_USD(), "Minimum dollar should be 5");
    }

    function testOwnerIsMsgSender() public view {
        assertEq(fundMe.getOwner(), msg.sender, "Owner should be msg.sender");
    }

    function testPriceFeedVersionIs4() public view {
        uint256 version = fundMe.getVersion();
        console.log("Price feed version: %d", version);
        assertEq(version, 4, "Price feed version should be 4");
    }
}
