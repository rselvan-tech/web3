// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./MathLib.sol";

contract UseMathLib {
    function doubleValue(uint256 val) public pure returns (uint256) {
        return MathLib.double(val);
    }
}
