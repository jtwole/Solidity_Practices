// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.7;
contract ItMapping {
    mapping(address => uint) public balances;
    mapping(address => bool) public inserted;
    address[] public keys;
// creat first mapping
// create second mapping to to insert first mapping keys as true
// creat an array to push new keys into
    function set (address _key, uint _value) external {
        balances[_key] = _value;

        if(!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
       
    }
    function getSize () external view returns (uint) {
        return keys.length;
    }
    function first () external view returns (uint) {
        return balances[keys[0]];
    }
     function last () external view returns (uint) {
        return balances[keys[keys.length - 1]];
    }
     function Any (uint i) external view returns (uint) {
        return balances[keys[i]];
    }
} 