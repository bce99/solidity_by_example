// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract PiggyBank {
    event Deposit(uint amount);
    event Withdraw(uint amount);

    address public owner = msg.sender;

    receive() external payable {
        emit Deposit(msg.value);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    function withdraw() external {
        require(msg.sender == owner, "not the owner");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}