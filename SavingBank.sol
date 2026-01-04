// SPDX-License-Identifier: GPL-3.0
pragma solidity > 0.5.0 <=0.9.0;
contract SavingAccnt {
    address public owner;
    constructor(){
        owner=msg.sender;
    }
    function deposit() public payable{
        require(msg.value>0, "Deposited amount must be greater than 0");
    }  
    function balance() public returns(uint){
        return address(this).balance;
    }
    function withdraw(uint _amt) public{
        require(msg.sender==owner, "Only owner can withdraw");
        require(_amt<address(this).balance, "Insufficient Balance");
        payable(owner).transfer(_amt);
    }
}
