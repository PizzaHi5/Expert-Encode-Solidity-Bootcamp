// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

contract Homework6 {
    function secondYulFxn() public payable returns (uint256) {
        assembly {
            return(callvalue(), 0x20)
        }
    }
}