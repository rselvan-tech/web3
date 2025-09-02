//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract SimpleStorage {
    uint public favouriteNumber;

    function store(uint fnum) public virtual {
        favouriteNumber = fnum;
    }

    //view, pure
    function get() public view returns (uint) {
        return favouriteNumber;
    }
}
