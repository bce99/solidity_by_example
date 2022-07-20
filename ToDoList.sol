// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ToDoList {
    struct ToDo {
        string text;
        bool completed;
    }

    ToDo[] public todos;

    function create(string calldata _text) external {
        todos.push(ToDo({text: _text, completed: false}));
    }

    function updateTextArr(uint _index, string calldata _text) external {
        todos[_index].text = _text; // more gas efficient for single action
    }

    function updateTextStorage(uint _index, string calldata _text) external {
        ToDo storage todo = todos[_index];
        todo.text = _text; // more gas efficient when multiple fields are altered
    }

    function get(uint _index) external view returns (string memory, bool) {
        return (todos[_index].text, todos[_index].completed);
    }

    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }

    function getLength() external view returns(uint) {
        return todos.length;
    }

}