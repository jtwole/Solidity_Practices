// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.7;
contract TodoList {
    enum State {
        Incomplete,
        Completed
    }
    //State status;
    struct  Todo {
        string text;
        State status;
    }
    uint public noOfTodos = 0;
    mapping (uint => Todo) public todos;
    event createdTodo(
        address indexed owner,
        string content
    );

    //Todo[] public todos;
    //Todo todo;
    function createTodo (string calldata _text) external {
        Todo storage todo = todos[noOfTodos + 1];
        todo.text = _text;
        todo.status = State.Incomplete;
        noOfTodos++;
        emit createdTodo(msg.sender, _text);
    }
    function update (uint _id, string calldata _text) external {
        todos[_id].text = _text;
    }
    function getAll () external view returns (Todo[] memory){
        //Todo storage item = todos[index];
        //return(item.text, item.status);
        Todo[] memory allTodo = new Todo[](noOfTodos);
        for(uint i = 0; i < (noOfTodos); i++){
            Todo storage todo = todos[i + 1];
            allTodo[i] = todo;
        }
        return allTodo;

    }
    function toggle (uint _id) external{
         //Todo storage item = todos[_id];
         //item.status = State.Completed;
         Todo storage todo = todos[_id];
         if (todo.status == State.Incomplete){
            todo.status = State.Completed;
         }
         else todo.status = State.Incomplete;
    }
}