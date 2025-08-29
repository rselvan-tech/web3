//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FundMe{
    address public immutable i_owner;
    uint256 public constant MINIMUM_ETH= 0.01 ether;
    address[] public funders;
    mapping(address=>uint256) public addressToAmount;

    constructor(){
        i_owner=msg.sender;
    }

    function fund() public payable{
        require(msg.value >= MINIMUM_ETH,"Insufficient ETH");
        funders.push(msg.sender);
        addressToAmount[msg.sender]=msg.value;
    }

    function withdraw() public onlyOwner{

        /* Less efficient 
        for(uint index=0;index<funders.length;index++){
            addressToAmount[funders[index]]=0;
            funders[index]=address(0);
        }
        */

        for(uint index=0;index<funders.length;index++){
            addressToAmount[funders[index]]=0;
            funders[index]=address(0);
        }
        funders= new address[](0);

        (bool callSuccess,)=payable(i_owner).call{value: address(this).balance}("");
        require(callSuccess==true,"Withdraw Failed");
    }

    modifier onlyOwner(){
        require(msg.sender==i_owner,"Not a owner");
        _;
    }

}