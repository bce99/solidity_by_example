// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract KillContract {
    constructor() payable {}

    function kill() external {
        selfdestruct(payable(msg.sender));
    }

    function testCall() external pure returns (uint) {
        return 123;
    }
}

contract Helper {
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    function kill(KillContract _kill) external {
        _kill.kill();
    }
}