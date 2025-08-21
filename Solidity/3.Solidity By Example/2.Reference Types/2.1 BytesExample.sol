// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ByteExamples {
    bytes1 public b1 = 0x61;            // ASCII for 'a'
    bytes2 public b2 = 0x6162;          // 'a' = 0x61, 'b' = 0x62
    bytes3 public b3 = 0x616263;        // 'abc'
    bytes4 public b4 = bytes4("test");  // "test" fits in 4 bytes
    bytes4 public b41 = "test";         // "test" fits in 4 bytes
    bytes32 public b32 = "hello";       // Fills first 5 bytes, rest are 0x00

    string public s = "test";
    // bytes4 public b = s;            ❌ Compile-time type error -> TypeError: Type string storage ref is not implicitly convertible to expected type bytes4.
    // bytes4 public b = bytes4(s);    ❌ Compile-time type error -> TypeError: Explicit type conversion not allowed from "string storage ref" to "bytes4".
}