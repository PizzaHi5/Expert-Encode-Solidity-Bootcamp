// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract Homework14 {

    uint256 x;


    function solidityBitOperation() public {
        //bytes memory temp = abi.encodePacked(x)
        //left shifted to push last bytes upfront for bytes1 conversion
        uint256 value = x & 0xff;

        if (value == 0xde) {
            x *= 4;
        } else if (value == 0xbe) {
            x /= 4;
        }

    }

    /// @dev Not sure whats going wrong here
    function yulBitOperation() public {
        assembly {
            log0(0x00, 0x01)
            let temp := sload(x.slot)
            let y := add(temp, 0x20)
            log0(y, 0x20)
            let value := byte(2, y)
            log0(value, 0x01)
            if eq(value, 0xde) {
                y := mul(y, 4)
                sstore(0x00, y)
            }
            if eq(value, 0xbe) {
                y := div(y, 4)
                sstore(0x00, y)
            }
        }
    }

    function getX() external view returns (uint) {
        return x;
    }

    function setX(uint256 value) external {
        x = value;
    }
}