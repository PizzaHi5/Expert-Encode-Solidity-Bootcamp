// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

interface Isolution { 
    function solution(uint256[2] calldata firstArray, uint256[2] calldata secondArray) external returns (uint256[2] calldata finalArray);
}

contract Hw2 {

    function solution(
        uint256[2] calldata firstArray, 
        uint256[2] calldata secondArray
        ) external pure returns (uint256[2] memory finalArray) {
        for(uint i = 0; i < firstArray.length; i++) {
            finalArray[i] = firstArray[i] + secondArray[i];
        }
    }
}