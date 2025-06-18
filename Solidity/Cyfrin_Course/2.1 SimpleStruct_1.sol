//**************************************************Struct*******************************************************
//**************************************************************************************************************
//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract SimpleStruct{

    struct Person{                   //Array
        string name;
        uint favNum;
    }

    Person public ram=Person("Ram",10);
    Person public shyam=Person({name: "Shyam",favNum:20});


}
