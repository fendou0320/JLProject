//
//  NSThreadQIYOne.m
//  JLProject
//
//  Created by jiangliangwang on 2018/8/14.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "NSThreadQIYOne.h"

@interface NSThreadQIYOne ()
@property (nonatomic, strong) UIButton *btnOne;
@property (nonatomic, strong) UIButton *btnTwo;
@end

@implementation NSThreadQIYOne

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"nsthread一直存活，可cancel";
    
    [self setUpBtnUI];
    
    
}

- (void)setUpBtnUI{
    
    self.btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnOne.frame = CGRectMake(0, SIZE_IPHONE6(0), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:self.btnOne];
    self.btnOne.backgroundColor = RandomColor;
    [self.btnOne setTitle:@"btnOne" forState:UIControlStateNormal];
    [self.btnOne addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnTwo.frame = CGRectMake(0, SIZE_IPHONE6(40), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:self.btnTwo];
    self.btnTwo.backgroundColor = RandomColor;
    [self.btnTwo setTitle:@"btnTwo" forState:UIControlStateNormal];
    [self.btnTwo addTarget:self action:@selector(btnTwo:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnOne: (UIButton *)sender{
    
    [AppUtily showAlertViewWithTitle:@"创建完成" message:@"开始执行"];
    
    
}

- (void)btnTwo: (UIButton *)sender{
    
    
}








@end
