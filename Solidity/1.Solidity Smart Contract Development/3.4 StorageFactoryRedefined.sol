//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {SimpleStorage} from "./1.2 SimpleStorage_1.sol";

contract StorageFactory{
    SimpleStorage public ss;
    address public owner;
    event SimpleStorageCreated(address indexed newContract);

    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender==owner, "Only owner can call this function");
        _;
    }

    function createSimpleStorage()public onlyOwner{
        ss=new SimpleStorage();
        emit SimpleStorageCreated(address(ss));
    }


}