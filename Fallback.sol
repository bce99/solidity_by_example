// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/*
Fallback executed when
- function doesn't exist
- directly send ETH

Ether sent to contract-> if msg.data is not empty -> fallback()
--> if msg.data is empty and receive() exists -> receive()
--> if msg.data is empty and receive() does not exist -> fallback()
*/

contract Fallback {
    event Log(string func, address sender, uint value, bytes data);
    fallback() external payable {
        emit Log("fallbackfunc", msg.sender, msg.value, msg.data);
    }
    receive() external payable {
        emit Log("receivefunc", msg.sender, msg.value, "");
    }
}