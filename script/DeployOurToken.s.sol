// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {OurToken} from "src/OurToken.sol";

contract DeployOurToken is Script {
    uint256 public INITIAL_SUPPLY = 100 ether;

    function run() external returns (OurToken) {
        vm.startBroadcast();
        OurToken ot = new OurToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return (ot);
    }
}
