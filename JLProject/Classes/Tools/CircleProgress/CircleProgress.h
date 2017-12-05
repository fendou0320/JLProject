//
//  CircleProgress.h
//  JLVideoPlayer
//
//  Created by UCS on 2017/4/27.
//  Copyright © 2017年 WangJiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleProgress : UIView
/**
 线条背景色
 */
@property (nonatomic, strong) UIColor *pathBackColor;
/**
 线条填充色
 */
@property (nonatomic, strong) UIColor *pathFillColor;
/**
 起点角度。角度从水平右侧开始为0，顺时针为增加角度。直接传度数 如-90
 */
@property (nonatomic, assign) CGFloat startAngle;
/**
 线宽
 */
@property (nonatomic, assign) CGFloat strokeWidth;
/**
 减少的角度 直接传度数 如30
 */
@property (nonatomic, assign) CGFloat reduceValue;


@end
