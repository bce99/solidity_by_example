// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract TestMultiCall {
    function func1() external view returns (uint, uint) {
        return (1, block.timestamp);
    }

    function func2() external view returns (uint, uint) {
        return (2, block.timestamp);
    }

    function getfunc1() external pure returns (bytes memory) {
        // abi.encodeWithSignature("func1()");
        return abi.encodeWithSelector(this.func1.selector);
    }

    function getfunc2() external pure returns (bytes memory) {
        // abi.encodeWithSignature("func2()");
        return abi.encodeWithSelector(this.func2.selector);
    }
}

contract MultiCall {
    function multiCall(address[] calldata targets, bytes[] calldata data) external view returns (bytes[] memory) {
        require(targets.length == data.length, "length mismatch between targets and data");
        bytes[] memory results = new bytes[](data.length);

        for(uint i; i < data.length; i++) {
            (bool success, bytes memory result) = targets[i].staticcall(data[i]);
            require(success, "call failed");
            results[i] = result;
        }

        return results;
        // 0x00000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000062e89439
        // 0x00000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000062e89439
    }
}