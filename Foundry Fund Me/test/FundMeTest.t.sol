// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    // Here we will deploy the contract
    function setUp() external {
        fundMe = new FundMe(0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910);
    }

    function testMinimumDollarIsFive() public view {
        assertEq(5e18, fundMe.MINIMUM_USD(), "Minimum dollar should be 5");
    }

    function testOwnerIsMsgSender() public view {
        assertEq(
            fundMe.getOwner(),
            address(this),
            "Owner should be msg.sender"
        );
    }

    function testPriceFeedVersionIs4() public view {
        uint256 version = fundMe.getVersion();
        console.log("Price feed version: %d", version);
        assertEq(version, 4, "Price feed version should be 4");
    }
}
