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
    Son *son = [[Son alloc] init];
    
    objc_msgSend(son, @selector(run));
    
    objc_msgSend(son, @selector(sing:), @"最初的梦想");
    
    objc_msgSend(son, @selector(sing:withEat:), @"梦想", @"红烧肉");
    
    objc_msgSend(son, @selector(sing:withEat:), @"梦想");

    
}








@end
