// SPDX-License-Identifer: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdrawn(uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient funds");
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}

//Key Concept
//mapping - Likes a dictionary (key-value pair)
//msg.sender - The address calling the function
//msg.value - The amount of Ether sent
//payable - Enables receiving and sending ether