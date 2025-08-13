// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract BytesCasting {
    bytes4 public a = 0x11223344;

    function castToBytes2() public view returns (bytes2) {
        return bytes2(a); // Truncates to 0x1122
    }

    function castToBytes1() public view returns (bytes1) {
        return bytes1(a); // 0x11
    }

    function castToUint32() public view returns (uint32) {
//        return uint32(bytes4(a)); // 0x11223344 as uint32 = 287454020
        return uint32(a); // 0x11223344 as uint32 = 287454020
    }
}
