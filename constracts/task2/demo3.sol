// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract demo1 is ERC20 {
    address private owner;//代币发起者

    constructor(uint256 initialSupply) ERC20("Gold", "GLD") {  //代币合约部署时触发，因此msg.sender就是发起者地址
        owner = msg.sender;
        _mint(owner, initialSupply);//创建代币 --代币名称Gold，代币标志GLD  initialSupply为代币发布数量
    }

}