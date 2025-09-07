// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Voting {

    int  private  a1=1;
    bytes internal  a2="abc";
    bool   a3=true;
    address a4=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    mapping (address => int) map1;
    string a5="asdassd";
    struct person{
        uint age;
        string name;
        address addr;
    }
    person p1;

    uint[3] arr;
    int[] arr1;//定义无长度的动态数组,使用时需先new int初始化
    int[] arr2=new int[](6);//定义有长度的动态数组

    enum Staust{								// 不能加修饰符，不对外放开
			Active,
			Inactive
	}

    // constructor(){
    //     map1[msg.sender]=1;
    //     a5="12312312";
    //     p1=person(1,"111",msg.sender);
    //     p1.name="asda";
    //     arr=[1,2,4];
    //     arr[0]=1;
    //     arr1[0]=1;
    //     arr2[0]=1;
    //     arr1=new int[](6);
        
    // }

    function arrConSort() public  returns (uint){
        arr=[1,2,3];
        arr1=new int[](2);
        arr1[0]=1;
        return arr1.length;
        
    }
    function arrConSort1(int[] calldata a15) public   returns (uint){
        int[] memory a12=new int[](3);
        a12[0]=1;

        int[] memory a13=a15[0:a15.length];//[:]只能用于calldata类型
        a13.length;

        int[] memory a14=a12;
        a14.length;

        int[] memory a18=arr1;
        a18[0]=1;//不会修改storage的值，只会修改memory的值

        int[] storage a16=arr1;//没意义。可直接操作状态数据即可，没必要自定义storage在操作
        a16[0]=1;//会修改storage的值

        arr1=a15[:];//将calldata赋值给storage
        arr1=a14;//将memory赋值给storage
        //int[] storage a19;  //不能在函数里给自定义的storage赋值memory，也没意义

        int[] calldata a20=a15;
        a20.length;

        int[] memory a21=a15;
        a21.length;
        return a14.length;

    
        
    }
    





}