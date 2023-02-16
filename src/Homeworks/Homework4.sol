// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17; 

contract Homework4 {
    // This function compiles so its valid to some extent
    function isValid(
        function(
            function(
                function(
                    function() external pure
                ) external pure
            ) external pure
        ) external pure
    ) external pure {

    }

    /*  Function overload clash during conversion to external types for arguments.
    function isValid(
        function(
            function(
                function(
                    function() external
                ) external
            ) external
        ) external
    ) external {
    }
    */
    // This function works too, interesting
    function isValid(
        function(
            function(
                function(
                    function() external
                ) internal
            ) internal
        ) internal
    ) internal {
            
    }
}