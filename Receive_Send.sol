// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.7;
contract ReceiveEth{
    event log (string word, address owner, uint val, bytes data, uint gas);
    fallback() external payable {
        emit log ("fallBack", msg.sender, msg.value, msg.data, gasleft());
    }
    receive() external payable {
        emit log("recieve", msg.sender, msg.value, "", gasleft());
    }
    function getBalance() external view returns(uint) {
        return address(this).balance;
    }
}
contract SendEth{
    constructor() payable{}
    function transferSend(address payable _recipient) public payable {
        //not recomended
        _recipient.transfer(msg.value);

    }
    function sendSend(address payable _recipient) public payable {
        //still not recomended
        bool success = _recipient.send(msg.value);
        require(success, "send unsuccessful");
    }
    function callSend(address payable _recipient) public payable {
        (bool success,) = _recipient.call{value:msg.value}("");
        require(success, "call unsuccessful");
    }
}