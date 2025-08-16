//**************************************Create a Contract from another contract*******************************************************
//************************************************************************************************************************************
//SPDX-License-Identifier: MIT 

pragma solidity ^0.8.18;

import "./1.2 SimpleStorage_1.sol";

contract StorageFactory{
    SimpleStorage public simpleStorage;

    function createSimpleStorageContract() public {
        simpleStorage= new SimpleStorage();
    }
}