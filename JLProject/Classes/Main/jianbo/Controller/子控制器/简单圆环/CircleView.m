//
//  CircleView.m
//  Dashed
//
//  Created by UCS on 2017/4/21.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "CircleView.h"

#define kBorderWith 50

@implementation CircleView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [self drawCircle:rect];
}

- (void)drawCircle:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    /**
     *  画空心圆
     */
    CGRect bigRect = CGRectMake(rect.origin.x + kBorderWith,
                                rect.origin.y+ kBorderWith,
                                rect.size.width - kBorderWith*2,
                                rect.size.height - kBorderWith*2);
    //设置空心圆的线条宽度
    CGContextSetLineWidth(ctx, kBorderWith);
    //以矩形bigRect为依据画一个圆
    CGContextAddEllipseInRect(ctx, bigRect);
    //填充当前绘画区域的颜色
    [[UIColor greenColor] set];
    //(如果是画圆会沿着矩形外围描画出指定宽度的（圆线）空心圆)/（根据上下文的内容渲染图层）
    CGContextStrokePath(ctx);
}



@end
