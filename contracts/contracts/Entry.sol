// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

import "./optimism/OVM_SafetyChecker.sol";
import "./HarveyLib.sol";

contract Entry {

    address private constant precompile = address(20);
    OVM_SafetyChecker private immutable safetyChecker;

    constructor() {
        safetyChecker = new OVM_SafetyChecker();
    }

    function cmp(bytes memory _bytecode) external {
        bool isSafeOptimism = safetyChecker.isBytecodeSafe(_bytecode);
        (bool pcOk, bytes memory pcRet) = precompile.staticcall(_bytecode);

        HarveyLib.hAssert(pcOk, "Precompile broke"); // sanity check
        HarveyLib.hAssert(isSafeOptimism == abi.decode(pcRet, (bool)), "P1");

        emit HarveyLib.AssertionFailed("Props seen");
    }
}
