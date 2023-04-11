// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract Homework14 {

    uint x;

    function solidityBitOperation() public {
        //bytes memory temp = abi.encodePacked(x);

        //left shifted to push last bytes upfront for bytes1 conversion
        bytes1 value = bytes1(bytes32(abi.encodePacked(x)) << 31);

        if (value == 0xde) {
            x *= 4;
        } else if (value == 0xbe) {
            x /= 4;
        }

    }

    function yulBitOperation() public {
        assembly {
            let y := sload(x.slot)
            let value := shr(31, y)
            if eq(value, 0xde) {
                y := mul(y, 4)
                sstore(x.slot, y)
            }
            if eq(value, 0xbe) {
                y := div(y, 4)
                sstore(x.slot, y)
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