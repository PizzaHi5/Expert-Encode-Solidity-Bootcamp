// SPDX-License-Identifier: UNLICENSED
/*
pragma solidity ^0.8.13;

import "forge-std/Vm.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Homeworks/Homework5/ExpertSolidityBootcamp/exercises/defiFoundry/src/DeFi1.sol";
import "../src/Homeworks/Homework5/ExpertSolidityBootcamp/exercises/defiFoundry/src/Token.sol";

contract User {
    receive() external payable {}
}

contract Homework5Test is Test {
    DeFi1 defi;
    Token token;
    User internal alice;
    User internal bob;
    User internal chloe;
    uint256 initialAmount = 1000;
    uint256 blockReward = 5;

    function setUp() public {
        defi = new DeFi1(initialAmount, blockReward);
        token = Token(defi.token.address);
        alice = new User();
        bob = new User();
        chloe = new User();
    }

    /// @dev I wrote test here
    function testInitialBalance() public {
        assertEq(token.balanceOf(address(alice)), 0);
        assertEq(token.balanceOf(address(bob)), 0);
        assertEq(token.balanceOf(address(chloe)), 0);
    }

    function testAddInvestor() public {
        defi.addInvestor(address(alice));
        assert(defi.investors(0) == address(alice));
    }

    function testClaim() public {
        defi.addInvestor(address(alice));
        defi.addInvestor(address(bob));
        vm.prank(address(alice));
        vm.roll(1);
        defi.claimTokens();
    }

    /// @dev I wrote this test, should revert based on provided contract
    function testCorrectPayoutAmount() public {
        uint amountB4 = token.balanceOf(address(alice));
        testClaim();
        assertEq(token.balanceOf(address(alice)), amountB4 + defi.calculatePayout());
    }

    /// @dev I wrote this test
    function testAddingManyInvestors() public {
        defi.addInvestor(address(alice));
        defi.addInvestor(address(bob));
        defi.addInvestor(address(chloe));

        assertEq(defi.investors(0), address(alice));
        assertEq(defi.investors(1), address(bob));
        assertEq(defi.investors(2), address(chloe));
    }

    /// @dev I wrote this test, should revert due to claiming issues
    function testAddingManyInvestorsAndClaiming() public {
        uint amountB4 = token.balanceOf(address(alice));
        littleSetup(address(alice));
        assertEq(token.balanceOf(address(alice)), amountB4 + defi.calculatePayout());

        amountB4 = token.balanceOf(address(bob));
        littleSetup(address(bob));
        assertEq(token.balanceOf(address(bob)), amountB4 + defi.calculatePayout());

        amountB4 = token.balanceOf(address(chloe));
        littleSetup(address(chloe));
        assertEq(token.balanceOf(address(chloe)), amountB4 + defi.calculatePayout());

        assertEq(defi.investors(0), address(alice));
        assertEq(defi.investors(1), address(bob));
        assertEq(defi.investors(2), address(chloe));
    }

    function littleSetup(address investor) internal {
        defi.addInvestor(investor);
        vm.prank(investor);
        vm.roll(1);
        defi.claimTokens();
        vm.stopPrank();
    }
}*/
