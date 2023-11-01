// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {Voting_System} from "../src/Voting_System.sol";

contract DeploySimpleStorage is Script {
    function run() external returns (Voting_System) {
        vm.startBroadcast();
        Voting_System votingSystem = new Voting_System();
        vm.stopBroadcast();
        return votingSystem;
    }
}
