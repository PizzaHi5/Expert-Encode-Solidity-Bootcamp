// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

interface Isolution2 {
  function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray);
}

/**
    @notice Got some very strange behavior for my solution
        In local 'forge test -vv', the end resulting sortedArray returns with 20 values seemingly
        combining the unsortedArray with the sortedArray. On testnet, this contract behaves as it should.
        I am suspicious of line31. Transacting with this contract was very slow for me:
        0x0c5fae5006807b9e0272200f0bc191d39b2280c5
 */

contract Hw2 {
    function solution(
        uint256[10] calldata unsortedArray
    ) external pure returns (uint256[10] memory sortedArray) {
        uint[] memory constructingArray = new uint[](10);
        
        //copies to memory
        for(uint i = 0; i < unsortedArray.length; i++) {
            constructingArray[i] = unsortedArray[i];
        }
        
        //finds lowest in array, removes index
        uint index;
        for(uint i = 0; i < unsortedArray.length; i++) {
            (sortedArray[i], index) = findLowest(constructingArray);
            constructingArray = EfficientArrayChange(constructingArray, index);
        }
        /// @dev somehow, sortedArray has 20 values in it when it was only written to 10 times

        /// @dev this errors with index out of bounds despite there being 20 values
        /*for(uint i = 0; i < unsortedArray.length; i++) {
            sortedArray[i] = idkArray[i+1];
        }*/
    }

    function findLowest(uint[] memory array) public pure returns (uint256 lowNum, uint256 index) {
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

    //Modified solution used in main Homework2.sol, modified to return a new array here 
    function EfficientArrayChange(uint256[] memory array, uint256 deleteIndex) public pure returns (uint256[] memory) {
        uint256[] memory newArray = new uint256[](array.length - 1);
        for(uint i = 0; i < deleteIndex; i++) {
            newArray[i] = array[i];
        }
        for(deleteIndex; deleteIndex < newArray.length; deleteIndex++) {
            newArray[deleteIndex] = array[deleteIndex + 1];
        }
        return newArray;
    }
}