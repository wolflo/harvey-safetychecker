// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

library HarveyLib {

    event AssertionFailed(string message);

    function hAssert(bool condition, string memory message) internal {
        if(!condition) {
            emit AssertionFailed(message);
            // assert(false);
        }
    }
}
