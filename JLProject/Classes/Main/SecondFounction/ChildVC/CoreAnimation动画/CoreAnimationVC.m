//
//  CoreAnimationVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/25.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "CoreAnimationVC.h"

#define k_angleToRadius(angle) ((angle)/180.0 * M_PI)

@interface CoreAnimationVC ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation CoreAnimationVC
/*
 加载图片
 
 */


//隐式动画默认开启、0.25秒
//uiview关闭隐式动画


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 50, 50)];
    [self.view addSubview:_imageView];
//    _imageView.backgroundColor = RandomColor;
    _imageView.image = [UIImage imageNamed:@"AlipayIcon"];
    
    
    //关键帧动画
//    [self ]
    
    
    
    
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.values = @[@k_angleToRadius(-5), @k_angleToRadius(5), @k_angleToRadius(-5)];
    anim.repeatCount = MAXFLOAT;
    anim.duration = 0.25;
    [_imageView.layer addAnimation:anim forKey:nil];
    
    [self bezierLine];
    
}

/*
 动画是由底层的Open GL 实现的
 着色器
 FFpeg
 */

/*
 贝塞尔曲线:把曲线转化成数字公式
 数据点、控制点
 
 frame 和 bounds
 当视图旋转后（仿射变换等）：frame的宽高依然是以前的宽高；bounds的宽高不一定；
 锚点：
 position是锚点相对于父图层的坐标
 */
- (void)bezierLine{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 300)];
//    [path addLineToPoint:CGPointMake(300, 280)];
    [path addCurveToPoint:CGPointMake(300, 280) controlPoint1:CGPointMake(150, 350) controlPoint2:CGPointMake(200, 200)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = nil;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];
    
    
    CALayer *carLayer = [CALayer layer];
    carLayer.frame = CGRectMake(0, 100, 36, 36);
    carLayer.position = CGPointMake(50, 300);
    carLayer.anchorPoint = CGPointMake(0.5, 0.5);
    carLayer.contents = (__bridge id)[UIImage imageNamed:@"car"].CGImage;
    [self.view.layer addSublayer:carLayer];
    
    //添加关键帧动画
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"position";
    keyAnimation.path = path.CGPath;
    keyAnimation.duration = 4.0;
    keyAnimation.rotationMode = kCAAnimationRotateAuto;
    keyAnimation.removedOnCompletion = NO;
    keyAnimation.fillMode = kCAFillModeForwards;
    
    [carLayer addAnimation:keyAnimation forKey:nil];
    
}


@end
