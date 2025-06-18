//**************************************Create a Contract array *******************************************************
//**************************************and interact with contract using ABI*******************************************
//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {SimpleStorage} from "./1.2 SimpleStorage_1.sol";

contract StorageFactory{
    SimpleStorage[] public storageContracts;

    function createStorageContract() public {
        storageContracts.push(new SimpleStorage());
    }

    function storeSF(uint256 id, uint favNum) public{
 //       storageContracts[id].store(favNum);
       SimpleStorage temp=storageContracts[id];
       temp.store(favNum);
    }

    function getSF(uint256 id) public view returns(uint){
        return storageContracts[id].get();
    }
}