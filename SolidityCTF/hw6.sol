// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface Isolution6 {
    function solution(
      bytes32 messageHash, 
      uint8 v, 
      bytes32 r, 
      bytes32 s
      ) external pure 
    returns (address signer);
}

contract Level_6_Solution {
        
    function solution(
        bytes32 messageHash, 
        uint8 v, 
        bytes32 r, 
        bytes32 s    
    ) external pure returns (address signer) {

            // Implement your solution here.
            bytes memory prefix = "\x19Ethereum Signed Message:\n32";
            signer = ecrecover(keccak256(abi.encodePacked(prefix, messageHash)), v, r, s);

            //ecrecover
            //assembly {
            //    mstore(messageHash, 0x20)
            //    mstore(keccak256(0x00, "\x19Ethereum Signed Message:\n32"), 0x00)
            //} // message prepend “\x19Ethereum Signed Message:\n32”


            //bytes32 hashedData = bytes32("\x19Ethereum Signed Message:\n32");
            //return ecrecover(messageHash, v, r, s);
    }
    
}