// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17; 

contract Homework2 {

    /** @dev Inefficient array replacement, must iterate thru each index of array for each delete and write all that to memory
     */
    function ArrayChange(uint256[] calldata array, uint256 deleteIndex) internal pure returns (uint256[] memory newArray) {
        uint j = 0;
        for(uint i = 0; i < array.length - j; i++) {
            if(i == deleteIndex) {
                j++;
            }
            newArray[i] = array[i + j];
        }
    }

    /** @dev Uses similar method above, Constucts newArray w/o specified indexes. Performs a lot of read/writes to memory 
     */
    function MultiArrayChange(uint256[] calldata array, uint256[] calldata deleteIndexes) internal pure returns (uint256[] memory newArray) {
        uint j = 0;
        for(uint i = 0; i < array.length - j; i++) {
            if(doDelete(i, deleteIndexes)) {
                j++;
            }
            newArray[i] = array[i + j];
        }
    }

    function doDelete(uint256 index, uint256[] calldata deleteIndexes) internal pure returns (bool) {
        for(uint i = 0; i < deleteIndexes.length; i++) {
            if(index == deleteIndexes[i]) {
                return true;
            }
        }
        return false;
    }

    /**
        @dev Using teammates shared attempt, I thought of a more efficient way to do this. Reads/writes to each variables
            in the same array instead of contructing a new one and only checks that index onward.
            note: lower index values = more expensive 
     */
    function EfficientArrayChange(uint256[] memory array, uint256 deleteIndex) internal pure returns (uint256[] memory) {
        for(deleteIndex; deleteIndex < array.length; deleteIndex++) {
            array[deleteIndex] = array[deleteIndex++]; 
        }
        return array;
    }

    // Teammate used this one: I tried it with sample and do not believe it works
    // [0,1,2,3] => remove slot 1 so sets [1] = [2] and then deletes [3]? Ends up with [0,2,2]
    function removeNoOrder(uint256[] memory array, uint256 index) public pure {
      array[index] = array[index + 1];
      //array.pop();
    }

}