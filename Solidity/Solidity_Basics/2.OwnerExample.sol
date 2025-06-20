//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract OwnerExample {
    address public owner;
    
    constructor() {
        owner = msg.sender; // The address that deploys the contract becomes the owner
    }
}