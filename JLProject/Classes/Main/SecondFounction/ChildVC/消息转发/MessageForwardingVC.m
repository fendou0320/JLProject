//
//  MessageForwardingVC.m
//  JLProject
//
//  Created by UCS on 2018/7/10.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MessageForwardingVC.h"
#import "Son.h"
#import "Father.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface MessageForwardingVC ()

@end

@implementation MessageForwardingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息转发--使用情景一";

    //模拟系统方法的实现
//    Son *son = [[Son alloc] init];
//    Son *son = objc_msgSend([Son class], @selector(alloc));
//    Son *son = objc_msgSend(objc_getClass("Son"), sel_registerName("alloc"));
    
//    son = objc_msgSend(son, @selector(init));
//    son = objc_msgSend(son, sel_registerName("init"));

    Son *son = objc_msgSend(objc_msgSend(objc_getClass("Son"), sel_registerName("alloc")), sel_registerName("init"));
    
//    //常规--两种方法调用语法
//    //(1)
//    [son run];
//    //(2)@selector(run):方法编号
//    [son performSelector:@selector(run)];
    
    //消息发送-调用
    objc_msgSend(son, @selector(run));
    
    objc_msgSend(son, @selector(sing:), @"最初的梦想");
    
    objc_msgSend(son, @selector(sing:withEat:), @"梦想", @"红烧肉");
    
    objc_msgSend(son, @selector(sing:withEat:), @"梦想");
    
    [[Father new] sendMessage];
    
}








@end
