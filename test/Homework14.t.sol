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

    //starts with be
    uint256 beValue = 86177475670493197073919501659849812897660611100807883281033508768520888346190;

    //starts with de
    uint256 deValue = 100651486825157721501865874785935801379319359184012953785965706769510029551182;

    function setUp() public {
        string memory ETH_RPC_URL = vm.envString("ETH_RPC_URL");
        ethereum = vm.createSelectFork(ETH_RPC_URL);

        eg = new Homework14();
    }

    function testSolidityEzValueBitOperation() public {
        eg.setX(ezValue);
        bytes memory temp = abi.encode(ezValue);
        console.log(vm.toString(temp));
        console.log(vm.toString(bytes1(temp)));

        uint8 hmm = uint8(ezValue & (8 << 31));
        console.log(hmm);

        //bytes1 value = bytes1(bytes32(temp) >> 31);
        //console.log(vm.toString(value));

        eg.solidityBitOperation();
        assertEq(eg.getX(), ezValue * 4);
    }
    
    function testSolidityBitOperation() public {
        /*
        eg.setX(beValue);
        eg.solidityBitOperation();
        assertEq(eg.getX(), beValue * 4);

        eg.setX(deValue);
        eg.solidityBitOperation();
        assertEq(eg.getX(), deValue / 4);
        */
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

    
}