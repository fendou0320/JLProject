//
//  UIBezierPathVC.m
//  JLProject
//
//  Created by jiangliang on 2020/4/13.
//  Copyright © 2020 wangjiangliang. All rights reserved.
//

#import "UIBezierPathVC.h"

@interface UIBezierPathVC ()

@property (nonatomic, strong) NSMutableArray *pointYArray;
@property (nonatomic, strong) CAShapeLayer *bezierLineLayer;

@end

@implementation UIBezierPathVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    [self userBezier];

    
}

- (void)userBezier{
    
    //椭圆
    UIBezierPath *berierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 100, 200)];
    [berierPath stroke];
    
    //矩形
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:CGRectMake(10, 300, 100, 100)];
    [berierPath appendPath:rectPath];
    
    //圆弧
    UIBezierPath *ovalPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(250, 100) radius:30 startAngle:0 endAngle:3.14 clockwise:NO];
    [berierPath appendPath:ovalPath];
    
    //绘制多边图形
    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    [trianglePath moveToPoint:CGPointMake(250, 300)];
    [trianglePath addLineToPoint:CGPointMake(250, 330)];
    [trianglePath addLineToPoint:CGPointMake(280, 330)];
    [trianglePath addLineToPoint:CGPointMake(280, 300)];
    [trianglePath closePath];
    [berierPath appendPath:trianglePath];
    
    //添加二阶的曲线,二阶曲线一共三个点，起点、终点、折点
    UIBezierPath *curvepath = [UIBezierPath bezierPath];
    [curvepath moveToPoint:CGPointMake(250, 400)];
    [curvepath addQuadCurveToPoint:CGPointMake(250, 450) controlPoint:CGPointMake(350, 400)];
    [berierPath appendPath:curvepath];
    
    //添加三阶曲线，三阶曲线一共四个点，起点、终点和两个控制点
    UIBezierPath *threePach = [UIBezierPath bezierPath];
    [threePach moveToPoint:CGPointMake(300, 550)];
    [threePach addCurveToPoint:CGPointMake(300, 650) controlPoint1:CGPointMake(350, 650) controlPoint2:CGPointMake(350, 550)];
    [berierPath appendPath:threePach];
        
    
    _bezierLineLayer = [CAShapeLayer layer];
    _bezierLineLayer.path = berierPath.CGPath;
    _bezierLineLayer.strokeColor = [UIColor.greenColor CGColor];
    _bezierLineLayer.fillColor = [[UIColor whiteColor] CGColor];
    [self.view.layer addSublayer:_bezierLineLayer];
    
    
}


@end
