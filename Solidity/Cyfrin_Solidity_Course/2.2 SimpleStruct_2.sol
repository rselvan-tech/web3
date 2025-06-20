//**************************************************Array of Struct*******************************************************
//**************************************************************************************************************
//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract SimpleStruct{

    struct Person{                   //Array
        string name;
        uint favNum;
    }

    Person[] public people;

    function addPerson(string memory _name,uint _favNum)public {
        people.push(Person(_name,_favNum));

    }

}
