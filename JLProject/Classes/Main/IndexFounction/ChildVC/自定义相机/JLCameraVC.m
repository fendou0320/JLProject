//
//  JLCameraVC.m
//  JLProject
//
//  Created by UCS on 2018/8/4.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "JLCameraVC.h"
#import "JLCustomCameraVC.h"

@interface JLCameraVC ()
@property (nonatomic, strong) UIButton *btnOne;
@end

@implementation JLCameraVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnOne.frame = CGRectMake(0, SIZE_IPHONE6(100), kScreenWidth, SIZE_IPHONE6(100));
    [self.view addSubview:self.btnOne];
    self.btnOne.backgroundColor = RandomColor;
    [self.btnOne setTitle:@"自定义相机" forState:UIControlStateNormal];
    [self.btnOne addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnOne: (UIButton *)sender{
    
    JLCustomCameraVC *vc = [[JLCustomCameraVC alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)btnTwo: (UIButton *)sender{
    
    
}

- (void)btnThree: (UIButton *)sender{
    
    
}

- (void)btnFour: (UIButton *)sender{
    
    
}


@end
