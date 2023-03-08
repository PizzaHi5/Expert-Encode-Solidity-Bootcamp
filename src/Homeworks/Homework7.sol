// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

contract Homework7 {

    event TransferOccurred(address receiver, uint256 amount);

    bytes blah;

    // write tests for these
    function query(bytes memory data, function(uint) external test)
    public {
        //look at selector of passed in function, check theres no IERC20 
        assembly {
            if eq(test.selector, 0xa9059cbb) {
                let error := "Denied: ERC20 transfer selector"
                let ptr := mload(0x40)
                let size := 0x20
                revert(ptr, size)
            }
        }

        //this is here just to get rid of that yellow warning
        blah = data;
    }

    function checkCall(bytes calldata data) external {
        (bytes4 selector, address target, uint256 amount) = 
            abi.decode(data, (bytes4,address,uint256));

        require(selector == 0xa9059cbb, "Not ERC20 Transfer");
        emit TransferOccurred(target, amount);
    }
}