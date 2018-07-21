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
 
 我们在下面会分别来查看它们各自的实现方式上的差别。
 研究工具：clang
 为了研究编译器是如何实现 block 的，我们需要使用 clang。clang 提供一个命令，可以将 Objetive-C 的源码改写成 c 语言的，借此可以研究 block 具体的源码实现方式。该命令是
 clang -rewrite-objc block.c

 ------------------(1)NSConcreteGlobalBlock 类型的 block 的实现------------------
 我们先新建一个名为 block1.c 的源文件：
 
 #include <stdio.h>
 int main()
 {
 ^{ printf("Hello, World!\n"); } ();
 return 0;
 }
 
 下面我们就具体看一下是如何实现的。__main_block_impl_0 就是该 block 的实现，从中我们可以看出：
 
 一个 block 实际是一个对象，它主要由一个 isa 和 一个 impl 和 一个 descriptor 组成。
 在本例中，isa 指向 _NSConcreteGlobalBlock， 主要是为了实现对象的所有特性，在此我们就不展开讨论了。
 由于 clang 改写的具体实现方式和 LLVM 不太一样，并且这里没有开启 ARC。所以这里我们看到 isa 指向的还是_NSConcreteStackBlock。但在 LLVM 的实现中，开启 ARC 时，block 应该是 _NSConcreteGlobalBlock 类型，具体可以看 《objective-c-blocks-quiz》 第二题的解释。
 impl 是实际的函数指针，本例中，它指向 __main_block_func_0。这里的 impl 相当于之前提到的 invoke 变量，只是 clang 编译器对变量的命名不一样而已。
 descriptor 是用于描述当前这个 block 的附加信息的，包括结构体的大小，需要 capture 和 dispose 的变量列表等。结构体大小需要保存是因为，每个 block 因为会 capture 一些变量，这些变量会加到 __main_block_impl_0 这个结构体中，使其体积变大。在该例子中我们还看不到相关 capture 的代码，后面将会看到。

 
 ------------------(2)NSConcreteStackBlock 类型的 block 的实现------------------
 
 #include <stdio.h>
 int main() {
 int a = 100;
 void (^block2)(void) = ^{
 printf("%d\n", a);
 };
 block2();
 return 0;
 }
 
 在本例中，我们可以看到：
 本例中，isa 指向 _NSConcreteStackBlock，说明这是一个分配在栈上的实例。
 main_block_impl_0 中增加了一个变量 a，在 block 中引用的变量 a 实际是在申明 block 时，被复制到 main_block_impl_0 结构体中的那个变量 a。因为这样，我们就能理解，在 block 内部修改变量 a 的内容，不会影响外部的实际变量 a。
 main_block_impl_0 中由于增加了一个变量 a，所以结构体的大小变大了，该结构体大小被写在了 main_block_desc_0 中。
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 */










- (void)viewDidLoad {
    [super viewDidLoad];
    
    //block各种类型
    [self KindsOfBlock];
    
    //block内存结构
    [self blockStructure];
    
    
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
    
    int indexOne = 10;
    indexTwo = 10;
    indexThree = 10;
    self.indexFour = 10;
    
    strOne = @"20";
    self.strTwo = @"30";
//    NSString *str
    
    void (^firstBlock)(int, NSString *) = ^void(int a, NSString *b){
//        DLog(@"123456");
        
    };
    
    
    
}




@end
