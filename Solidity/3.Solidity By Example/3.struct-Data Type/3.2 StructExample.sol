//SPDX-License-Identifier: None

pragma solidity ^0.8.20;

contract Library{
    struct Book{
        string title;
        string author;
        uint pageCount;
    }
    Book public myBook;


    function example() public{
        // Method 1: Key-Value Initialization (Recommended)
        // You create and initialize the struct in memory.
        Book memory aGoodBook=Book({
            title:"The Hitchhiker's Guide",
            author:"Douglas Adams",
            pageCount:224
        });

        // Method 2: Positional Initialization (Order matters!)
        // This is less readable and can cause errors if the struct definition changes.
        Book memory anotherBook=Book("Dune", "Frank Herbert", 412);

        // Method 3: Declare first, then assign to a storage variable
        // Here we modify the state variable 'myBook' directly
        myBook.title="1984";
        myBook.author="George Orwell";
        myBook.pageCount=328;
    }
}