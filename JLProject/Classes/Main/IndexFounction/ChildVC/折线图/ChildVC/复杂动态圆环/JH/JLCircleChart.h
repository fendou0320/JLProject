//
//  JLCircleChart.h
//  Dashed
//
//  Created by UCS on 2017/4/28.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define P_M(x,y) CGPointMake(x, y)

#define weakSelf(weakSelf)  __weak typeof(self) weakself = self;
#define XORYLINEMAXSIZE CGSizeMake(CGFLOAT_MAX,30)


@interface JLCircleChart : UIView

/**
 *  The margin value of the content view chart view
 *  图表的边界值
 */
@property (nonatomic, assign) UIEdgeInsets contentInsets;

/**
 *  The origin of the chart is different from the meaning of the origin of the chart.
 As a pie chart and graph center ring. The line graph represents the origin.
 *  图表的原点值（如果需要）
 */
@property (assign, nonatomic)  CGPoint chartOrigin;

/**
 *  Name of chart. The name is generally not displayed, just reserved fields
 *  图表名称
 */
@property (copy, nonatomic) NSString * chartTitle;

/**
 *  The fontsize of Y line text.Default id 8;
 */
@property (nonatomic,assign) CGFloat yDescTextFontSize;


@property (nonatomic,assign) CGFloat xDescTextFontSize;


@property (nonatomic, strong) UIColor * xAndYLineColor;


- (void)showAnimation;


- (void)clear;


- (void)drawLineWithContext:(CGContextRef )context
               andStarPoint:(CGPoint )start
                andEndPoint:(CGPoint)end
            andIsDottedLine:(BOOL)isDotted
                   andColor:(UIColor *)color;


- (void)drawText:(NSString *)text
      andContext:(CGContextRef )context
         atPoint:(CGPoint )point
       WithColor:(UIColor *)color
     andFontSize:(CGFloat)fontSize;


- (void)drawText:(NSString *)text
         context:(CGContextRef )context
         atPoint:(CGRect )rect
       WithColor:(UIColor *)color
            font:(UIFont*)font;


- (CGFloat)getTextWithWhenDrawWithText:(NSString *)text;


- (void)drawQuartWithColor:(UIColor *)color
             andBeginPoint:(CGPoint)p
                andContext:(CGContextRef)contex;


- (void)drawPointWithRedius:(CGFloat)redius
                   andColor:(UIColor *)color
                   andPoint:(CGPoint)p
                 andContext:(CGContextRef)contex;


- (CGSize)sizeOfStringWithMaxSize:(CGSize)maxSize
                         textFont:(CGFloat)fontSize
                        aimString:(NSString *)aimString;

@end
