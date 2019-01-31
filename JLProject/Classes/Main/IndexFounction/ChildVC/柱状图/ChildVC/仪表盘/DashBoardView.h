//
//  DashBoardView.h
//  JLProject
//
//  Created by jiangliang on 2018/9/13.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashBoardView : UIView
//内部刻度半径
@property (nonatomic, assign) CGFloat internalLineAngle;
//内部刻度标注
@property (nonatomic, assign) CGFloat scaleAngle;

@property (nonatomic, assign) CGFloat dashBoardWidth;

@property (nonatomic, assign) CGFloat dashBoardHeight;

//回执仪表盘
- (void)drawDashBoardView;

//确定指针指向
- (void)setUpDashboardPointerPointing: (CGFloat)progress;

@end
