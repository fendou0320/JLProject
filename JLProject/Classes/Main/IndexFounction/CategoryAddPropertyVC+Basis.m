//
//  CategoryAddPropertyVC+Basis.m
//  JLProject
//
//  Created by UCS on 2018/7/29.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "CategoryAddPropertyVC+Basis.h"

@implementation CategoryAddPropertyVC (Basis)

/*   ---------------------typedef 和 define-------------
 1. typedef 类型定义
 作用：给类型起别名（给已知的类型起别名）。常用于简化复杂类型，变量类型意义化等。
 
 typedef double NSTimeInterval;  //给double取别名为NSTimeInterval（变量类型意义化）
 typedef NSTimeInterval MyTime;  //给NSTimeInterval取别名为MyTime
 typedef char * MyString;  //给char *取别名为MyString
 
 typedef struct Person
 {
 char *name
 }MyPerson;  //给Person结构体取别名为MyPerson。使用:MyPerson p = {"jack"};
 
 typedef enum Gender
 {
 Man,
 Woman
 }MyGender;  //给Gender枚举取别名为MyGender。使用:MyGender g = Man;
 
 typedef void(^MyBlock) (int a,int b);  //给block取别名MyBlock
 typedef int(*MyFunction) (int a,int b);  //给指向函数的指针取别名MyFunction
 
 
 2. define 宏定义
 作用：文本替换（把出现的替换为定义的）。
 #define MyString @"Hello World !"  //MyString替换后面的文本
 #define MyString2 MyString  //MyString2替换MyString

 
 3. typedef 和 define 使用注意
 define 是文本替换，属于预编译指令，本身不参与编译，除非希望替换的文本中有;否则不用加。
 typedef 是类型替换，语句的一种，结尾必须有;
 define 写在方法/函数中则作用域从写的地方开始有效，直至使用#undef（不写此指令则后面一直有效）。typedef 写在方法/函数中则作用域 只在此方法/函数中有效。
 若使用typedef char * MyString;则 MyString s1,s2 等价于  char *s1; char *s2
 若使用 #define MyString char * 则 MyString s1,s2 等价于 char *s1,s2 即 char *s1; char s2
 再次说明了typedef是类型替换，直接参与编译，而define只是简单的文本替换。
 
 
 */




@end
