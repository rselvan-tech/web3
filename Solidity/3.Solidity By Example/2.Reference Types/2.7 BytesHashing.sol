// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract BytesHashing {
    bytes2 public value = 0xabcd;

    function getKeccak256() public view returns (bytes32) {
        return keccak256(abi.encodePacked(value));
    }
}
