//
//  butongCircle.m
//  JLProject
//
//  Created by UCS on 2017/6/7.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "butongCircle.h"

@implementation butongCircle


- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self pieChartAction];
}


//绘制饼形图
-(void)pieChartAction
{
//    
//    //1.pieView中心点
//    CGFloat centerWidth = self.frame.size.width * 0.5f;
//    CGFloat centerHeight = self.frame.size.height * 0.5f;
//    CGFloat centerX = centerWidth;
//    CGFloat centerY = centerHeight;
//    CGPoint centerPoint = CGPointMake(centerX, centerY);
//    CGFloat radiusBasic = centerWidth > centerHeight ? centerHeight : centerWidth;
//    
//    //计算红绿蓝部分总和
//    _total = 0.0f;
//    for (int i = 0; i < _arrayPoint.count; i++) {
//        _total += [_arrayPoint[i] floatValue];
//    }
//    
//    //线的半径为扇形半径的一半，线宽是扇形半径，这样就能画出圆形了
//    //2.背景路径
//    CGFloat bgRadius = radiusBasic * 0.5;
//    UIBezierPath *bgPath = [UIBezierPath bezierPathWithArcCenter:centerPoint
//                                                          radius:bgRadius
//                                                      startAngle:-M_PI_2
//                                                        endAngle:M_PI_2 * 3
//                                                       clockwise:YES];
//    _bgCircleLayer = [CAShapeLayer layer];
//    _bgCircleLayer.fillColor   = [UIColor clearColor].CGColor;
//    _bgCircleLayer.strokeColor = [UIColor lightGrayColor].CGColor;
//    _bgCircleLayer.strokeStart = 0.0f;
//    _bgCircleLayer.strokeEnd   = 1.0f;
//    _bgCircleLayer.zPosition   = 1;
//    _bgCircleLayer.lineWidth   = bgRadius * 2.0f;
//    _bgCircleLayer.path        = bgPath.CGPath;
//    
//    //3.子扇区路径
//    CGFloat otherRadius = radiusBasic * 0.5 - 3.0;
//    UIBezierPath *otherPath = [UIBezierPath bezierPathWithArcCenter:centerPoint
//                                                             radius:otherRadius
//                                                         startAngle:-M_PI_2
//                                                           endAngle:M_PI_2 * 3
//                                                          clockwise:YES];
//    CGFloat start = 0.0f;
//    CGFloat end = 0.0f;
//    for (int i = 0; i < _arrayPoint.count; i++) {
//        //4.计算当前end位置 = 上一个结束位置 + 当前部分百分比
//        end = [_arrayPoint[i] floatValue] / _total + start;
//        
//        //图层
//        CAShapeLayer *pie = [CAShapeLayer layer];
//        [self.layer addSublayer:pie];
//        pie.fillColor   = kPieFillColor;
//        if (i > _colorItems.count - 1 || !_colorItems  || _colorItems.count == 0) {//如果传过来的颜色数组少于item个数则随机填充颜色
//            pie.strokeColor = kPieRandColor.CGColor;
//        } else {
//            pie.strokeColor = ((UIColor *)_colorItems[i]).CGColor;
//                }
//                pie.strokeStart = start;
//            pie.strokeEnd   = end;
//            pie.lineWidth   = otherRadius * 2.0f;
//            pie.zPosition   = 2;
//            pie.path        = otherPath.CGPath;
//            
//            //计算百分比label的位置
//            CGFloat centerAngle = M_PI * (start + end);
//            CGFloat labelCenterX = kLabelLoctionRatio * sinf(centerAngle) + centerX;
//            CGFloat labelCenterY = -kLabelLoctionRatio * cosf(centerAngle) + centerY;
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, radiusBasic * 0.7f, radiusBasic * 0.7f)];
//            label.center = CGPointMake(labelCenterX, labelCenterY);
//            label.text = [NSString stringWithFormat:@"%ld%%",(long)((end - start + 0.005) * 100)];
//                                                                     label.textAlignment = NSTextAlignmentCenter;
//            label.textColor = [UIColor whiteColor];
//            label.layer.zPosition = 3;
//            [self addSubview:label];
//            //计算下一个start位置 = 当前end位置
//            start = end;
//            }
//            self.layer.mask = _bgCircleLayer;
//    [self stroke];
    
}


//绘制动画（饼形图）
- (void)stroke
{
//    //画图动画
//    self.hidden = NO;
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    animation.duration  = kAnimationDuration;
//    animation.fromValue = @0.0f;
//    animation.toValue   = @1.0f;
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    animation.removedOnCompletion = YES;
//    [_bgCircleLayer addAnimation:animation forKey:@"circleAnimation"];
}


@end
