//
//  MVVMRACThreeVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/8/27.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MVVMRACThreeVC.h"

@interface MVVMRACThreeVC ()

@property (nonatomic, assign) int time;
@property (weak, nonatomic) IBOutlet UIButton *sendClick;
@property (nonatomic, strong) RACDisposable *disposable;
@end

@implementation MVVMRACThreeVC

/*
 提升的两个方向
 第一个
 大型项目：编程思想、设计模式、项目架构
 
 第二个
 底层技术
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [[self.sendClick rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
//
//    }];
    
}

- (IBAction)timeClick:(UIButton *)sender {
    
    self.sendClick.enabled = NO;
    self.time = 10;
    
    _disposable = [[RACSignal interval:1.0f onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
       
        NSString *title = (self.time > 0) ? [NSString stringWithFormat:@"%d", self.time] : [NSString stringWithFormat:@"开始计时"];
        
        [self.sendClick setTitle:title forState:(self.time > 0) ? UIControlStateDisabled : UIControlStateNormal];
        
        self.sendClick.enabled = self.time > 0 ? NO :YES;
        
        if (self.time > 0) {
            
        }else{
            //取消订阅
            [_disposable dispose];
        }
        
        NSLog(@"RAC计时器---调用--%@--%@", [NSThread currentThread], x);

        self.time--;
        
    }];
    
    
}


@end
