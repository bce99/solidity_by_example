// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// visibility
// private - only inside contract
// internal - only inside contract and child contracts
// public - inside and outside contract
// external - only from outside contract

contract VisibilityBase {
    uint public x;
    uint internal y;
    uint private z;

    function publicFunc() public pure returns (uint) {
        return 3;
    }

    function internalFunc() public pure returns (uint) {
        return 4;
    }

    function privateFunc() public pure returns (uint) {
        return 5;
    }

    function externalFunc() public pure returns (uint) {
        return 6;
    }

    function example() external view {
        x + y + z;

        publicFunc();
        internalFunc();
        privateFunc();

        this.externalFunc(); // very gas inefficient
    }
}

contract VisibilityChild is VisibilityBase {
    function example2() external view {
        x + y;

        internalFunc();
        publicFunc();
    }
}