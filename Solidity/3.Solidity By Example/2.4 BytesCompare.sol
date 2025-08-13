// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract BytesCompare {
    bytes2 public a = 0x1234;
    bytes2 public b = 0x1234;
    bytes2 public c = 0x5678;

    function isEqual() public view returns (bool) {
        return a == b; // true
    }

    function isNotEqual() public view returns (bool) {
        return a != c; // true
    }
}
