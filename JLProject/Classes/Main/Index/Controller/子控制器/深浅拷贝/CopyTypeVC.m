//
//  CopyTypeVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/6/16.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "CopyTypeVC.h"

@interface CopyTypeVC ()

@end

@implementation CopyTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"深浅拷贝";
    
    //非集合类对象
    NSString *imutableStr = @"123456";
    DLog(@"不可变原类型：%p", imutableStr);
    DLog(@"copy类型：%p", [imutableStr copy]);
    DLog(@"mutableCopy类型：%p", [imutableStr mutableCopy]);

    NSMutableString *mutableStr = [NSMutableString stringWithFormat:@"asdfgh"];
    DLog(@"可变原类型：%p", mutableStr);
    DLog(@"copy类型：%p", [mutableStr copy]);
    DLog(@"mutableCopy类型：%p", [mutableStr mutableCopy]);

    //集合类对象
    NSArray *imutableArray = [NSArray arrayWithObjects:@"123",@"456", nil];
    DLog(@"不可变原类型：%p", imutableArray);
    DLog(@"copy类型：%p", [imutableArray copy]);
    DLog(@"mutableCopy类型：%p", [imutableArray mutableCopy]);
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:@"123",@"456", nil];
    DLog(@"可变原类型：%p", mutableArray);
    DLog(@"copy类型：%p", [mutableArray copy]);
    DLog(@"mutableCopy类型：%p", [mutableArray mutableCopy]);
    
    //总结
//    一、不管集合类对象，还是非集合类对象，接收到copy和mutablecopy消息时，都遵循以下原则
//    1、copy返回imutable对象。所以，如果对copy返回值使用mutable对象接口就会crash。
//    2、mutablecopy返回mutable对象
//    二、
//    1、对非集合类对象（nsstring）
//    （1）对imutable对象进行操作
//    <1>对imutable对象进行copy操作，是指针复制（浅拷贝）
//    <2>对imutable对象进行mutableCopy操作，是内容复制（深拷贝）
//    （2）对mutable对象进行操作
//    <1>对mutable对象进行copy操作，是内容复制（深拷贝）
//    <2>对mutable对象进行mutableCopy，是内容复制（深拷贝）
//    2、对集合类对象（nsarray）
//    （1）对imutable对象进行操作
//    <1>对imutable对象进行copy操作，是指针复制（浅拷贝）
//    <2>对imutable对象进行mutableCopy操作，是内容复制（单层深拷贝：对集合类对象是进行了内容复制。而对集合内的元素，是指针复制，属于浅拷贝）
//    （2）对mutable对象进行操作
//    <1>对mutable对象进行copy操作，是内容复制（单层深拷贝：对集合类对象是进行了内容复制。而对集合内的元素，是指针复制，属于浅拷贝）
//    <2>对mutable对象进行mutableCopy，是内容复制（单层深拷贝：对集合类对象是进行了内容复制。而对集合内的元素，是指针复制，属于浅拷贝）
    
    
    
    
}


@end
