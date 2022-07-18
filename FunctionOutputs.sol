// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FunctionOutputs {
    function returnsMany() public pure returns(uint, bool) {
        return (1, true);
    }

    function namedReturnsMany() public pure returns(uint x, bool b) {
        x = 1;
        b = false;
    }

    function destructingAssignments() public pure returns(uint){
        (uint x, ) = returnsMany();
        return x;
    }
}