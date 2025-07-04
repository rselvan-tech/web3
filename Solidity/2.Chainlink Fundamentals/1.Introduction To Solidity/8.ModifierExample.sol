// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Owned {
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _; // This placeholder is replaced with the function code
    }
    
    function setOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}