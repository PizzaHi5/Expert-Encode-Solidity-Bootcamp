// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface Isolution5 {
    function solution(bytes32 b, bytes32 ex, bytes32 modulus) external returns (bytes32 result);
}


contract Level_5_Solution {
        
    function solution(bytes32 b, bytes32 ex, bytes32 modulus) external pure 
    returns (bytes32 result) {

        // Implement your solution here.
        assembly {
            result := mulmod(b, ex, modulus)
        }
    }
    
}