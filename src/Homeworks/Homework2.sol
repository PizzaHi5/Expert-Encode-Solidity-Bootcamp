// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17; 

contract Homework2 {

    /** @dev Inefficient array replacement, must iterate thru each index of array for each delete and write all that to memory
     */
    function ArrayChange(uint256[] calldata array, uint256 deleteIndex) internal pure returns (uint256[] memory newArray) {
        uint j = 0;
        for(uint i = 0; i < array.length - j; i++) {
            if(i == deleteIndex) {
                newArray[i] = array[i + 1];
                j++;
            } else {
                newArray[i] = array[i + j];
            }
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

    //try to add 2 different sized arrays together

}