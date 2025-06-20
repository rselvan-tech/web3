//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract TimestampExample {
    uint256 public contractCreationTime;
    
    constructor() {
        contractCreationTime = block.timestamp;
    }
    
    // Check if a specified duration has passed since contract creation
    function hasDurationPassed(uint256 durationInSeconds) public view returns (bool) {
        return (block.timestamp >= contractCreationTime + durationInSeconds);
    }
    
    // Create a simple time lock that releases after a specified date
    function isTimeLockExpired(uint256 releaseTime) public view returns (bool) {
        return block.timestamp >= releaseTime;
    }
}