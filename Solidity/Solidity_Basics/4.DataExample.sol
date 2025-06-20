//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract DataExample {
    bytes public lastCallData;
    
    // Store the raw calldata of the latest transaction
    function recordCallData() public {
        lastCallData = msg.data;
    }
    
    // View the size of the calldata
    function getCallDataSize() public view returns (uint256) {
        return lastCallData.length;
    }
}