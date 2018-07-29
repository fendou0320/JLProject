//
//  BlockInterviewVC.m
//  JLProject
//
//  Created by UCS on 2018/7/29.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "BlockInterviewVC.h"

@interface BlockInterviewVC ()

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


- (void)creatSubView{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 150, kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btn];
    btn.backgroundColor = RandomColor;
    [btn setTitle:@"1" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btntwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btntwo.frame = CGRectMake(0, SIZE_IPHONE6(250), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btntwo];
    btntwo.backgroundColor = RandomColor;
    [btntwo setTitle:@"2" forState:UIControlStateNormal];
    [btntwo addTarget:self action:@selector(btnTwo:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnthree = [UIButton buttonWithType:UIButtonTypeCustom];
    btnthree.frame = CGRectMake(0, SIZE_IPHONE6(350), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btnthree];
    btnthree.backgroundColor = RandomColor;
    [btnthree setTitle:@"3" forState:UIControlStateNormal];
    [btnthree addTarget:self action:@selector(demoShow:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnFour = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFour.frame = CGRectMake(0, SIZE_IPHONE6(450), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btnFour];
    btnFour.backgroundColor = RandomColor;
    [btnFour setTitle:@"4" forState:UIControlStateNormal];
    [btnFour addTarget:self action:@selector(btnFour:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnOne: (UIButton *)sender{
   
    test1();
    test2();
    test3();
    test4();
}


- (void)btnTwo: (UIButton *)sender{
    
    
}

- (void)demoShow: (UIButton *)sender{
    
}

- (void)btnFour: (UIButton *)sender{

}


@end
