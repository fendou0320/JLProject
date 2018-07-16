//
//  JLRingChart.h
//  Dashed
//
//  Created by UCS on 2017/4/28.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLCircleChart.h"

#define k_Width_Scale  (self.frame.size.width / [UIScreen mainScreen].bounds.size.width)

@interface JLRingChart : JLCircleChart

/**
 *  Data source title Array
 */
@property (nonatomic, strong) NSArray * valueDataTitlesArr;

/**
 *  Data source Array
 */
@property (nonatomic, strong) NSArray * valueDataArr;

/**
 *  An array of colors in the loop graph
 */
@property (nonatomic, strong) NSArray * fillColorArray;

/**
 *  Ring Chart width
 */
@property (nonatomic, assign) CGFloat ringWidth;

/**
 开始动画
 */
- (void)showAnimation;


@end
