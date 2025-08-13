// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AutomationCompatible.sol";

// This contract demonstrates Chainlink Automation with custom performData
contract QueueProcessor is AutomationCompatibleInterface {
    uint256[] public numberQueue; // Array to simulate a queue of numbers
    uint256 public processedCount; // Counter for processed numbers
    uint256 public lastProcessedNumber; // Stores the last number processed
    uint256 public lastUpkeepTimestamp; // Timestamp of the last upkeep execution

    event NumberProcessed(uint256 indexed _number, uint256 _timestamp);
    event UpkeepPerformed(uint256 _timestamp);

    constructor() {
        lastUpkeepTimestamp = block.timestamp;
        // Add some initial numbers to the queue for demonstration
        numberQueue.push(10);
        numberQueue.push(20);
        numberQueue.push(30);
    }

    // Function to add numbers to the queue (can be called by anyone)
    function addNumberToQueue(uint256 _number) public {
        numberQueue.push(_number);
    }

    /**
     * @notice This function is called off-chain by Chainlink Automation nodes.
     * It checks if there are numbers in the queue to process.
     * If so, it returns true and encodes the next number into performData.
     * @param checkData Not used in this example, but can be passed from Automation registration.
     * @return upkeepNeeded True if there are numbers to process.
     * @return performData The ABI-encoded number to be processed.
     */
    function checkUpkeep(
        bytes calldata checkData
    )
        external
        view
        override
        returns (bool upkeepNeeded, bytes calldata performData)
    {
        // Example logic: upkeep is needed if there are numbers in the queue
        upkeepNeeded = numberQueue.length > 0;

        // If upkeep is needed, prepare the performData
        if (upkeepNeeded) {
            // Get the first number from the queue without removing it yet
            uint256 nextNumberToProcess = numberQueue[0];
            // ABI-encode the number to be passed to performUpkeep
            performData = abi.encode(nextNumberToProcess);
        } else {
            // If no upkeep is needed, performData should be empty
            performData = "";
        }
    }

    /**
     * @notice This function is called on-chain by a Chainlink Automation node
     * when checkUpkeep returns true. It utilizes the performData to process the number.
     * @param performData The ABI-encoded number passed from checkUpkeep.
     */
    function performUpkeep(
        bytes calldata performData
    )
        external
        override
    {
        // Ensure this function can only be called by the AutomationRegistry or trusted actors.
        // The 'override' keyword and contract structure usually handle this implicitly
        // by making sure the caller has permission to call this interface function.

        // Decode the performData to get the number
        uint224 numberToProcess = abi.decode(performData, (uint224)); // Use uint224 to save gas, as numbers likely won't exceed this.

        // Perform the actual processing logic
        lastProcessedNumber = numberToProcess;
        processedCount++;
        numberQueue.pop(); // Remove the processed number from the end (or shift from beginning, depending on queue implementation)

        lastUpkeepTimestamp = block.timestamp;

        emit NumberProcessed(numberToProcess, block.timestamp);
        emit UpkeepPerformed(block.timestamp);
    }
}