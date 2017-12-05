//
//  HistogramView.m
//  Dashed
//
//  Created by UCS on 2017/4/27.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "HistogramView.h"

#define bounceX 30
#define bounceY 40
#define histogramwidth 40
#define histogramHeight 200

@implementation HistogramView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self createLabelX];
        [self createLabelY];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //画出坐标轴
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextMoveToPoint(context, bounceX, bounceY);
    CGContextAddLineToPoint(context, bounceX, rect.size.height - bounceY);
    CGContextAddLineToPoint(context,rect.size.width -  bounceX, rect.size.height - bounceY);
    //X轴尖角
    CGContextMoveToPoint(context, rect.size.width - bounceX - 10, rect.size.height - bounceY-10);
    CGContextAddLineToPoint(context,rect.size.width -  bounceX, rect.size.height - bounceY);
    CGContextAddLineToPoint(context, rect.size.width - bounceX - 10, rect.size.height - bounceY + 10);
    //Y轴尖角
    CGContextMoveToPoint(context, bounceX-10, bounceY+10);
    CGContextAddLineToPoint(context, bounceX, bounceY);
    CGContextAddLineToPoint(context, bounceX+10, bounceY+10);
    //结束
    CGContextStrokePath(context);
}

#pragma mark 创建x轴的数据
- (void)createLabelX
{
    CGFloat  month = 3;
    for (NSInteger i = 0; i < month; i++) {
        //设置文字
        UILabel * LabelMonth = [[UILabel alloc]initWithFrame:CGRectMake((self.frame.size.width - 2*bounceX)/month * i + bounceX, self.frame.size.height - bounceY + bounceY*0.3, (self.frame.size.width - 2*bounceX)/month- 5, bounceY/2)];
        //        LabelMonth.backgroundColor = [UIColor greenColor];
        LabelMonth.textAlignment = NSTextAlignmentCenter;
        LabelMonth.text = [NSString stringWithFormat:@"%ld月",i+1];
        LabelMonth.font = [UIFont systemFontOfSize:10];
        //        LabelMonth.transform = CGAffineTransformMakeRotation(M_PI * 0.3);
        [self addSubview:LabelMonth];
        //设置柱状图
        //柱状图宽度
        CGFloat mouthWidth = (self.frame.size.width - 2*bounceX)/month;
        //柱状图距离左侧信息
        CGFloat mouthLeft = (self.frame.size.width - 2*bounceX)/month * i + bounceX + (mouthWidth-histogramwidth)/2;
        //-1是为了不遮住X轴
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake( mouthLeft, ((self.frame.size.height-2*bounceY)-histogramHeight+bounceY)-1, histogramwidth, histogramHeight)];
        view.backgroundColor = [UIColor orangeColor];
        [self addSubview:view];
    }
}

#pragma mark 创建y轴数据
- (void)createLabelY
{
    CGFloat Ydivision = 3;
    for (NSInteger i = 0; i < Ydivision; i++) {
        //宽度-2是为了不遮住Y轴
        UILabel * labelYdivision = [[UILabel alloc]initWithFrame:CGRectMake(0, (self.frame.size.height - 2 * bounceY)/Ydivision *i + bounceX, bounceX-2, bounceY/2.0)];
        //        labelYdivision.backgroundColor = [UIColor greenColor];
        labelYdivision.textAlignment = NSTextAlignmentCenter;
        labelYdivision.text = [NSString stringWithFormat:@"%.0f",(Ydivision - i)*100];
        labelYdivision.font = [UIFont systemFontOfSize:10];
        [self addSubview:labelYdivision];
    }
}


@end
