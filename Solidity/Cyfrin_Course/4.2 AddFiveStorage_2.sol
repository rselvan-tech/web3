//**************************************Inherit a contract*******************************************************
//**************************************Add a function********************************************************
//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {SimpleStorage} from "./1.2 SimpleStorage_1.sol";

contract AddFiveStorage is SimpleStorage{
    function sayHello()public pure returns(string memory){
        return "Hello World";
    }

}