//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

import "./5.2.1 PriceConvertor.sol";

contract FundMeUSD{
    address public immutable i_owner;
    uint256 public constant MINIMUM_USD=25;

    address[] public funders;
    mapping(address=>uint256) public addressToAmount;

    constructor(){
        i_owner=msg.sender;
    }

    function fund() public payable{
        require(PriceConvertor.getPriceConversion(msg.value) >= MINIMUM_USD,"Insufficient ETH");
        funders.push(msg.sender);
        addressToAmount[msg.sender]=msg.value;
    }

    function withdraw() public onlyOwner{

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

    function version() public view returns(uint256){
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function decimals() public view returns(uint8){
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.decimals();
    }

}