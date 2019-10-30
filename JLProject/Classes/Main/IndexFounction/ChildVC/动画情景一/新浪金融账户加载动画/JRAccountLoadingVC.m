//
//  JRAccountLoadingVC.m
//  JLProject
//
//  Created by jiangliang on 2019/5/24.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "JRAccountLoadingVC.h"
#import "TotalAssetsView.h"

@interface JRAccountLoadingVC ()

@property (nonatomic, strong) UIButton *btnOne;

@end

@implementation JRAccountLoadingVC

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self creatCircleBtn];
    
    self.btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnOne.frame = CGRectMake(0, SIZE_IPHONE6(0), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:self.btnOne];
    self.btnOne.backgroundColor = RandomColor;
    [self.btnOne setTitle:@"btnOne" forState:UIControlStateNormal];
    [self.btnOne addTarget:self action:@selector(creatCircleBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)creatCircleBtn{
    
    float a=301.25,b=235.23,c=452.65;
    
    TotalAssetsView *assetsView = [[TotalAssetsView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    assetsView.circleArray =@[@{@"strokeColor":[UIColor redColor],
                                @"precent":@(a/(a+b+c))},
                              @{@"strokeColor":[UIColor orangeColor],
                                @"precent":@(b/(a+b+c))},
                              @{@"strokeColor":[UIColor yellowColor],
                                @"precent":@(c/(a+b+c))}];
    [self.view addSubview:assetsView];
    
}

@end
