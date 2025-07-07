//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import "./MathUtils.sol";

contract Calculator{

    function getMinimum(uint256 a,uint256 b) public pure returns(uint256){
        return MathUtils.min(a,b);
    }
        function getMaximum(uint256 a,uint256 b) public pure returns(uint256){
        return MathUtils.max(a,b);
    }

}