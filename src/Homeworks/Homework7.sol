// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

contract Homework7 {

    event TransferOccurred(address indexed receiver, uint256 indexed amount);

    bytes blah;

    function query(bytes memory data, function(address,uint256) external returns (bool) test)
    public { //pure
        //look at selector of passed in function, check theres no IERC20 
        bytes4 sig = test.selector;

        assembly {
            //let prepreselector := mload(preselector)
            //mstore(0x100, prepreselector)
            //let sig := mload(add(0x100, 0x04))
            if eq(sig, 0xa9059cbb) { //or test.selector
                let str := "Denied: ERC20 transfer selector"
                let len := mload(str) //mload converts to bytes
                let bytesStr := mload(add(str, 0x20))
                
                let ptr := mload(0x40)
                mstore(0x40, len)
                mstore(add(ptr, 0x40), bytesStr)
                revert(ptr, add(len, 0x40))
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