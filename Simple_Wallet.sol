// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Wallet {
    address payable public owner;
    constructor() {
        owner = payable (msg.sender);
    }
    receive() external payable {}
    function withdraw(uint _amount) payable public {
        require(owner == msg.sender, "invalid owner address");
        (bool success,) = payable(msg.sender).call{value: _amount}("");
        require(success, "send failed");
    }
    function checkBalance() public view returns (uint){
    return address(this).balance;
    }
}