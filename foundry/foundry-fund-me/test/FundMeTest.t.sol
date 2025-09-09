//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test,console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

/*
contract FundmeTest is Test{
    
    function setUp() public pure{
        console.log("Start->Setup->");
    }

    function test_fun1() public pure{
        console.log("fun1().");
    }
    function test_fun2() public pure{
        console.log("fun2().");
    }
}
*/

contract FundMeTest is Test{
    FundMe fundme;

    function setUp() public{
        fundme=new FundMe();
    }

    function test_MinimumUSD() public view{
     console.log(fundme.MINIMUM_USD());
     assertEq(fundme.MINIMUM_USD(),5e18);   // 5e18= 5*10**18
    }
}