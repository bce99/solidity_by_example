// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract DataLocations {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function example() external returns(uint[] memory){
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456;

        uint[] memory memArr = new uint[](3);
        memArr[0] = 1999;
        return memArr;
    }

    function _internal(uint[] calldata y) private pure returns(uint){
        uint x = y[0];
        return x;
    }
}