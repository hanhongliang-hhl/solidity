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

// 作业 1：ERC20 代币
// 任务：参考 openzeppelin-contracts/contracts/token/ERC20/IERC20.sol实现一个简单的 ERC20 代币合约。要求：
// 合约包含以下标准 ERC20 功能：
// balanceOf：查询账户余额。
// transfer：转账。
// approve 和 transferFrom：授权和代扣转账。
// 使用 event 记录转账和授权操作。
// 提供 mint 函数，允许合约所有者增发代币。
//
// 提示：
// 使用 mapping 存储账户余额和授权信息。
// 使用 event 定义 Transfer 和 Approval 事件。
// 部署到sepolia 测试网，导入到自己的钱包

    // 提供 mint 函数，允许合约所有者增发代币。
    function mint(uint256 addSupply) public returns (bool){  //true 成功
        require(owner==msg.sender, unicode"非发起者地址，不允许增发代币");

        _mint(owner, addSupply);
        
        return true;
    }


}