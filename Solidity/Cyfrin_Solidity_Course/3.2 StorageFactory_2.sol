//**************************************Create a Contract from another contract*******************************************************
//**************************************and interact with contract using ABI*******************************************************
//SPDX-License-Identifier: MIT 

pragma solidity 0.8.18;

import "./1.2 SimpleStorage_1.sol";

contract StorageFactory{
    SimpleStorage public simpleStorage;

    function createSimpleStorageContract() public {
        simpleStorage= new SimpleStorage();
    }

    function storeSF(uint favNum) public {
        simpleStorage.store(favNum);
    }

    function getSF() public view returns(uint){
        return simpleStorage.get();
    }
}