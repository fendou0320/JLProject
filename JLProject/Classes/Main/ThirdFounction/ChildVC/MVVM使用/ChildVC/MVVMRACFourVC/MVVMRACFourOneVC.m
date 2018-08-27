//
//  MVVMRACFourOneVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/8/27.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MVVMRACFourOneVC.h"

@interface MVVMRACFourOneVC ()

@end

@implementation MVVMRACFourOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self
//    cmd
    
    //消息发送
    @weakify(self);
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        @strongify(self);
        NSLog(@"%@", self);
        return nil;
    }];
    self.signal = signal;
}



- (void)dealloc{
    NSLog(@"%s", __func__);
}

@end
