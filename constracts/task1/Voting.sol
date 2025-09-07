// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Voting {

    // 1.创建一个名为Voting的合约，包含以下功能：
    // 一个mapping来存储候选人的得票数
    mapping (address=>uint256) public  votes;

    address[] public addrList;//候选人列表
    address[] public addrList1;//候选人列表

    //一个vote函数，允许用户投票给某个候选人
    function vote (address addr) public {
        if (votes[addr]==0){
            addrList.push(addr);
        }
        votes[addr]+=1;      
    }
    //一个getVotes函数，返回某个候选人的得票数
    function  getVotes(address addr) public view returns (uint256){
        return votes[addr];
    }

    // 一个resetVotes函数，重置所有候选人的得票数
    function resetVotes() public  {
        for (uint256 i=0; i<addrList.length; i++) {
            votes[addrList[i]]=0;
        }
        delete addrList;
    }

    //---------------------------------------------------------
    //2.合并两个有序数组 (Merge Sorted Array)
    //题目描述：将两个有序数组合并为一个有序数组。
    function arrConSort() public pure returns(uint[] memory){
        uint256[]  memory a1=new uint256[](4);
        a1[0]=1;
        a1[1]=4;
        a1[2]=5;
        a1[3]=8;
        
        uint256[]  memory a2=new uint256[](4);
        a2[0]=2;
        a2[1]=3;
        a2[2]=7;
        a2[3]=9;
        
        uint[] memory all =new uint[](a1.length+a2.length);
        uint k=0;
        uint i=0;
        uint j=0;
        while(i<a1.length && j<a2.length){
            if(a1[i]<a2[j]){
                all[k]=a1[i];
                i++;
                k++;
            }else{
                all[k]=a2[j];
                j++;
                k++;
            }
        }

        while(i<a1.length){
            all[k]=a1[i];
            i++;
            k++;
        }
        while(j<a2.length){
            all[k]=a2[j];
            j++;
            k++;
        }
      
      return all;

    }
    

    //二分查找 (Binary Search)
    //题目描述：在一个有序数组中查找目标值的角标。
    function getValue(uint target) public pure  returns(uint) {
        uint256[]  memory arr=new uint256[](5);
        arr[0]=2;
        arr[1]=3;
        arr[2]=5;
        arr[3]=7;
        arr[4]=9;

        uint left = 0;
        uint right = arr.length  - 1;
 
        while (left <= right) {
            uint mid = left + (right - left) / 2; // 避免溢出 
 
            if (arr[mid] == target) {
                return mid; // 找到目标值
            } else if (arr[mid] < target) {
                left = mid + 1; // 目标值在右半部分 
            } else {
                right = mid - 1; // 目标值在左半部分 
            }
        }
        return  type(uint).max; // 未找到 

    }



}