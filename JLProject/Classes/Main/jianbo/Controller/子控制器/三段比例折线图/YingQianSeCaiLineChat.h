//
//  YingQianSeCaiLineChat.h
//  UcsProject
//
//  Created by UCS on 2017/6/11.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kYBottom 48.0f/2
#define kYMiddle 126.0f/2
#define kYTop 54.0f/2

@interface YingQianSeCaiLineChat : UIView

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
@property (nonatomic, strong) UIColor *HuiZhilineColor;
/**
 虚线
 */
@property (nonatomic, assign) BOOL showYLevelLine;
/**
 x轴标注
 */
@property (nonatomic, copy) NSString *xBiaoZhu;
/**
 y轴标注
 */
@property (nonatomic, copy) NSString *yBiaoZhu;
/**
 第一个点X坐标 距离圆点的距离
 */
@property (nonatomic, assign) CGFloat firstXRangeStart;
/**
 最后一个点X坐标 距离右端的长度
 */
@property (nonatomic, assign) CGFloat lastXRangeEnd;
/**
 最后一个Y坐标距离上部的距离
 */
@property (nonatomic, assign) CGFloat lastYRangeEnd;
/**
 三段距离之间的比例
 */
@property (nonatomic, strong) NSMutableArray *biLiArray;
/**
 虚线颜色
 */
@property (nonatomic, strong) UIColor *leveLineColor;

- (void)reloadXdata: (NSMutableArray *)xdata ydata: (NSMutableArray *)ydata positionData: (NSMutableArray *)positionData;

@end
