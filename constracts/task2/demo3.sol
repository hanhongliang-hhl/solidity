// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

//讨饭合约
contract BeggingContract { 
    address private owner;//合约拥有者地址

    // 一个 mapping 来记录每个捐赠者的捐赠金额。
    mapping (address => uint256) donateAmt;

    // 合约总捐赠额
    uint256 public totalDonations;

    event TonateTransfer(address indexed from, address indexed to, uint256 amt);//捐赠事件

    constructor() {
        owner = msg.sender;    
    }

    modifier onlyOwner{  
        require(owner == msg.sender, unicode"非合约所有者，不允许提款");//合约拥有者校验
        _;
    }



    // 一个 donate 函数，允许用户向合约发送以太币，并记录捐赠信息。
    function donate() public payable  {
        uint donatorAmt = msg.value;//捐赠金额
        donateAmt[msg.sender] += donatorAmt;//记录捐赠信息
        
        totalDonations += donatorAmt; // 合约总捐赠额增加     
        
        emit TonateTransfer(msg.sender, owner, donatorAmt);
    }

    receive() external payable {  //触发条件：外部地址直接向合约地址发送ETH【调用方(外部账户/合约账户)可不调用任何payable的函数也可接收ETH】
        uint donatorAmt = msg.value;//捐赠金额
        donateAmt[msg.sender] += donatorAmt;//记录捐赠信息
        totalDonations += donatorAmt; 
    }


    // 一个 getDonation 函数，允许查询某个地址的捐赠金额。
    function getDonation() public view returns (uint){
        return donateAmt[msg.sender];
    }


    // 一个 withdraw 函数，允许合约所有者提取所有资金。
    function withdraw() public payable onlyOwner{
        require(address(this).balance >0, unicode"合约所有者余额不足，不支持提款");
        payable(owner).transfer(address(this).balance);//当前合约所有者合约账户向合约所有者外部账户地址转账
        delete totalDonations;//清空合约总捐赠额
    }

    
    //查询合约所有者余额
    function getOwnerBalance() external  payable returns (uint){
        return address(this).balance;
    }

    //查询合约外部账户地址
    function getOwnerAddress() public view returns (address){
        return owner;
    }

}