//
//  ArchivingVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/12.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "ArchivingVC.h"
#import "ArchivingPerson.h"
#import <objc/message.h>

@interface ArchivingVC ()

@end

@implementation ArchivingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
    
    //运行时
    /*
    Method：成员方法
    ivar：成员属性
    */
    
    unsigned int count = 0;
    
    class_copyIvarList([ArchivingPerson class], &count);
    
    
}

- (void)setUpUI{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 100, kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btn];
    btn.backgroundColor = RandomColor;
    [btn setTitle:@"归档" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btntwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btntwo.frame = CGRectMake(0, SIZE_IPHONE6(300), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btntwo];
    btntwo.backgroundColor = RandomColor;
    [btntwo setTitle:@"解档" forState:UIControlStateNormal];
    [btntwo addTarget:self action:@selector(btnTwo:) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSLog(@"%@", NSTemporaryDirectory());
}

- (void)btnOne: (UIButton *)sender{
    
    ArchivingPerson *person = [[ArchivingPerson alloc] init];
    person.name = @"jiangliang";
    person.age = @"18";
    
    NSString *temp = NSTemporaryDirectory();
    NSString *filePath = [temp stringByAppendingPathComponent:@"jiangLiang.text"];
    //归档
    [NSKeyedArchiver archiveRootObject:person toFile:filePath];
    
}

- (void)btnTwo: (UIButton *)sender{
    
    NSString *temp = NSTemporaryDirectory();
    NSString *filePath = [temp stringByAppendingPathComponent:@"jiangLiang.text"];
    //解档
    ArchivingPerson *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    DLog(@"%@老师%@岁了", p.name, p.age);
    
}


@end
