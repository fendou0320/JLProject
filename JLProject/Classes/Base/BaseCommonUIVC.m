//
//  BaseCommonUIVC.m
//  JLProject
//
//  Created by UCS on 2018/8/1.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "BaseCommonUIVC.h"

@interface BaseCommonUIVC ()

@end

@implementation BaseCommonUIVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setUpFourBtnUI{
    
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
    
    self.btnThree = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnThree.frame = CGRectMake(0, SIZE_IPHONE6(80), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:self.btnThree];
    self.btnThree.backgroundColor = RandomColor;
    [self.btnThree setTitle:@"btnThree" forState:UIControlStateNormal];
    [self.btnThree addTarget:self action:@selector(btnThree:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnFour = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnFour .frame = CGRectMake(0, SIZE_IPHONE6(120), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:self.btnFour ];
    self.btnFour.backgroundColor = RandomColor;
    [self.btnFour setTitle:@"btnFour" forState:UIControlStateNormal];
    [self.btnFour addTarget:self action:@selector(btnFour:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnOne: (UIButton *)sender{
    
    
}

- (void)btnTwo: (UIButton *)sender{
    
    
}

- (void)btnThree: (UIButton *)sender{
    
    
}

- (void)btnFour: (UIButton *)sender{
    
    
}


@end
