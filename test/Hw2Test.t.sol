// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../SolidityCTF/hw2.sol";

/**
    @notice Got some very strange behavior for my solution, ref hw2.sol
 */

contract Hw2Test is Test {
    Hw2 public eg;
    uint256[10] test = [10,128,21,36,44,5,22,7,17,11];

    function setUp() public {
        eg = new Hw2();
    }

    function testFindLowest() public view {
        uint256[] memory array = new uint256[](10);
        for(uint i = 0; i < test.length; i++) {
            array[i] = test[i];
        }
        (uint lowNum, uint index) = (eg.findLowest(array));
        console.log(lowNum);
        console.log(index);
    }

    function testEfficientArrayChange() public view {
        uint256[] memory array = new uint256[](10);
        for(uint i = 0; i < test.length; i++) {
            array[i] = test[i];
        }
        uint256[] memory newArray = eg.EfficientArrayChange(array, 5);

        for(uint i = 0; i < newArray.length; i++) {
            console.log(newArray[i]);
        }
    }

    function testSolution() public {
        for(uint i = 0; i < test.length; i++) {
            console.log(test[i]);
        }
        
        test = eg.solution(test);

        for(uint i = 0; i < test.length; i++) {
            console.log(test[i]);
        }
    }
}
