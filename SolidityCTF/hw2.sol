// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

interface Isolution2 {
  function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray);
}

contract Hw2 {
    function solution(
        uint256[10] calldata unsortedArray
    ) external returns (uint256[10] memory sortedArray) {
        uint[] memory constructingArray;
        
        //copies to memory
        for(uint i = 0; i < 10; i++) {
            constructingArray[i] = unsortedArray[i];
        }
        
        //finds lowest in array, removes index
        uint index;
        for(uint i = 0; i < 10; i++) {
            (sortedArray[i], index) = findLowest(constructingArray);
            constructingArray = EfficientArrayChange(constructingArray, index);
        }
    }

    function findLowest(uint[] memory array) internal pure returns (uint256 lowNum, uint256 index) {
        lowNum = array[0];
        index = 0;
        for(uint i = 1; i < array.length; i++) {
            if(array[i] < lowNum) {
                lowNum = array[i];
                index = i;
            }
        }
        return (lowNum, index);
    }

    //Modified solution used in main Homework2.sol, new to return a new array here 
    function EfficientArrayChange(uint256[] memory array, uint256 deleteIndex) internal pure returns (uint256[] memory newArray) {
        for(uint i = 0; i < deleteIndex; i++) {
            newArray[i] = array[i];
        }
        for(deleteIndex; deleteIndex < array.length - 1; deleteIndex++) {
            newArray[deleteIndex] = array[deleteIndex++]; 
        }
        return newArray;
    }
    //approaches: find lowest, put slot 1, 

}