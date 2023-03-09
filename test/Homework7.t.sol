// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Homeworks/Homework7.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Homework7Test is Test {
    uint256 ethereum;
    Homework7 public eg;
    address public usdc = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    event TransferOccurred(address indexed receiver, uint256 indexed amount);


    function setUp() public {
        string memory ETH_RPC_URL = vm.envString("ETH_RPC_URL");
        ethereum = vm.createSelectFork(ETH_RPC_URL);

        eg = new Homework7();
    }

    // Revert if ERC20 transfer passed in
    function testQuery() public {
        bytes memory temp = "123abc";

        //check sig
        bytes4 sig = bytes4(keccak256(abi.encode(IERC20(usdc).transfer)));
        bytes4 sig2 = IERC20(usdc).transfer.selector;

        //learned encode doesnt work the same as calling with selector
        console.log(vm.toString(sig));
        //this sig is correct
        console.log(vm.toString(sig2));

        vm.expectRevert();
        eg.query(temp, IERC20(usdc).transfer);
    }

    // Emit event if ERC20 transfer passed in
    function testCheckCall() public {
        vm.expectEmit(true, true, true, false);
        emit TransferOccurred(address(this), 10);
        eg.checkCall(abi.encode(
            IERC20(usdc).transfer.selector, 
            address(this), 
            10));
    }

}