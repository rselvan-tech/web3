//SPDX-License-Identifier: MIT

/*
The address type comes in two largely identical flavors:

    address: Holds a 20 byte value (size of an Ethereum address).

    address payable: Same as address, but with the additional members transfer and send.

The idea behind this distinction is that address payable is an address you can send Ether to, while you are not supposed to send Ether to a plain address.
*/

pragma solidity ^0.8.18;

contract AddressExample1{
    
    function getBalance(address addr) public view returns(uint256){
        return (addr.balance);
    }

    function sendEther(address payable recipient) public payable {
        recipient.transfer(msg.value);                        // "send" and "transfer" are only available for objects of type "address payable", not "address".
    }

    function isContract(address addr)public view returns(bool){
        return (addr.code.length > 0);
    }

}

