// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract TimeBased{

    uint256 public counter;

    function count() public{
        counter++;
    }
}