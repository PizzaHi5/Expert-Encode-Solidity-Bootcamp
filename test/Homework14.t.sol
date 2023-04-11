// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Homeworks/Homework14.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Homework14Test is Test {
    uint256 ethereum;
    Homework14 public eg;

    // Test values from Hw14
    uint256 beValue = 86177475670493197073919501659849812897660611100807883281033508768520888346190;
    uint256 deValue = 100651486825157721501865874785935801379319359184012953785965706769510029551182;

    function setUp() public {
        string memory ETH_RPC_URL = vm.envString("ETH_RPC_URL");
        ethereum = vm.createSelectFork(ETH_RPC_URL);

        eg = new Homework14();
    }

    function testSolidityBitOperation() public {
        eg.setX(beValue);
        eg.solidityBitOperation();
        assertEq(eg.getX(), beValue * 4);

        eg.setX(deValue);
        eg.solidityBitOperation();
        assertEq(eg.getX(), deValue / 4);
    }

    function testYulBitOperation() public {
        eg.setX(beValue);
        eg.yulBitOperation();
        assertEq(eg.getX(), beValue * 4);

        eg.setX(deValue);
        eg.yulBitOperation();
        assertEq(eg.getX(), deValue / 4);
    }

    
}