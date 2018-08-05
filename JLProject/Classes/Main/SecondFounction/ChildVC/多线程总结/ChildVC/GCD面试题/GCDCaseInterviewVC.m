//
//  GCDCaseInterviewVC.m
//  JLProject
//
//  Created by UCS on 2018/8/5.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "GCDCaseInterviewVC.h"

@interface GCDCaseInterviewVC ()

@end

@implementation GCDCaseInterviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //执行耗时操作后-再执行一次操作-
//    [self caseOne];
    
    //判断执行顺序
    [self caseTwo];
    
}

- (void)caseOne{
    
    static dispatch_once_t once;
    static dispatch_queue_t queue;
    dispatch_once(&once, ^{
        queue = dispatch_queue_create("com.xxx.download.background", DISPATCH_QUEUE_CONCURRENT);
    });
    __block NSInteger numOne = 0;
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 6000; i ++) {
            numOne += (100 +  (arc4random() % 101));
            NSLog(@"numOne---%ld---%ld", i, numOne);
        }
    });
    __block NSInteger numTwo = 0;
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 6000; i ++) {
            numTwo += (100 +  (arc4random() % 101));
            NSLog(@"numTwo---%ld---%ld", i, numTwo);
        }
    });
    dispatch_barrier_sync(queue, ^{
        NSLog(@"循环成功完成--numOne+numTwo:%ld+%ld",numOne, numTwo);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"回到主线程刷新UI");
        });
    });
    
}

- (void)caseTwo{
    
    /*往当前主队列中添加一个block，添加到主队列的队尾*/
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        DLog(@"4");
    });
    /*dispatch_async这个函数的特点是，往制定的队列添加一个blcok立马返回*/
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"5");
    });
    /*这段代码相当于 [self test2]; */
    [self performSelector:@selector(test2)];
    /* 当前线程正在执行的任务优先，如果当前线程上有其他任务要执行，test3先让步，然后再轮到它执行 */
    [self performSelector:@selector(test3) withObject:nil afterDelay:0];
    /*开启一个异步线程，6的打印会比较随机*/
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"6");
    });
    
    [self test1];
    
    /*顺序为：21345,6随机出现*/
}

- (void)test1{
    NSLog(@"1");
}

- (void)test2{
    NSLog(@"2");
}

- (void)test3{
    NSLog(@"3");
}






@end
