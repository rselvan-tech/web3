//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {ERC20} from "@openzeppelin/contracts@4.6.0/token/ERC20/ERC20.sol";
import {AccessControl} from "@openzeppelin/contracts@4.6.0/access/AccessControl.sol";

contract MyERC20 is ERC20,AccessControl{
    bytes32 public constant MINTER_ROLE=keccak256("MINTER_ROLE");

    constructor() ERC20("My KRISHNA Token","KRISH"){
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE,msg.sender);
    }

    function mint(address to, uint256 amount ) public onlyRole(MINTER_ROLE){
        _mint(to,amount);
    }

}

