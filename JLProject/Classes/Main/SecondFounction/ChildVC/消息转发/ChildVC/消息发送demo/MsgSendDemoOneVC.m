//
//  MsgSendDemoOneVC.m
//  JLProject
//
//  Created by UCS on 2018/8/8.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MsgSendDemoOneVC.h"

@interface MsgSendDemoOneVC ()
@property (nonatomic, strong) MsgSendDemoOneVC *objc;
@property (nonatomic, weak) MsgSendDemoOneVC *objcB;
@end

@implementation MsgSendDemoOneVC

/*
 先说结论：OC中向nil发消息，程序是不会崩溃的。
 因为OC的函数都是通过objc_msgSend进行消息发送来实现的，相对于C和C++来说，对于空指针的操作会引起crash问题，而objc_msgSend会通过判断self来决定是否发送消息，如果self为nil，那么selector也会为空，直接返回，不会出现问题。视方法返回值，向nil发消息可能会返回nil（返回值为对象），0（返回值为一些基础数据）或0X0（返回值为id）等。但对于[NSNull null]对象发送消息时，是会crash的，因为NSNull类只有一个null方法。
*/


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"向一个nil对象发送消息";

    self.objc = [[MsgSendDemoOneVC alloc] init];
    self.objc = nil;
    [self.objc eatFood];
    DLog(@"self.objc没有崩溃--类对象为空：%@", self.objc);
    
    @autoreleasepool {
        @autoreleasepool {
            MsgSendDemoOneVC *objcB = [[MsgSendDemoOneVC alloc] init];
            self.objcB = objcB;
        }
    }
    [self.objcB eatFood];
    DLog(@"self.objcB--类对象为空：%@", self.objcB);

    
 
    
}







@end
