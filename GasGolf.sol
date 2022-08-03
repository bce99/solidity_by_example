// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract GasGolf {
    // Start - 50530 gas
    // Gas saving techniques 
    // use calldata - 48785 gas
    // load state variable to memory - 48574 gas
    // short circuit - 48256 gas
    // loop increments - 48226 gas
    // cache array length - 48191 gas
    // load array elements to memory - 48029 gas

    uint public total;
    // [1, 2, 3, 4, 5, 100]
    function sumIfEvenAndLessThan99(uint[] calldata nums) external {
        uint _total = total;
        uint len = nums.length;
        for (uint i = 0; i <len; ++i) {
            uint num = nums[i];
            if (num % 2 == 0 && num < 99) {
                _total += num;
            }
        }
        total = _total;
    }
}