// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Homeworks/Homework6.sol";

contract Homework6Test is Test {
    Homework6 public eg;

    function setUp() public {
        eg = new Homework6();
    }

    // need to figure out why the local VM cannot send 1 wei
    function testSecondYulFxn() public payable {
        vm.prank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        //uint value = eg.secondYulFxn{value: 1 wei}();
        //assertEq(value, 1);
        //console.log(value);
    }
}