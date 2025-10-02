//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "../lib/forge-std/src/Script.sol";
import {SimpleBank} from "../src/SimpleBank.sol";
import {console} from "../lib/forge-std/src/console.sol";

contract DeploySimpleBank is Script{

    /*
    Split run() into multiple individual functions
    function run() public {
        vm.startBroadcast();
        SimpleBank sb=new SimpleBank();
        console.log("Balance : ",sb.balance());
        bytes memory payload= abi.encodeWithSignature("deposit()");
        (bool success,)=payable(address(sb)).call{value: 0.5 ether}(payload);
        require(success,"Deposit failed");
        console.log("Balance : ",sb.balance());
        vm.stopBroadcast();
    }
    */

    function deploy() public{
        vm.startBroadcast();
        SimpleBank sb=new SimpleBank();
        console.log("Deployed at :", address(sb));
        vm.stopBroadcast();
    }
    function deposit(address addr) public{
        vm.startBroadcast();
        SimpleBank sb2=SimpleBank(payable(addr));
        console.log("Balance :",sb2.balance());
        sb2.deposit{value: 1 ether}();
        console.log("Balance :",sb2.balance());
    }
    function withdraw(address addr,uint256 amount) public{
        vm.startBroadcast();
        SimpleBank sb2=SimpleBank(payable(addr));
        console.log("Balance :",sb2.balance());
        sb2.withdraw(amount);
        console.log("Balance :",sb2.balance());
    }
}