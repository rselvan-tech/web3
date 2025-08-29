//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConvertor{

    function getPrice() public view returns(int256){
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (
        /* uint80 roundId */,
        int256 answer,
        /*uint256 startedAt*/,
        /*uint256 updatedAt*/,
        /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        return answer;
    }

    function getPriceConversion(uint256 amount)public view returns(uint256){
        uint256 ethPrice=uint256(getPrice());   /* Price with 8 decimals */
        ethPrice = ethPrice * 10**10;           /* Price with 18 decimals */
        uint256 priceUSD= ( amount * ethPrice )/ 10**18;
        return priceUSD;
    }

}