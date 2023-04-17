// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract Homework14 {

    uint256 x;

    function solidityBitOperation() public {
        //bytes memory temp = abi.encodePacked(x)
        // checks LSB
        uint256 lsbValue = x & 0xff;
        if (lsbValue == 0xde) {
            x *= 4;
        } else if (lsbValue == 0xbe) {
           x /= 4;
        }

        bytes1 msbValue = bytes1(bytes32(abi.encodePacked(x)));

        if (msbValue == 0xde) {
            x *= 4;
        } else if (msbValue == 0xbe) {
            x /= 4;
        }

    }

    function yulBitOperation() public {
        assembly {
            let ptr := x.slot
            mstore(0x00, sload(ptr))
            let y := mload(0x00)
            log0(0x00, 0x20)
            //load 8 bits at y ptr
            let value := byte(0, y)
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