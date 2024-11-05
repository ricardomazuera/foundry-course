/*
Things to do:
1. Deploy mocks when we're on a local anvil chain
2. Keep track of contract address accross different chains
 */

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/mocks/MockV3Aggregator.sol";

contract HelperConfig is Script {
    NetworkConfig public activeNetwork;
    uint8 public constant DECIMALS = 8;
    int256 public constant INITIAL_ANSWER = 2000e8;

    struct NetworkConfig {
        address priceFeed;
    }

    constructor() {
        if (block.chainid == 11155111) {
            // Sepolia
            activeNetwork = getSepoliaEthConfig();
        } else {
            // Anvil
            activeNetwork = getOrCreateAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory config = NetworkConfig({
            priceFeed: 0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910
        });
        return config;
    }

    function getOrCreateAnvilEthConfig() public returns (NetworkConfig memory) {
        /*
        We have to do:
        1. Deploy the mocks
        2. Return the mock address
        */

        // We don't want to deploy a new mock everytime, so we'll check if the price feed is already set
        if (activeNetwork.priceFeed != address(0)) {
            return activeNetwork;
        }

        vm.startBroadcast();
        MockV3Aggregator mockPriceFeed = new MockV3Aggregator(
            DECIMALS,
            INITIAL_ANSWER
        );
        vm.stopBroadcast();

        NetworkConfig memory config = NetworkConfig({
            priceFeed: address(mockPriceFeed)
        });

        return config;
    }
}
