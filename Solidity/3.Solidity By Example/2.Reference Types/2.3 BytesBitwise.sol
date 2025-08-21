// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract BytesBitwise {
    bytes1 public a = 0x0f; // 00001111
    bytes1 public b = 0xf0; // 11110000

    function andOperation() public view returns (bytes1) {
        return a & b; // 00000000
    }

    function orOperation() public view returns (bytes1) {
        return a | b; // 11111111
    }

    function xorOperation() public view returns (bytes1) {
        return a ^ b; // 11111111
    }

    function notOperation() public view returns (bytes1) {
        return ~a; // 11110000
    }
}