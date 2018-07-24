//
//  BlockVC.m
//  JLProject
//
//  Created by UCS on 2018/7/21.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "BlockVC.h"

@interface BlockVC (){
    
    int indexTwo;
    NSInteger indexThree;
    NSString *strOne;
}

@property (nonatomic, assign) NSInteger indexFour;

@property (nonatomic, copy) NSString *strTwo;

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
    //设置各种变量
    indexTwo = 10;
    indexThree = 10;
    self.indexFour = 10;
    
    strOne = @"20";
    self.strTwo = @"20";
    
    
    //block各种类型
    [self KindsOfBlock];
    
    
    //block内存结构--三种类型的block
    /*
    _NSConcreteGlobalBlock 全局的静态 block，不会访问任何外部变量。
    _NSConcreteStackBlock 保存在栈中的 block，当函数返回时会被销毁。
    _NSConcreteMallocBlock 保存在堆中的 block，当引用计数为 0 时会被销毁。
     */
    [self blockStructure];
    
    
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

- (void)blockStructure{
    
    // 开启 ARC 时，block 应该是 _NSConcreteGlobalBlock 类型
    //--------------_NSConcreteGlobalBlock------------
    void (^firstBlock)(int, NSString *) = ^void(int a, NSString *b){
        DLog(@"NSConcreteGlobalBlock");
    };
    firstBlock(01,@"01");
    
    
    int a = 10;
    __block int i = 50;
    int indexOne = 10;
    __block int indexOneOne = 10;
    NSString *strThree = @"30";
    __block NSString *strthreethree = @"30";
    //--------------_NSConcreteStackBlock-----------说明这是一个分配在栈上的实例
    void (^secondBlock)(void) = ^void(void){
        NSLog(@"局部变量a==%d, i==%d", a, i);
        NSLog(@"局部变量%d，%@",indexOne, strThree);
        NSLog(@"__block修饰-局部变量%d，%@",indexOneOne, strthreethree);
    };
    a = 100;
    i = 500;
    indexOne = 100;
    strThree = @"300";
    indexOneOne = 100;
    strthreethree = @"300";
    secondBlock();
    
    /*
     转换后的关键代码如下：
     struct __main_block_impl_0 {
     struct __block_impl impl;
     struct __main_block_desc_0* Desc;
***********     int a;              ***********
     __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int _a, int flags=0) : a(_a) {
***********     impl.isa = &_NSConcreteStackBlock;   ***********
     impl.Flags = flags;
     impl.FuncPtr = fp;
     Desc = desc;
     }
     };
     static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
     int a = __cself->a; // bound by copy
     printf("%d\n", a);
     }
     static struct __main_block_desc_0 {
     size_t reserved;
     size_t Block_size;
     } __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0)};
     int main()
     {
     int a = 100;
     void (*block2)(void) = (void (*)())&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA, a);
     ((void (*)(__block_impl *))((__block_impl *)block2)->FuncPtr)((__block_impl *)block2);
     return 0;
     }
     在本例中，我们可以看到：
     本例中，isa 指向 _NSConcreteStackBlock，说明这是一个分配在栈上的实例。
     main_block_impl_0 中增加了一个变量 a，在 block 中引用的变量 a 实际是在申明 block 时，被复制到 main_block_impl_0 结构体中的那个变量 a。因为这样，我们就能理解，在 block 内部修改变量 a 的内容，不会影响外部的实际变量 a。
     main_block_impl_0 中由于增加了一个变量 a，所以结构体的大小变大了，该结构体大小被写在了 main_block_desc_0 中。
    
     
     在变量前面增加 __block 关键字：
     #include <stdio.h>
     int main()
     {
     __block int i = 1024;
     void (^block1)(void) = ^{
     printf("%d\n", i);
     i = 1023;
     };
     block1();
     return 0;
     }

     生成的关键代码如下，可以看到，差异相当大：
     struct __Block_byref_i_0 {
     void *__isa;
     __Block_byref_i_0 *__forwarding;
     int __flags;
     int __size;
     int i;
     };
     struct __main_block_impl_0 {
     struct __block_impl impl;
     struct __main_block_desc_0* Desc;
     __Block_byref_i_0 *i; // by ref
     __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, __Block_byref_i_0 *_i, int flags=0) : i(_i->__forwarding) {
     impl.isa = &_NSConcreteStackBlock;
     impl.Flags = flags;
     impl.FuncPtr = fp;
     Desc = desc;
     }
     };
     static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
     __Block_byref_i_0 *i = __cself->i; // bound by ref
     printf("%d\n", (i->__forwarding->i));
     (i->__forwarding->i) = 1023;
     }
     static void __main_block_copy_0(struct __main_block_impl_0*dst, struct __main_block_impl_0*src) {_Block_object_assign((void*)&dst->i, (void*)src->i, 8);}
     static void __main_block_dispose_0(struct __main_block_impl_0*src) {_Block_object_dispose((void*)src->i, 8);}
     static struct __main_block_desc_0 {
     size_t reserved;
     size_t Block_size;
     void (*copy)(struct __main_block_impl_0*, struct __main_block_impl_0*);
     void (*dispose)(struct __main_block_impl_0*);
     } __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0), __main_block_copy_0, __main_block_dispose_0};
     int main()
     {
     __attribute__((__blocks__(byref))) __Block_byref_i_0 i = {(void*)0,(__Block_byref_i_0 *)&i, 0, sizeof(__Block_byref_i_0), 1024};
     void (*block1)(void) = (void (*)())&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA, (__Block_byref_i_0 *)&i, 570425344);
     ((void (*)(__block_impl *))((__block_impl *)block1)->FuncPtr)((__block_impl *)block1);
     return 0;
     
     }
     
     从代码中我们可以看到：
     源码中增加一个名为 __Block_byref_i_0 的结构体，用来保存我们要 capture 并且修改的变量 i。
     main_block_impl_0 中引用的是 Block_byref_i_0 的结构体指针，这样就可以达到修改外部变量的作用。
     __Block_byref_i_0 结构体中带有 isa，说明它也是一个对象。
     我们需要负责 Block_byref_i_0 结构体相关的内存管理，所以 main_block_desc_0 中增加了 copy 和 dispose 函数指针，对于在调用前后修改相应变量的引用计数。
     
     */
    
    
    //--------------NSConcreteMallocBlock--------------

    /*
    变量的复制
    对于 block 外的变量引用，block 默认是将其复制到其数据结构中来实现访问的
    对于用 __block 修饰的外部变量引用，block 是复制其引用地址来实现访问的
     */
    
    
}


- (void)blockMethodUser{
   
    // 2.声明并赋值定义一个Block变量
    int (^addfirstBlock)(int, int) = ^int(int a, int b){
        int aStr = a + b;
        return aStr;
    };
    
    int index = [self blockUsering:^int(int a, int b) {
        return a+b;
    }];
    
    NSLog(@"%d", index);
}


- (int )blockUsering: (int(^)(int a, int b))methodBlock{
    
//    DLog(@"result=%d", methodBlock(100, 200));
    return methodBlock(100, 200);
}











@end
