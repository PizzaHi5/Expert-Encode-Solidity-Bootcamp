// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

interface Isolution {
    function solution() external pure returns (uint8);
}

contract Level_0_Solution {

    function solution() external pure returns(uint8){
        return 42; // The part you will be implementing
    }
    
}