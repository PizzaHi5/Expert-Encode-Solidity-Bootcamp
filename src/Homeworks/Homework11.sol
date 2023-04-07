// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract Homework11 {

    function solidityDiv(uint256 num, uint256 den) external pure returns (uint256) {
        return num/den;
    }

    function yulDiv(uint256 num, uint256 den) external pure returns (uint256) {
        assembly {
            mstore(0x20, div(num, den))
            return(0x20, 0x20)
        }
    }
}