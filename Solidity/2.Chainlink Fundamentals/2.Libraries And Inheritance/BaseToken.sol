//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract BaseToken{
    string public name;
    uint256 public totalSupply;

    constructor(string memory _name){
        name=_name;
        totalSupply=100000;
    }

    function getInfo() public view returns(string memory){
        return string.concat("Token : ",name);
    }

}

contract GoldToken is BaseToken{
    constructor() BaseToken("Gold Token"){}

    function getSymbol() public pure returns(string memory){
        return "GLD";
    }
}