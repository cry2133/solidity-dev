 
 // SPDX-License-Identifier: MIT

pragma solidity 0.8.7;
 contract FoundMe {
 
 function fund(uint256 minValue) public payable {
        require(msg.value >= minValue, "You need to spend more ETH!");
      
    }

 }