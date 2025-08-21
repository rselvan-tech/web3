// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract BytesToString {
    bytes4 public data = 0x74657374; // "test"
    string public str = "test";

    // bytes4 public b = str;            ❌ Compile-time type error -> TypeError: Type string storage ref is not implicitly convertible to expected type bytes4.
    // bytes4 public b = bytes4(str);    ❌ Compile-time type error -> TypeError: Explicit type conversion not allowed from "string storage ref" to "bytes4".
    // bytes4 public b = "test";         ✅ This behavior is explicitly allowed by the Solidity compiler for string literals only, not dynamic strings.

    // Solidity does not allow implicit or explicit conversion from string (which is a dynamic array) to bytes4.
    // ✅ Correct Way to Convert string → bytes4
    //     You need to convert the string to bytes first, then cast it, but this must be done inside a function, not directly at the state variable level.

    function stringToBytes4() public view returns (bytes4) {
        bytes memory b = bytes(str);
        require(b.length >= 4, "Too short");
        return bytes4(b);
    }

    function bytes4toString() public view returns (string memory) {
        bytes memory temp = new bytes(4);
        for (uint i = 0; i < 4; i++) {
            temp[i] = data[i];
        }
        return string(temp); // returns "test"
    }

/*
Summary
*******
Direction	      Allowed?	    Notes
bytes → bytes4	    ✅	       First 4 bytes, runtime check
bytes4 → bytes	    ❌	       Not allowed directly; use workaround

✅ Typecasting bytes → bytes4 (Allowed with care)
*************************************************
You can typecast a dynamic bytes to a fixed-size bytes4 if the bytes array is at least 4 bytes long.

Example:

bytes memory dynamicBytes = hex"01020304";
bytes4 fixedBytes = bytes4(dynamicBytes); // OK if length >= 4

This takes the first 4 bytes of dynamicBytes and stores them in bytes4.

But if dynamicBytes.length < 4, this will revert at runtime (as of newer Solidity versions).

❌ Typecasting bytes4 → bytes (Not allowed directly)
*****************************************************
You cannot directly typecast a bytes4 to bytes. Solidity doesn’t allow this because bytes4 is a value type (fixed-length), while bytes is a reference type (dynamically-sized in memory).

This will throw a type error:

bytes4 fixedBytes = 0x12345678;
bytes memory dynamicBytes = bytes(fixedBytes); // ❌ Error

✅ Workaround for bytes4 → bytes
***********************************
If you want to convert a bytes4 into a bytes, you need to manually allocate memory:

bytes4 fixedBytes = 0x12345678;
bytes memory dynamicBytes = new bytes(4);
for (uint i = 0; i < 4; i++) {
    dynamicBytes[i] = fixedBytes[i];
}

*/
}
