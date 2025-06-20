//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
contract PointerExample {
    // State array in storage
    uint256[] public storageArray = [1, 2, 3];
    bytes public message = "Hello, World";
    bytes[] public message2;
    
    function manipulateArray() public {
        // This creates a pointer to the storage array
        uint256[] storage storageArrayPointer = storageArray;
        
        // This modifies the actual storage array through the pointer
        storageArrayPointer[0] = 100;
        
        // At this point, storageArray is now [100, 2, 3]
        
        // This creates a copy in memory, not a pointer to storage
        uint256[] memory memoryArray = storageArray;
        
        // This modifies only the memory copy, not the storage array
        memoryArray[1] = 200;
        
        // At this point, storageArray is still [100, 2, 3]
        // and memoryArray is [100, 200, 3]

        message.push('z');
        message2.push('x');
    }
 
    function publicFunc(uint[] calldata data) public pure returns (uint) {
        return data.length;
    }

    function externalFunc(uint[] memory data) external pure returns (uint) {
        return data.length;
    }

}