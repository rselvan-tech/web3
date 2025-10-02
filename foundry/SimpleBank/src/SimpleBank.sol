//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

event Deposit(address indexed sender,uint256 amount,uint256 timestamp);
event Withdraw(address indexed receiver,uint256 amount,uint256 timestamp);

contract SimpleBank{
    address[] public depositors;
    mapping(address=>uint256) public balances;

    function deposit()public payable{

        require(msg.value > 0, "Must deposit some ETH");

        if ( balances[msg.sender] == 0 ){
            depositors.push(msg.sender);
        }
        balances[msg.sender]+=msg.value;
        emit Deposit(msg.sender,msg.value,block.timestamp);

    }

    function withdraw(uint amount)public{
        
        require ( balances[msg.sender] >= amount, "not enough fund to withdraw");

        payable(msg.sender).transfer(amount);                         // transfer()
        balances[msg.sender]-= amount;

        emit Withdraw(msg.sender,amount,block.timestamp);    

        /*
        bool sent=payable(msg.sender).send(amount);                   // send()
        require(sent,"Withdraw Failed");
        balances[msg.sender]-= amount;
        */

        /*
        bool (success,)=payable(msg.sender).call{value:amount}("");   // call()
        require(success,"Withdraw Failed");
        */
    }

    function balance()public view returns(uint256){
        return balances[msg.sender];
    }
}