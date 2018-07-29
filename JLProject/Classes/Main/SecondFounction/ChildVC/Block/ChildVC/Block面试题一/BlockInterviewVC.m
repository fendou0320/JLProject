//
//  BlockInterviewVC.m
//  JLProject
//
//  Created by UCS on 2018/7/29.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "BlockInterviewVC.h"

static NSString *staticString;

@interface BlockInterviewVC (){
    
    int indexTwo;
    NSInteger indexThree;
    NSString *strOne;
}

@property (nonatomic, assign) NSInteger indexFour;

@property (nonatomic, copy) NSString *strTwo;

@end

@implementation BlockInterviewVC

/*
 对block的综合理解
 block的实质
 
 对象, 一个函数指针, 指向代码块, 以及上下文所需的变量
 函数指针和block的格式对比
 
 函数指针   void(*fun)(int)
 block    void(^fun)(int)
 
 block在内存中的分类
 全局block --> GlobalBlock <==> 相当于全局变量, 系统会自动释放
 栈block --> StackBlock <==> 相当于局部变量, 系统会自动释放
 堆block --> MallocBlock <==> (需要手动释放内存)
 
 block类型区分方法
 如果block实现中没有访问任何"外部"变量(包括局部和全局), 该block为GlobalBlock
 如果block实现中访问了任何"外部"变量(包括局部和全局), 该block为StackBlock
 对StackBlock进行拷贝(copy/Block_copy), 该block为MallocBlock
 
 注意点:
 block默认都是在栈上创建的, 当block超过作用域, 就会被销毁, 如果要在作用域外使用block, 应copy该block到堆上, 此时会创建一个新的MallocBlock到堆上
 声明block对象, 应该使用copy修饰, 将其保存到堆上, 不然在回调时block已经销毁, 无法访问
 
 delegate跟block的区别，使用场景有哪些不同？
 定义:
 A对象设置协议和代理,并让B对象遵守协议和成为代理,从而让B对象实现协议方法, 是为代理
 
 block的本质是指针函数, 内部封存的是代码块
 
 区别:
 代理
 代理是一对一的, 需要设置接口
 可能引起循环引用,导致内存泄漏
 通过指定delegate对象为weak,可以避免循环引用
 
 block
 block的不需要设置接口, 使用更为轻型
 更容易造成循环引用
 通过指定block内的对象为__weak,可以避免循环引用
 使用场景:
 代理
 当要实现的方法大于3个
 为了防止循环引用时
 写一个库给别人使用,又不清楚使用者的能力,建议使用delegate
 
 block
 当要实现的方法小于3个
 需要请求数据回调
 
 GCD跟Block使用需要注意什么?
 GCD使用注意点：
 防止死锁
 GCD不能控制最大任务并发量（无法决定具体开多少子线程，只能由系统决定）
 GCD的请求一旦发送，无法直接取消
 
 Block使用注意点：
 防止循环引用
 在block中用到外部变量都是只读拷贝的
 栈block超过作用域就被自动释放了
 堆block需要手动释放
 
 Block在ARC跟MRC中的行为和用法有什么区别？
 相同点
 block的本质一样, 都是函数指针
 使用__block都可以解决在block中修改外部变量的问题
 
 不同点
 解决循环引用的方式不同
 MRC中使用__block
 ARC中使用 __weak
 block用什么属性修饰，为什么？
 
 在MRC中, 定义Block属性时, 应该用copy修饰
 在ARC中, 定义Block属性时, 系统会自动将其copy, 即复制到堆上. 但习惯上还是会用copy修饰
 用copy修饰的原因
 block创建时默认是创建在栈上的, 超过作用域后就会被销毁, 只有使用copy才会生成一个堆block, 在作用域外被访问
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatSubView];
    
}

#pragma mark - 四道面试题--打印类型
void test1()
{
    int a = 10;
    void (^block)() = ^{
        NSLog(@"a is %d", a);
    };
    a = 20;
    block(); // 10
}

void test2()
{
    __block int a = 10;
    void (^block)() = ^{
        NSLog(@"a is %d", a);
    };
    a = 20;
    block(); // 20--堆上
}

void test3()
{
    static int a = 10;
    void (^block)() = ^{
        NSLog(@"a is %d", a);
    };
    a = 20;
    block(); // 20--堆上
}

int a = 10;
void test4()
{
    void (^block)() = ^{
        NSLog(@"a is %d", a);
    };
    a = 20;
    block();//20--堆上
}
/*
 block的内存管理
 无论当前环境是ARC还是MRC,只要block没有访问外部变量,block始终在全局区
 
 MRC情况下
 block如果访问外部变量,block在栈里
 不能对block使用retain,否则不能保存在堆里
 只有使用copy,才能放到堆里
 
 ARC情况下
 block如果访问外部变量,block在堆里
 block可以使用copy和strong,并且block是一个对象
 
 block的循环引用
 如果要在block中直接使用外部强指针会发生错误,使用以下代码在block外部实现可以解决
 __weak typeof(self) weakSelf = self;
 但是如果在block内部使用延时操作还使用弱指针的话会取不到该弱指针,需要在block内部再将弱指针强引用一下
 __strong typeof(self) strongSelf = weakSelf;
 */

