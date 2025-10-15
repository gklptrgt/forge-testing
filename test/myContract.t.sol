// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {MyContract} from "../src/MyContract.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";

contract ContractTest is StdInvariant, Test {
    MyContract exampleContract;

    function setUp() public {
        exampleContract = new MyContract();
        targetContract(address(exampleContract));
    }

    function test_ShouldAlwaysBeZero() public {
        uint256 data = 0;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

    function testFuzz_ShouldAlwaysBeZero(uint256 data) public {
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

    function invariant_testAlwaysShouldBeZero() public {
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }
}
