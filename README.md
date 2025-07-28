# PiggyBank Security Audit

## Vulnerabilities Identified

- Unrestricted `withdraw()` access
- Anyone could drain all ETH in the contract.

## Fix Applied

- Added `require(msg.sender == owner)` to `withdraw()`.

## Attack Demo

- `AttackPiggyBank` calls `withdraw()` on the vulnerable contract and receives all its funds.

## Deployment

- liskSepolia: <contract address>
