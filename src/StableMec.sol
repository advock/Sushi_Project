// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {SushiStable} from "./SushiStable.sol";

contract StableMec is SushiStable {
    // 50% will be in vault and 50 % will be in sishi swap poolz

    function getTotalBalance() returns (uint256) {
        uint256 _x = Sushi.balanceOf(address(SushiStable));
        return x;
    }
}
