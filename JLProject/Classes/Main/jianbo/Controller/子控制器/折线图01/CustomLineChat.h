//
//  CustomLineChat.h
//  Dashed
//
//  Created by UCS on 2017/5/31.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLineChat : UIView
/**
 *  Y，X字体颜色
 */
@property (nonatomic, strong) UIColor * xAndYNumberColor;
/**
 X和Y字体大小
 */
@property (nonatomic,assign) CGFloat yDescTextFontSize;
@property (nonatomic,assign) CGFloat xDescTextFontSize;
/**
 X和Y线条颜色
 */
@property (nonatomic, strong) UIColor * xAndYLineColor;
/**
 *  图表的边界值
 */
@property (nonatomic, assign) UIEdgeInsets contentInsets;
/**
 *  图表的原点值（如果需要）
 */
@property (assign, nonatomic)  CGPoint chartOrigin;
/**
 设置每条线的颜色
 */
@property (nonatomic, strong) NSMutableArray *lineColorArr;
/**
 设置圆点
 */
@property (nonatomic, assign) BOOL isHavePoint;
/**
 虚线
 */
@property (nonatomic, assign) BOOL showYLevelLine;

- (void)reloadXdata: (NSMutableArray *)xdata ydata: (NSMutableArray *)ydata positionData: (NSMutableArray *)positionData;




@end
