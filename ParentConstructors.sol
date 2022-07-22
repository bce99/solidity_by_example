// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

contract U is S("s"), T("t") {
    // static, static
}

contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {
        //dynamic, dynamic
    }
}

contract VV is S("s"), T {
    constructor(string memory _text) T(text) {
        // static, dynamic
    }
}

