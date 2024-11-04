// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";

contract DeployFundMe is Script {
    function run() external {
        vm.startBroadcast();
        new FundMe(0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910);
        vm.stopBroadcast();
    }
}
