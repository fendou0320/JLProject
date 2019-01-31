//
//  DashBoardController.m
//  JLProject
//
//  Created by jiangliang on 2018/9/13.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "DashBoardController.h"
#import "DashBoardView.h"

@interface DashBoardController ()

@end

@implementation DashBoardController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    DashBoardView *dashBoardView = [[DashBoardView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:dashBoardView];
    dashBoardView.backgroundColor = [UIColor grayColor];
    dashBoardView.dashBoardWidth = 190;
    dashBoardView.dashBoardHeight = 190;
    dashBoardView.internalLineAngle = 120;
    dashBoardView.scaleAngle = 100;
    [dashBoardView drawDashBoardView];
    
    [dashBoardView setUpDashboardPointerPointing:100];
}


@end
