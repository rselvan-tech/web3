//SPDX-License-Identifier: None

pragma solidity ^0.8.18;

contract BytesAccess{
    bytes3 public data=0x616263;  // 'a', 'b', 'c'

    function getFirstByte() public view returns(bytes1){
        return data[0]; // 0x61 ('a')
    }

    function getSecondByte() public view returns(bytes1){
        return data[1]; // 0x62 ('b')
    }
}