//
//  BlockVC.m
//  JLProject
//
//  Created by UCS on 2018/7/21.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "BlockVC.h"

static NSString *staticString;

@interface BlockVC ()

@end

@implementation BlockVC
/*
  闭包  在 wikipedia 上，闭包的定义) 是: In programming languages, a closure is a function or reference to a function together with a referencing environment—a table storing a reference to each of the non-local variables (also called free variables or upvalues) of that function.
 翻译过来，闭包是一个函数（或指向函数的指针），再加上该函数执行的外部的上下文变量（有时候也称作自由变量）。
 
 block 实际上就是 Objective-C 语言对于闭包的实现。
 block 配合上 dispatch_queue，可以方便地实现简单的多线程编程和异步编程，
 
 本文主要介绍 Objective-C 语言的 block 在编译器中的实现方式。主要包括：
 
 (1)block 的内部实现数据结构介绍
 (2)block 的三种类型及其相关的内存管理方式
 (3)block 如何通过 capture 变量来达到访问函数外的变量
 
 一、数据结构定义
 对应的结构体定义如下：
 
 struct Block_descriptor {
 unsigned long int reserved;
 unsigned long int size;
 void (*copy)(void *dst, void *src);
 void (*dispose)(void *);
 };
 
 struct Block_layout {
 void *isa;
 int flags;
 int reserved;
 void (*invoke)(void *, ...);
 struct Block_descriptor *descriptor;
 };
 
 通过该图，我们可以知道，一个 block 实例实际上由 6 部分构成：
 
 isa 指针，所有对象都有该指针，用于实现对象相关的功能。
 flags，用于按 bit 位表示一些 block 的附加信息，本文后面介绍 block copy 的实现代码可以看到对该变量的使用。
 reserved，保留变量。
 invoke，函数指针，指向具体的 block 实现的函数调用地址。
 descriptor， 表示该 block 的附加描述信息，主要是 size 大小，以及 copy 和 dispose 函数的指针。
 variables，capture 过来的变量，block 能够访问它外部的局部变量，就是因为将这些变量（或变量的地址）复制到了结构体中。

 该数据结构和后面的 clang 分析出来的结构实际是一样的，不过仅是结构体的嵌套方式不一样。但这一点我一开始没有想明白，所以也给大家解释一下，如下 2 个结构体 SampleA 和 SampleB 在内存上是完全一样的，原因是结构体本身并不带有任何额外的附加信息。
 
 struct SampleA {
 int a;
 int b;
 int c;
 };
 struct SampleB {
 int a;
 struct Part1 {
 int b;
 };
 struct Part2 {
 int c;
 };
 };
 
 在 Objective-C 语言中，一共有 3 种类型的 block：
 
 _NSConcreteGlobalBlock 全局的静态 block，不会访问任何外部变量。
 _NSConcreteStackBlock 保存在栈中的 block，当函数返回时会被销毁。
 _NSConcreteMallocBlock 保存在堆中的 block，当引用计数为 0 时会被销毁。
 
 
 */



- (void)viewDidLoad {
    [super viewDidLoad];

    //四种类型block
    [self KindsOfBlock];
     
    //block作为参数使用
    [self blockMethodUser];
    
}



- (void)KindsOfBlock{
    
    //------无参无返的block的定义与赋值------
    void (^myBlock)(void) = ^void(void){
        NSLog(@"这里是无参无返Block");
    };
    myBlock();
    
    //------有参无返的block使用------
    void (^secondBlock)(int, NSString *) = ^void(int a, NSString *b){
        NSLog(@"这里是有参无返Block：第一个：%d；第二个：%@", a, b);
    };
    secondBlock(100, @"2444");
    
    //------无参有返的block使用------
    NSString * (^thirdBlock)() = ^NSString *(void){
//        DLog(@"无参有返的block使用");
        return @"无参有返的block使用";
    };
    NSString *thirdData = thirdBlock();
    DLog(@"%@", thirdData);
    
    //------有参有返的block使用------
    NSString * (^fourBlock)(int, NSString *) = ^NSString *(int a, NSString *b){
        return [NSString stringWithFormat:@"这里是有参有返Block：第一个：%d；第二个：%@", a, b];
    };
    NSString *fourData = fourBlock(100, @"2444");
    NSLog(@"%@", fourData);
    
}


- (void)blockMethodUser{
   
    // 2.声明并赋值定义一个Block变量
    int (^addfirstBlock)(int, int) = ^int(int a, int b){
        int aStr = a + b;
        return aStr;
    };
    NSLog(@"使用一：%d", addfirstBlock(10, 200));
    
    //使用二
    int index = [self blockUsering:^int(int a, int b) {
        return a+b;
    }];
    NSLog(@"使用二：%d", index);
    
    //使用三
    int newIndex = [self newblockUsering:^int(int a, int b) {
        return a*b;
    }];
    DLog(@"使用三：%d", newIndex);
    
}


- (int)blockUsering: (int(^)(int a, int b))methodBlock{
    
//    DLog(@"result=%d", methodBlock(100, 200));
    return methodBlock(100, 200);
}

- (int)newblockUsering: (JLGlobalBlock)methodBlock{
    
    return methodBlock(100, 1000);
}









@end
