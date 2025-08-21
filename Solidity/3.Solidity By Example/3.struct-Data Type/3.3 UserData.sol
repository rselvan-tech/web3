// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract UserData {
    struct User {
        uint256 id;
        bool isActive;
    }

    function demonstrateMemoryValue() public pure returns (uint256, uint256) {
        // 1. Create a User struct in MEMORY
        User memory originalUser = User({id: 10, isActive: true});

        // 2. Assign it to another memory variable. This creates a full COPY.
        User memory copiedUser = originalUser;

        // 3. Modify the copy
        copiedUser.id = 99;

        // 4. The original is unchanged. This is true value-type behavior.  <<<<<<<<<<<This is wrong.Orginial is changed>>>>>>>>>>>>>>>>>>>>>>>>
        assert(originalUser.id == 99);
        assert(copiedUser.id == 99);

        return (originalUser.id, copiedUser.id); // Returns (10, 99)
    }
}
