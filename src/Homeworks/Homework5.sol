// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17; 

contract Homework5 {
    uint256 amount;

    function firstYulFxn() public pure returns (uint256) {
        assembly{
            let value := add(0x07, 0x08)
            mstore(0x40, value)
            return(0x40, 32)
        }
    }
    /**
        Opcode Version
        60 PUSH1   0x07
        60 PUSH1   0x08
        2  ADD
        52 MSTORE  0x40
        F3 RETURN  0x20

     */
}