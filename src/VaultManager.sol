// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {SushiStable} from "./SushiStable.sol";
import {IERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

interface MasterChief {
    function deposit(uint256 _pid, uint256 _amount) public;

    function withdraw(uint256 _pid, uint256 _amount) public;
}

interface SushiBar {
    function enter(uint256 _amount) public;

    function leave(uint256 _share) public;
}

contract VaultManager is SushiStable {
    MasterChief mastercief;
    SushiBar sushibar;

    constructor(address _masterCiefAdd, address _SushiBaradd) {
        mastercief = MasterChief(_masterCiefAdd);
        sushibar = SushiBar(_SushiBaradd);
    }

    // 20 5 goes to Master chef

    function AddLiqToMaster() internal {
        mastercief.deposit(_pid, _amount);
    }

    function removeLiq() internal {
        mastercief.withdraw(_pid, _amount);
    }

    function addLiqToSushiBar() internal {
        sushibar.enter(_amount);
    }

    function removeLiqfromSushiBar() internal {
        sushibar.leave(_amoun);
    }
}
