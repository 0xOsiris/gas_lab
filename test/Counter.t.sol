// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../src/Counter.sol";
import "./utils/test.sol";
import "./utils/Console.sol";
import "../src/TickBitmap.sol";

contract CounterTest is DSTest {
    Counter public counter;
    using TickBitmap for mapping(int16 => uint256);
    mapping(int16 => uint256) public tickBitmap;

    function setUp() public {
        tickBitmap[
            80
        ] = 50196650721032492405623933735829147368684632089292599712538235063225972359167;
        counter = new Counter();
        counter.setNumber(0);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function testBitmap() public {
        (int24 next, bool initialized) = TickBitmap
            .nextInitializedTickWithinOneWord(tickBitmap, 205299, 10, true);
        console.logInt(next);
        console.log(initialized);
    }
}
