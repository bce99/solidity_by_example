// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

library Math {
    function max(uint _x, uint _y) internal pure returns (uint) {
        return _x >= _y ? _x : _y; 
    }
}

contract Test {
    function testMax(uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }
}

library ArrLib {
    function find(uint[] storage _arr, uint _x) internal view returns (uint) {
        for (uint i = 0; i< _arr.length; i++) {
            if (_arr[i] == _x) {
                return i;
            }
        }
        revert("not found");
    } 
}

contract TestArray {
    using ArrLib for uint[];
    uint[] public arr = [4,1,5];

    function testFind() external view returns (uint) {
        // return ArrLib.find(arr, 4);
        return arr.find(5);
    }
}