- (void)creatSubView{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 150, kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btn];
    btn.backgroundColor = RandomColor;
    [btn setTitle:@"四道面试题" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btntwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btntwo.frame = CGRectMake(0, SIZE_IPHONE6(250), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btntwo];
    btntwo.backgroundColor = RandomColor;
    [btntwo setTitle:@"测试各种类型的变量在block中的打印" forState:UIControlStateNormal];
    [btntwo addTarget:self action:@selector(btnTwo:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnthree = [UIButton buttonWithType:UIButtonTypeCustom];
    btnthree.frame = CGRectMake(0, SIZE_IPHONE6(350), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btnthree];
    btnthree.backgroundColor = RandomColor;
    [btnthree setTitle:@"" forState:UIControlStateNormal];
    [btnthree addTarget:self action:@selector(demoShow:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnFour = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFour.frame = CGRectMake(0, SIZE_IPHONE6(450), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btnFour];
    btnFour.backgroundColor = RandomColor;
    [btnFour setTitle:@"" forState:UIControlStateNormal];
    [btnFour addTarget:self action:@selector(btnFour:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnOne: (UIButton *)sender{
   
    test1();
    test2();
    test3();
    test4();
}


- (void)btnTwo: (UIButton *)sender{
   
    //设置各种变量
    indexTwo = 10;
    indexThree = 10;
    self.indexFour = 10;
    
    strOne = @"20";
    self.strTwo = @"20";
    
    //block各种类型
    //    [self KindsOfBlock];
    
    //block内存结构--三种类型的block
    /*
     _NSConcreteGlobalBlock 全局的静态 block，不会访问任何外部变量。
     _NSConcreteStackBlock 保存在栈中的 block，当函数返回时会被销毁。
     _NSConcreteMallocBlock 保存在堆中的 block，当引用计数为 0 时会被销毁。
     */
    [self blockStructure];
}

- (void)blockStructure{
    
    // 开启 ARC 时，block 应该是 _NSConcreteGlobalBlock 类型
    //--------------_NSConcreteGlobalBlock------------
    void (^firstBlock)(int, NSString *) = ^void(int a, NSString *b){
        DLog(@"NSConcreteGlobalBlock");
    };
    firstBlock(01,@"01");
    
    
    int a = 10;
    __block int i = 10;
    int indexOne = 10;
    __block int indexOneOne = 10;
    NSString *strThree = @"10";
    __block NSString *strthreethree = @"10";
    //全局变量
    indexThree = 10;
    strOne = @"10";
    //静态全局变量
    staticString = @"10";
    //--------------_NSConcreteStackBlock-----------说明这是一个分配在栈上的实例
    void (^secondBlock)(void) = ^void(void){
        NSLog(@"局部变量（初始话全为10；block后更改为100）a==%d, （__block修饰）i==%d", a, i);
        NSLog(@"局部变量（初始话全为10；block后更改为100）%d，（__block修饰）%@",indexOne, strThree);
        NSLog(@"__block修饰-局部变量（初始话全为10；block后更改为100）%d，（__block修饰）%@",indexOneOne, strthreethree);
        //打印全局
        NSLog(@"全局变量（初始话全为10；block后更改为100）%ld，%@",indexThree, strOne);
        //静态全局变量
        NSLog(@"静态全局变量（初始话全为10；block后更改为100）%@", staticString);
    };
    a = 100;
    i = 100;
    indexOne = 100;
    strThree = @"100";
    indexOneOne = 100;
    strthreethree = @"100";
    //全局
    indexThree = 100;
    strOne = @"100";
    //静态全局变量
    staticString = @"100";
    
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



- (void)demoShow: (UIButton *)sender{
    
}

- (void)btnFour: (UIButton *)sender{

}


@end
