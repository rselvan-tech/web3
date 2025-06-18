//**************************************************Array of Struct + Mapping*******************************************************
//**************************************************************************************************************
//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract SimpleStruct{

    struct Person{                   //Array
        string name;
        uint favNum;
    }

    Person[] public people;
    mapping(string=>uint) public nameToFavNum;

    function addPerson(string memory _name,uint _favNum)public {
        people.push(Person(_name,_favNum));
        nameToFavNum[_name]= _favNum;
    }

}
