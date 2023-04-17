// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Homeworks/Homework14.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Homework14Test is Test {
    uint256 ethereum;
    Homework14 public eg;

    // Test values from Hw14
    // check 0xde = 11011110    222
    // check 0xbe = 10111110    190
    uint256 ezValue = 0xdede; // 57054 or 1101111011011110

    // masks slot data except checked byte
    // need 0xff + (bytes.length of 0s - 1)
    uint256 mask = 0xff00000000000000000000000000000000000000000000000000000000000000;

    //starts with be
    uint256 beValue = 86177475670493197073919501659849812897660611100807883281033508768520888346190;

    //starts with de, should not overflow when multiplying by 4 now
    uint256 deValue = 3145358963286178796933308587060493793103729974500404805811428336547188423474;

    function setUp() public {
        string memory ETH_RPC_URL = vm.envString("ETH_RPC_URL");
        ethereum = vm.createSelectFork(ETH_RPC_URL);

        eg = new Homework14();
    }

    // Took a lot of testing and learning about bit operations to figure this out for myself 
    // but I learned and figured it out :D WOOOOOOO! 
    // This checks LSB == 0xde
    function testSolidityEzValueBitOperation() public {
        eg.setX(ezValue);
        //bytes32 temp = bytes32(abi.encodePacked(ezValue));
        //console.log(vm.toString(temp));
        //bytes32 yup = temp & 0x000000000000000000000000000000000000000000000000000000000000ff00;
        //console.log(removeLeadingZeros(yup));
        console.log(vm.toString(bytes32(abi.encodePacked(ezValue))));
        console.log(vm.toString(ezValue));
        //this checks LSB, not MSB
        uint256 mhm = ezValue & 0xff;
        console.log(vm.toString(mhm));
        assertEq(mhm, 0xde);

        eg.solidityBitOperation();
        assertEq(eg.getX(), ezValue * 4);

        console.log(vm.toString(bytes32(abi.encodePacked(beValue))));
        bytes1 yup = bytes1(bytes32(abi.encodePacked(beValue)));
        console.log(vm.toString(yup));
        uint256 test = beValue & 0xff;
        console.log(vm.toString(abi.encodePacked(test)));
    }
    
    function testSolidityBitOperation() public {
        eg.setX(beValue);
        eg.solidityBitOperation();
        assertEq(eg.getX(), beValue / 4);

        eg.setX(deValue);
        eg.solidityBitOperation();
        assertEq(eg.getX(), deValue);
    }
    
    function testYulBitOperation() public {
        eg.setX(ezValue);
        eg.yulBitOperation();
        assertEq(eg.getX(), ezValue / 4);

        //eg.setX(beValue);
        //eg.yulBitOperation();
        //assertEq(eg.getX(), beValue * 4);

        //eg.setX(deValue);
        //eg.yulBitOperation();
        //assertEq(eg.getX(), deValue / 4);
    }
    
    function removeLeadingZeros(bytes32 data) public pure returns (string memory) {
    bytes memory result = new bytes(64);
    uint count = 0;
    for (uint i = 0; i < 32; i++) {
        bytes1 b = bytes1(uint8(uint(data) / (2**(8*(31 - i)))));
        if (b != 0 || count > 0) {
            result[count] = b;
            count++;
        }
    }
    bytes memory finalResult = new bytes(count);
    for (uint j = 0; j < count; j++) {
        finalResult[j] = result[j];
    }
    return string(finalResult);
    }

    function binaryToHex(string memory binary) public pure returns (string memory) {
    bytes memory binaryBytes = bytes(binary);
    require(binaryBytes.length % 4 == 0, "Invalid binary string");
    
    bytes memory hexBytes = new bytes(binaryBytes.length / 4);
    for (uint i = 0; i < binaryBytes.length; i += 4) {
        bytes4 chunk = bytes4(
            uint8(binaryBytes[i]) * 2 ** 24 +
            uint8(binaryBytes[i+1]) * 2 ** 16 +
            uint8(binaryBytes[i+2]) * 2 ** 8 +
            uint8(binaryBytes[i+3])
        );
        hexBytes[i/4] = chunk[0];
    }
    
    return string(abi.encodePacked(hexBytes));
    }

    function getMsb(uint256 value) internal pure returns (bytes memory msb) {
        msb = new bytes(1);
        assembly {
            mstore(add(msb, 1), value)
        }
    }

}