//
//  RunloopVC2.m
//  JLProject
//
//  Created by jiangliang on 2020/4/7.
//  Copyright © 2020 wangjiangliang. All rights reserved.
//


#import "RunloopVC2.h"
#import <UIKit/UIKit.h>

@interface RunloopVC2 ()

@property (nonatomic, strong) NSThread *thread;

@end

@implementation RunloopVC2


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    // 创建线程，并调用run1方法执行任务
//    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(run1) object:nil];
//    // 开启线程
//    [self.thread start];
    
//    NSLog(@"log0");
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"log1");
//    });
//    NSLog(@"log2");

    
}

- (void) run1
{
    // 这里写任务
    NSLog(@"----run1-----");
    
    // 添加下边两句代码，就可以开启RunLoop，之后self.thread就变成了常驻线程，可随时添加任务，并交于RunLoop处理
    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
    
    // 测试是否开启了RunLoop，如果开启RunLoop，则来不了这里，因为RunLoop开启了循环。
    NSLog(@"未开启RunLoop");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 利用performSelector，在self.thread的线程中调用run2方法执行任务
    [self performSelector:@selector(run2) onThread:self.thread withObject:nil waitUntilDone:NO];
}

- (void) run2
{
    NSLog(@"----run2------");
}

@end
