// SPDX-License-Identifier: MIT
// 1. Pragma
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    // Here we will deploy the contract
    function setUp() external {
        fundMe = new FundMe(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
    }

    // Test the contract
    function testMinimumDollarIsFive() public view {
        assertEq(5e18, fundMe.MINIMUM_USD(), "Minimum dollar should be 5");
    }
}
