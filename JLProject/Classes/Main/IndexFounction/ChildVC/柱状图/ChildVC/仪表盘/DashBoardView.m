//
//  DashBoardView.m
//  JLProject
//
//  Created by jiangliang on 2018/9/13.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "DashBoardView.h"

@interface DashBoardView ()
@property (nonatomic, strong) UIView *clockView;
@end

@implementation DashBoardView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawDashBoardView{
    // 主背景色
    self.backgroundColor = [UIColor lightGrayColor];
    // 渐变背景
    CALayer *gradientLayer = [CALayer layer];
    gradientLayer.frame = CGRectMake((self.dashBoardWidth - 300)/2, (self.dashBoardHeight - 300)/2, 300, 300);
    gradientLayer.backgroundColor = [[UIColor whiteColor] CGColor];
    [self.layer addSublayer:gradientLayer];
    
    CGFloat radiusWidth = 140;
    // 开始和结束角度
    CGFloat startA = -M_PI - 0.2 * M_PI;
    CGFloat endA = 0.2 * M_PI;
    
    CGFloat oneStart = -M_PI - 0.2 * M_PI;
    CGFloat oneEnd = -M_PI + 0.85 * M_PI;
    
    CGFloat twoStart = -M_PI - 0.2 * M_PI;
    CGFloat twoEnd = -M_PI + 0.5 * M_PI;
    
    CGFloat threeStart = -M_PI - 0.2 * M_PI;
    CGFloat threeEnd = -M_PI + 0.3 * M_PI;
    
    CGFloat fourStart = -M_PI - 0.2 * M_PI;
    CGFloat fourEnd = -M_PI + 0.05 * M_PI;
 
    // 最外圈圆弧
    for (NSInteger i = 0; i < 5; i++) {
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.lineCap = kCALineCapRound;
        layer.lineWidth = 20;
        UIBezierPath *path;
        if (i == 0) {
           path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.dashBoardWidth/2, self.dashBoardHeight/2) radius:radiusWidth startAngle:startA endAngle:endA clockwise:YES];
            //填充色
            layer.strokeColor = [UIColor redColor].CGColor;
            //描边色
//            layer.fillColor = [UIColor greenColor].CGColor;
        }else if ( i == 1){
            path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.dashBoardWidth/2, self.dashBoardHeight/2) radius:radiusWidth startAngle:oneStart endAngle:oneEnd clockwise:YES];
            layer.strokeColor = [UIColor orangeColor].CGColor;
            //            layer.fillColor = [UIColor purpleColor].CGColor;
        }else if ( i == 2){
            path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.dashBoardWidth/2, self.dashBoardHeight/2) radius:radiusWidth startAngle:twoStart endAngle:twoEnd clockwise:YES];
            layer.strokeColor = [UIColor greenColor].CGColor;
            //            layer.fillColor = [UIColor purpleColor].CGColor;
        }else if ( i == 3){
            path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.dashBoardWidth/2, self.dashBoardHeight/2) radius:radiusWidth startAngle:threeStart endAngle:threeEnd clockwise:YES];
            layer.strokeColor = [UIColor grayColor].CGColor;
            //            layer.fillColor = [UIColor purpleColor].CGColor;
        }else if ( i == 4){
            path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.dashBoardWidth/2, self.dashBoardHeight/2) radius:radiusWidth startAngle:fourStart endAngle:fourEnd clockwise:YES];
            layer.strokeColor = [UIColor purpleColor].CGColor;
            //            layer.fillColor = [UIColor purpleColor].CGColor;
        }
        layer.path = path.CGPath;
        [self.layer addSublayer:layer];
    }
    
    // 中间圆弧
    UIBezierPath *path3 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.dashBoardWidth/2, self.dashBoardHeight/2) radius:10 startAngle:-M_PI endAngle:M_PI clockwise:YES];
    CAShapeLayer *layer3 = [CAShapeLayer layer];
    layer3.lineCap = kCALineCapSquare;
    layer3.fillColor = [UIColor clearColor].CGColor;
    layer3.fillColor = [UIColor grayColor].CGColor;
    layer3.lineWidth = 7;
    layer3.strokeColor = [UIColor whiteColor].CGColor;
    layer3.strokeColor = [UIColor purpleColor].CGColor;
    layer3.path = path3.CGPath;
    [self.layer addSublayer:layer3];
    
    // 指针
    UIView *clockView = [[UIView alloc] initWithFrame:CGRectMake((self.dashBoardWidth-140)/2, (self.dashBoardHeight-2)/2, 140, 2)];
    clockView.backgroundColor = [UIColor orangeColor];
    clockView.layer.anchorPoint = CGPointMake(1.08, 0.5);
    [self addSubview:clockView];
    _clockView = clockView;
    clockView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, -0.2*M_PI);
    
    // 刻度
    CGFloat perAngle = 1.4 * M_PI / 80;
    for (NSInteger j = 0; j < 33; j++) {
        NSInteger i = j * 2.5;
        CGFloat startAngel = (startA + perAngle * i);
        CGFloat endAngel   = startAngel + perAngle/5;
        CGFloat middleAngle = (startAngel - endAngel);
        UIBezierPath *tickPath = nil;
        CAShapeLayer *perLayer = [CAShapeLayer layer];
        perLayer.strokeColor = [UIColor whiteColor].CGColor;
        //        perLayer.strokeColor = [UIColor greenColor].CGColor;
        if (i % 5 == 0) {
            if (i % 10) {
                //为10的倍数
                tickPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.dashBoardWidth/2, self.dashBoardHeight/2) radius:(self.internalLineAngle) startAngle:(startAngel + middleAngle/2) endAngle:(endAngel + middleAngle/2) clockwise:YES];
                perLayer.lineWidth   = 10.f;
                CGPoint point      = [self calculateTextPositonWithArcCenter:CGPointMake(self.dashBoardWidth/2, self.dashBoardHeight/2) Angle:-(startAngel + endAngel)/2];
                NSString *tickText = [NSString stringWithFormat:@"%ld",i * 2];
                UILabel *text      = [[UILabel alloc] init];
                text.text          = tickText;
                text.font          = [UIFont systemFontOfSize:10];
                text.textAlignment = NSTextAlignmentCenter;
                text.textColor     = [UIColor grayColor];
                CGFloat w = [text sizeThatFits:CGSizeZero].width;
                CGFloat h = [text sizeThatFits:CGSizeZero].height;
                text.frame = CGRectMake(point.x - w/2, point.y - h/2, w, h);
                [self addSubview:text];
            }else{
                tickPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.dashBoardWidth/2, self.dashBoardHeight/2) radius:(self.internalLineAngle) startAngle:(startAngel + middleAngle/2) endAngle:(endAngel + middleAngle/2) clockwise:YES];
                perLayer.lineWidth   = 15.f;
                CGPoint point      = [self calculateTextPositonWithArcCenter:CGPointMake(self.dashBoardWidth/2, self.dashBoardHeight/2) Angle:-(startAngel + endAngel)/2];
                NSString *tickText = [NSString stringWithFormat:@"%ld",i * 2];
                UILabel *text      = [[UILabel alloc] init];
                text.text          = tickText;
                text.font          = [UIFont systemFontOfSize:10];
                text.textColor     = [UIColor whiteColor];
                text.textAlignment = NSTextAlignmentCenter;
                CGFloat w = [text sizeThatFits:CGSizeZero].width;
                CGFloat h = [text sizeThatFits:CGSizeZero].height;
                text.frame = CGRectMake(point.x - w/2, point.y - h/2, w, h);
                [self addSubview:text];
            }
        } else {
            tickPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.dashBoardWidth/2, self.dashBoardHeight/2) radius:(self.internalLineAngle) startAngle:(startAngel + middleAngle/2) endAngle:(endAngel + middleAngle/2) clockwise:YES];
            perLayer.lineWidth   = 10.0f;
            perLayer.strokeColor = [UIColor grayColor].CGColor;
        }
        perLayer.path = tickPath.CGPath;
        [self.layer addSublayer:perLayer];
    }
}

// 计算位置,默认半径125
- (CGPoint)calculateTextPositonWithArcCenter:(CGPoint)center Angle:(CGFloat)angel {
    CGFloat x = self.scaleAngle * cosf(angel);
    CGFloat y = self.scaleAngle * sinf(angel);
    return CGPointMake(center.x + x, center.y - y);
}

- (void)setUpDashboardPointerPointing: (CGFloat)progress
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 1.0f;
    //防止动画结束后回到初始状态
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.fromValue = @(-0.2*M_PI);
    animation.toValue = @(1.4*M_PI*(progress/160) - 0.2*M_PI);
    [_clockView.layer addAnimation:animation forKey:@"dsgsdg"];
}


@end
