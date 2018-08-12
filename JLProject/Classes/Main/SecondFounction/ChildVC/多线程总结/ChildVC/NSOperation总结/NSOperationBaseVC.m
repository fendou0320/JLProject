//
//  NSOperationBaseVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/8/5.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "NSOperationBaseVC.h"
#import "JLOperation.h"

@interface NSOperationBaseVC ()

@end

@implementation NSOperationBaseVC

/*
 NSOperation则是封装GCD实现Objective-C API
 1，NSOperation和NSOperationQueue的介绍。
 2，NSInvocationOperation的使用
 3，NSBlockOperation的使用
 4，自定义Operation的步骤
 5，其它
 6，总结
 */

/*
 1、 NSOperation和NSOperationQueue的介绍。
 1.1、NSOperation
 NSOperation是系统提供的抽象的基类，我们使用的时候需要使用继承于它的子类。系统为我们提供了两种继承于NSOperation的子类，分别是NSInvocationOperation和NSBlockOperation，大多情况下，我们用这两个系统提供的子类就能满足我们并发编程的任务，但是如果你不想用系统提供的这两个类，那么你可以根据自己的需求来自定义自己的操作类。文章后边会结束自定义操作类的时候的步骤和注意事项。
 
 1.2、NSOperationQueue
 NSOperationQueue【操作队列】:用来存放操作的队列。是由GCD提供的一个队列模型的Cocoa抽象。GCD提供了更加底层的控制，而操作队列则在GCD之上实现了一些方便的功能。
 NSOperationQueue操作队列中的任务的执行顺序收到任务的isReady【就绪状态】状态和任务的队列优先级影响。这和GCD中的队列FIFO的执行顺序有很大区别。
 我们可以通过设置NSOperationQueue的最大并发操作数(maxConcurrentOperationCount)来控制任务执行是并发还是串行。
 NSOperationQueue有两种不通类型的队列:主队列和自定义队列。主队列在主线程上运行，而自定义队列在后台执行。这两种队列中加入的任务都需要用NSOperation的子类来表示。
 注:NSOperation【操作】通俗的讲，就是我们写在程序里的一段代码。
 */



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self executeInMain];

    [self addMainQueue];
}

- (void)executeInMain
{
    JLOperation *op = [[JLOperation alloc]initWithData:@""];
    [op start];
}

//和操作队列联合使用
- (void)addMainQueue
{
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    
    JLOperation *op1 = [[JLOperation alloc] initWithData:@"1"];
    JLOperation *op2 = [[JLOperation alloc] initWithData:@"2"];
    JLOperation *op3 = [[JLOperation alloc] initWithData:@"3"];
    
    [mainQueue addOperation:op1];
    [mainQueue addOperation:op2];
    [mainQueue addOperation:op3];
    
}

- (void)addCustomQueue{
    
    NSOperationQueue *customQueue = [[NSOperationQueue alloc] init];
    
    JLOperation *op1 = [[JLOperation alloc] initWithData:@"1"];
    JLOperation *op2 = [[JLOperation alloc] initWithData:@"2"];
    JLOperation *op3 = [[JLOperation alloc] initWithData:@"3"];
    
    [customQueue addOperation:op1];
    [op1 cancel];
    
    [customQueue addOperation:op2];
    [customQueue addOperation:op3];
    
}

@end
