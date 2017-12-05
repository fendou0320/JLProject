//
//  YinDaoDemoController.m
//  JLProject
//
//  Created by UCS on 2017/7/31.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "YinDaoDemoController.h"
#import "YinDaoViewController.h"

@interface YinDaoDemoController ()

@end

@implementation YinDaoDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [YinDaoViewController showInView:self.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
