// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {ERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {IERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract SushiStable is ERC20 {
    address public Sushi;

    constructor(address SushiTokenAdd) ERC20("SushiStab", "SSC") {
        Sushi = SushiTokenAdd;
    }

    mapping(address => uint256) public Balance;

    function Output(uint256 _amount) external returns (uint256) {
        uint256 x = _amount * (mintingRatio() / 100);
        return x;
    }

    function _mint(address _to, uint256 _amountSushi) external {
        require(_to != address(0));
        require(
            Sushi.Transfer(_to, address(this), _amountSushi),
            "Transfer failed"
        );
        uint256 _amount = Output(_amountSushi);
        _mint(address, _amount);
        Balance[msg.sender] = _amountSushi;
    }

    function mintingRatio() public returns (uint8) {
        // Collateral ratio
        // for now
        return 50;
    }

    function Redem(uint256 _amountSSC) external {
        uint256 x = _amountSSC * (100 / mintingRatio());
        address(this).transfer(address(this), msg.sender, x);
        Balance[msg.sender] = Balance[msg.sender] - _amountSSC;
    }

    function Balance() returns (uint256) {
        IERC20(Sushi).balanceOf(address(this));
    }
}
