// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

contract Homework7 {
    // write tests for these
    function query(bytes memory data, function(uint) external test)
    public pure {
        //look at selector of passed in function, check theres no IERC20 
        assembly {
            if eq(test.selector, 0xa9059cbb) {
                let error := "Denied: ERC20 transfer selector"
                let ptr := mload(0x40)
                let size := 0x20
                revert(ptr, size)
            }
        }
    }

    function checkCall(bytes calldata data) external{
    
    }
}