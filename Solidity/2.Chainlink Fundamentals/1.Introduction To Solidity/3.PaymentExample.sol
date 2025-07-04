//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract PaymentExample {
    mapping(address => uint256) public payments;
    
    // Function that can receive ETH
    function makePayment() public payable {
        require(msg.value > 0, "Must send some ETH");
        payments[msg.sender] += msg.value;
    }
    
    // Function that checks if minimum payment was made
    function verifyMinimumPayment(uint256 minimumAmount) public view returns (bool) {
        return payments[msg.sender] >= minimumAmount;
    }
}