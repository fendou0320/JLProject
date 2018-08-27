//
//  MVVMRACTwoVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/8/27.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MVVMRACTwoVC.h"
#import "MVVMRACTwoView.h"
#import <ReactiveObjC.h>
#import <NSObject+RACKVOWrapper.h>

@interface MVVMRACTwoVC ()

@property (weak, nonatomic) IBOutlet MVVMRACTwoView *subItemView;

@property (weak, nonatomic) IBOutlet UIButton *bottomBtn;

@property (weak, nonatomic) IBOutlet UITextField *bottonTextField;

@end

@implementation MVVMRACTwoVC

/*
 函数响应式
 
 */

/*
 其他方式创建的数组，扩展时，内存地址成倍增长
 NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:1];
 initWithCapacity 设定增长次数，每次增长一个
 */

/*
 代理
 1、定义协议
 2、协议方法
 3、定义代理属性
 4、查看代理属性有没有值，有没有相应我的协议方法
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //创建信号
    RACSubject *subject = [RACSubject subject];
    //订阅信号--函数式编程思想
    //
    [subject subscribeNext:^(id  _Nullable x) {
        DLog(@"信号来了---%@", x);
    }];
    //发送信号
    [subject sendNext:@"哈哈哈"];
    
    
//    [self.subItemView.clickSubject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"收到了---%@", x);
//    }];
    
    
    [[self.subItemView rac_signalForSelector:@selector(clickBtn:)] subscribeNext:^(RACTuple * _Nullable x) {
        NSLog(@"收到了按钮点击---%@", x);
    }];
    
    
    //KVO
    [self.subItemView rac_observeKeyPath:@"frame" options:NSKeyValueObservingOptionNew observer:self block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
        NSLog(@"第一种方式---frame---更改了---%@", change);
    }];
    
    [[self.subItemView rac_valuesForKeyPath:@"frame" observer:self] subscribeNext:^(id  _Nullable x) {
        NSLog(@"第二种方式---frame---更改了---%@", x);
    }];
    
    //添加方法
    [[_bottomBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"底部按钮点击了--%@", x);
    }];
    
    //通知
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"收到了通知---%@", x);
    }];
    
    [[self.bottonTextField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
       
        DLog(@"底部输入框---%@", x);
        
    }];
    
    
    //计时器--第一种方式
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0f target:self selector:@selector(timeClick) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    //计时器--第二种方式
//    NSThread *thread = [[NSThread alloc] initWithBlock:^{
//        NSTimer *timer = [NSTimer timerWithTimeInterval:1.0f target:self selector:@selector(timeClick) userInfo:nil repeats:YES];
//        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//        NSLog(@"子线程---调用--%@", [NSThread currentThread]);
//        //开启执行NSRunLoop
//        [[NSRunLoop currentRunLoop] run];
//    }];
//    [thread start];
    
    //计时器--第三种方式
    [[RACSignal interval:1.0f onScheduler:[RACScheduler scheduler]] subscribeNext:^(NSDate * _Nullable x) {
        NSLog(@"RAC计时器---调用--%@--%@", [NSThread currentThread], x);
    }];
    
    
    
}



- (void)timeClick{
    NSLog(@"计时器---调用--%@", [NSThread currentThread]);
}


@end
