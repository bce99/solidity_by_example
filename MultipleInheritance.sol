// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// Order of inheritance - from most base-like to derived

/*
    X
  / |
Y   |
  \ |
    Z

// Order of most base-like to derived: X,Y,Z

    X
  /   \
Y      A
|      |
|      B
 \     /
    Z
// X, Y, A, B, Z
*/

contract X {
    function foo() public pure virtual returns(string memory) {
        return "X";
    }

    function bar() public pure virtual returns(string memory) {
        return "X";
    }

    function x() public pure returns (string memory) {
        return "X";
    }
}

contract Y is X {
    function foo() public pure override virtual returns(string memory) {
        return "Y";
    }

    function bar() public pure override virtual returns(string memory) {
        return "Y";
    }

    function y() public pure returns (string memory) {
        return "Y";
    }
}

contract Z is X, Y {
    function foo() public pure override(X, Y) returns(string memory) {
        return "Z";
    }

    function bar() public pure override(Y, X) returns(string memory) {
        return "Z";
    }
}
