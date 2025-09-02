//SPDX-License-Indentifier: MIT

pragma solidity ^0.8.18;

import {Script} from "../lib/forge-std/src/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script{
    function run() public returns(SimpleStorage){
        vm.startBroadcast();
        SimpleStorage simplestorage=new SimpleStorage();
        vm.stopBroadcast();
        return simplestorage;
    }
}