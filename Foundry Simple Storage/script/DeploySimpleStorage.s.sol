// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// We need to import the Script contract to define our script.
import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    // run is the function that will be executed when the script is run.
    function run() external returns (SimpleStorage) {
        /*
        We need initialize a vm Broadcaster to be able to broadcast transactions.
        And stop this broadcaster after we are done.

        Everything after vm.startBroadcast() will be send to RPC.
        */
        vm.startBroadcast();
        SimpleStorage simpleStorage = new SimpleStorage();
        vm.stopBroadcast();

        return simpleStorage;
    }
}
