// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Immutable {
    address public owner;
    // 43502 gas with "immutable"
    // 45635 gas without "immutable"

    constructor() {
        owner = msg.sender;
    }
    uint public x;
    function example() external {
        require(owner == msg.sender);
        x++;
    }
}