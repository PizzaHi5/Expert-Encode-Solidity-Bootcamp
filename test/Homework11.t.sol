// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Homeworks/Homework11.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Homework11Test is Test {
    uint256 ethereum;
    Homework11 public eg;
    //address public usdc = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    function setUp() public {
        string memory ETH_RPC_URL = vm.envString("ETH_RPC_URL");
        ethereum = vm.createSelectFork(ETH_RPC_URL);

        eg = new Homework11();
        //vm.resumeGasMetering();
    }

    function testSolidityDiv() public {
        uint result = eg.solidityDiv(10, 5);
        assertEq(result, 2);
    }

    function testYulDiv() public {
        uint result = eg.yulDiv(10, 5);
        assertEq(result, 2);
    }

    
}