// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract IterableMappings {
    mapping(address => uint) balances;
    mapping(address => bool) inserted;
    address[] public keys;

    function setBal(address _key, uint _val) external {
        balances[_key] = _val;

        if (!inserted[_key]) {
            keys.push(_key);
            inserted[_key] = true;
        }
    } 

    function getSize() external view returns(uint) {
        return keys.length;
    }

    function getFirst() external view returns(uint) {
        return balances[keys[0]];
    }

    function getLast() external view returns(uint) {
        return balances[keys[keys.length-1]];
    }

    function getNth(uint _nth) external view returns(uint) {
        return balances[keys[_nth -1]];
    }
}