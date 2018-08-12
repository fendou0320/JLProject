//
//  BlockOperationCommonVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/8/11.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "BlockOperationCommonVC.h"

@interface BlockOperationCommonVC ()

@end

@implementation BlockOperationCommonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //NSBlockOperation的使用
    //    [self executeBlockOperationInMainThread];
    
    
    //NSBlockOperation和NSOperationQueue联合使用
    //添加到主操作队列
    //    [self hunHeAddMainOperationQueue];
    //添加到自定义队列
//    [self hunHeAddCustomOperationQueue];
    
    //添加依赖
    [self addDependenceInCustom];
    
}


- (void)task: (NSString *)order{
    for (NSInteger i = 0; i < 3; i++) {
        NSLog(@"任务:%@----%@", order, [NSThread currentThread]);
    }
}

- (void)executeBlockOperationInMainThread{
    
    NSLog(@"创建操作:%@",[NSThread currentThread]);
    
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        [self task];
    }];
    //NSBlockOperation该操作有个方法能在该操作中持续添加操作任务addExecutionBlock，直到全部的block中的任务都执行完成后，该操作op才算执行完毕。当该操作在addExecutionBlock加入比较多的任务时，该op的block中的（包括blockOperationWithBlock和addExecutionBlock中的操作）会在新开的线程中执行。不一定在创建该op的线程中执行。
    for (NSInteger i = 0; i < 100; i++) {
        [op addExecutionBlock:^{
            [self task:@"add"];
        }];
    }
    [op start];
    
    /*
     可以看出，当一个操作中多次添加任务的话，系统会开启新的线程，并发执行操作中的任务。
     */
}

- (void)task
{
    for (NSInteger i = 0; i < 3; i++) {
        NSLog(@"操作执行:%@",[NSThread currentThread]);
    }
}

//添加到主操作队列
- (void)hunHeAddMainOperationQueue{
    
    NSLog(@"任务创建:%@",[NSThread currentThread]);
    
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        [self task];
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [self task];
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        [self task];
    }];
    
    [mainQueue addOperation:op1];
    [mainQueue cancelAllOperations];
    
    [mainQueue addOperation:op2];
    
    [mainQueue addOperation:op3];
    
    for (NSInteger i = 0; i < 10; i++) {
        [op1 addExecutionBlock:^{
            [self task];
        }];
    }
    
    //将操作加入到主队列中后，根据操作添加到队列中的先后顺序(操作之间没有添加依赖关系)，串行执行。每个操作addExecutionBlock添加的任务和blockOperationWithBlock中的任务共同组成一个操作。两个block中的操作都执行结束后，一个操作才算结束。
    //虽然将操作加到了NSOperationQueue主操作队列，但是当操作中addExecutionBlock加的任务比较多的时候，操作block中的任务会在新的线程中并发执行，但是对于操作来说，操作时串行执行的。
}

//添加到自定义操作队列
- (void)hunHeAddCustomOperationQueue{
    
    NSLog(@"任务创建:%@",[NSThread currentThread]);
    
    NSOperationQueue *customQueue = [[NSOperationQueue alloc] init];
    //    customQueue.maxConcurrentOperationCount = 1;
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"1"];
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"2"];
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"3"];
    }];
    
    [customQueue addOperation:op1];
    [customQueue addOperation:op2];
    [customQueue addOperation:op3];
    
    [op1 addExecutionBlock:^{
        [self task:@"1.1"];
    }];
    /*
     当将操作添加到自定义队列的话，如果不设置最大并发数maxConcurrentOperationCount的话，操作是并发执行的。当将maxConcurrentOperationCount设置为1的时候，操作串行执行
     */
}

//添加依赖
- (void)addDependenceInCustom{
    
    NSLog(@"任务创建:%@",[NSThread currentThread]);

    NSOperationQueue *customQueue = [[NSOperationQueue alloc] init];
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"1"];
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"2"];
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        [self task:@"3"];
    }];
    
    [op1 addDependency:op2];
    [op3 addDependency:op1];
    
    [customQueue addOperation:op1];
    [customQueue addOperation:op2];
    [customQueue addOperation:op3];
    
    [op1 addExecutionBlock:^{
        [self task:@"1.1"];
    }];

    /*
     NSBlockOperation添加依赖的做法和NSInvocationOperation的写法一样，这里需要注意一下的是:由上图也可以看出结果:op3的执行是在op1完全执行后才执行的。而op1中blockOperationWithBlock和addExecutionBlock这两种block里的任务都执行完，才算op1操作执行结束
     */
    
}



@end
