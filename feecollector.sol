pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT
contract FeeCollector{
    address public owner;
    uint256 public balance;

    constructor(){
        owner = msg.sender;
    }
    receive() payable external{
        balance += msg.value;
   }
   function withdraw(uint amount, address payable destAdrr) public {
    require(msg.sender == owner, "only owner can withdraw");
    require(amount <= balance, "yetersiz bakiye");
    destAdrr.transfer(amount);
    balance -= amount;
   }
}
