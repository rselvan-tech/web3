/*
✅ Integer Types (uint, int) Members in Solidity
**************************************************

In Solidity 0.8.x and above, integers (uint, int, uint256, int256, etc.) do have some useful members: Common Integer Members:

.bitLength: Returns the bit-width of the integer type

.min: Minimum value for the type

.max: Maximum value for the type
*/

//SPDX-License-Identifier: None

pragma solidity ^0.8.18;

contract IntegerExample{

    function getUintLimits() public pure returns(uint min,uint max){
        min=type(uint).min;
        max=type(uint).max;
    }

      function getIntLimits() public pure returns(int min,int max){
        min=type(int).min;
        max=type(int).max;
    }
}