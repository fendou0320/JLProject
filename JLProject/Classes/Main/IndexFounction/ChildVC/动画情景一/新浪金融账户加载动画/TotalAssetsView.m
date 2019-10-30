//
//  TotalAssetsView.m
//  JLProject
//
//  Created by jiangliang on 2019/5/24.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "TotalAssetsView.h"

@interface TotalAssetsView ()<CAAnimationDelegate>

//@property (nonatomic, strong) NSMutableArray *shapeLayerArray;
@property (nonatomic,assign) CGFloat currentProgress;
@property (nonatomic,assign) CGFloat spaceProgress;
@property (nonatomic,assign) NSInteger currentAnimationIndex;
@property (nonatomic,strong) CAShapeLayer *lineWidthLayer;
@property (nonatomic,assign) CGFloat maxPercent;
@property (nonatomic,strong) CALayer *roundMaskLayer;


@end

@implementation TotalAssetsView

- (void)initType{
    self.transform = CGAffineTransformMakeRotation(-M_PI_2);
    
    self.spaceProgress = 0.02;
    self.currentProgress = 0;
    self.currentAnimationIndex = 0;
    self.maxPercent = 0;
    
    CGFloat percent = [self percentWithIndex:0];
    UIColor *strokeColor = [self strokeColorWithIndex:0];
    [self strokeAnimationWithStart:self.currentProgress strokeEnd:percent stokeColor:strokeColor animationTime:3.0*percent];
    self.currentProgress = percent;
}

- (CGFloat)percentWithIndex:(NSInteger)index {
    CGFloat percent = [[self.circleArray[index] objectForKey:@"precent"] floatValue];
    return percent * (1 - self.spaceProgress*self.circleArray.count);
}

- (UIColor *)strokeColorWithIndex:(NSInteger)index {
    return [self.circleArray[index] objectForKey:@"strokeColor"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (self.currentAnimationIndex < self.circleArray.count-1) {
        self.currentAnimationIndex += 1;
        CGFloat percent = [self percentWithIndex:self.currentAnimationIndex];
        UIColor *strokeColor = [self strokeColorWithIndex:self.currentAnimationIndex];
        self.currentProgress+= self.spaceProgress;
        [self strokeAnimationWithStart:self.currentProgress strokeEnd:percent+self.currentProgress stokeColor:strokeColor animationTime:3.0*percent];
        self.currentProgress += percent;
    } else {
        [self.layer addSublayer:self.roundMaskLayer];
        CGRect roundMaskLayerFrame = self.bounds;
        roundMaskLayerFrame = CGRectInset(roundMaskLayerFrame, 5, 5);
        _roundMaskLayer.frame = roundMaskLayerFrame;
        _roundMaskLayer.cornerRadius = roundMaskLayerFrame.size.width/2.0;
        
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
        scaleAnimation.duration = 0.5;
        scaleAnimation.fromValue = @(10);
        scaleAnimation.toValue = @(24);
        scaleAnimation.removedOnCompletion = NO;
        scaleAnimation.fillMode = kCAFillModeForwards;
        [self.lineWidthLayer addAnimation:scaleAnimation forKey:@"lineWidthLayerAnimation"];
    }
}


- (void)strokeAnimationWithStart:(CGFloat)start strokeEnd:(CGFloat)end stokeColor:(UIColor *)strokeColor animationTime:(CGFloat)animationDuration {
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    if (end-start > self.maxPercent) {
        self.maxPercent = end-start;
        self.lineWidthLayer = shapeLayer;
    }
    
    shapeLayer.frame =CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);//设置shapeLayer的尺寸和位置
    shapeLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色为ClearColor
    //设置线条的宽度和颜色
    shapeLayer.lineWidth =  10.0;
    shapeLayer.strokeColor = [strokeColor CGColor];
    
    //创建出圆形贝塞尔曲线
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0, self.bounds.size.width,self.bounds.size.height)];
    
    //让贝塞尔曲线与CAShapeLayer产生联系
    shapeLayer.path = circlePath.CGPath;
    shapeLayer.strokeStart = start;
    shapeLayer.strokeEnd = end;
    shapeLayer.shadowColor = [strokeColor CGColor];
    shapeLayer.shadowOffset = CGSizeMake(3, 2);
    shapeLayer.shadowOpacity = 0.2;
    [self.layer addSublayer:shapeLayer];
    
    //添加圆环动画
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = animationDuration;
    pathAnimation.fromValue = @(start);
    pathAnimation.toValue = @(end);
    pathAnimation.delegate = self;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [shapeLayer addAnimation:pathAnimation forKey:@"animation"];
}

- (CALayer *)roundMaskLayer {
    if (!_roundMaskLayer) {
        _roundMaskLayer = [CALayer layer];
        _roundMaskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    }
    return _roundMaskLayer;
}

/*
 {
 
 __block float a = 0;
 __block CAShapeLayer *scaleLayer = nil;
 
 [self.circleArray enumerateObjectsUsingBlock:^(NSDictionary *obj,NSUInteger idx, BOOL *_Nonnull stop) {
 //创建出CAShapeLayer
 CAShapeLayer *shapeLayer = [CAShapeLayer layer];
 if (idx == 0) {
 scaleLayer = shapeLayer;
 }
 shapeLayer.frame =CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);//设置shapeLayer的尺寸和位置
 shapeLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色为ClearColor
 //设置线条的宽度和颜色
 shapeLayer.lineWidth =10.0f;
 shapeLayer.strokeColor = [obj[@"strokeColor"]CGColor];
 
 //创建出圆形贝塞尔曲线
 UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0, self.bounds.size.width,self.bounds.size.height)];
 //让贝塞尔曲线与CAShapeLayer产生联系
 shapeLayer.path = circlePath.CGPath;
 shapeLayer.strokeStart = a;
 shapeLayer.strokeEnd = [obj[@"precent"]floatValue] + a;
 a = shapeLayer.strokeEnd;
 [self.layer addSublayer:shapeLayer];
 
 //添加圆环动画
 CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
 pathAnimation.duration = 3.0;
 pathAnimation.fromValue = @(0);
 pathAnimation.toValue = @(1);
 pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
 [shapeLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
 
 //        [self.shapeLayerArray addObject:shapeLayer];
 
 }];
 
 
 
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
 CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
 scaleAnimation.duration = 2.0;
 scaleAnimation.fromValue = @(10);
 scaleAnimation.toValue = @(15);
 scaleAnimation.removedOnCompletion = NO;
 scaleAnimation.fillMode = kCAFillModeForwards;
 [scaleLayer addAnimation:scaleAnimation forKey:@"ddd"];
 //        [UIView animateWithDuration:1.0 animations:^{
 //           scaleLayer.lineWidth = 15;
 //        }];
 
 });
 
 //    return;
 //
 //
 //    NSMutableArray *animationArray = [NSMutableArray arrayWithCapacity:2];
 //
 //    for (NSInteger i = 0; i < self.circleArray.count; i++) {
 //
 //        NSDictionary *obj = self.circleArray[i];
 //
 //        //创建出CAShapeLayer
 //        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
 //        //设置shapeLayer的尺寸和位置
 //        shapeLayer.frame =CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
 //        //填充颜色为ClearColor
 //        shapeLayer.fillColor = [UIColor clearColor].CGColor;
 //        shapeLayer.strokeColor = [obj[@"strokeColor"]CGColor];
 //        //设置线条的宽度和颜色
 //        if (i == 0) {
 //            shapeLayer.lineWidth =25.0f;
 //        }else if (i == 1){
 //            shapeLayer.lineWidth =30.0f;
 //        }else if (i == 2){
 //            shapeLayer.lineWidth =25.0f;
 //        }
 //
 //        [self.layer addSublayer:shapeLayer];
 //
 //        //创建出圆形贝塞尔曲线
 //        UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0, self.bounds.size.width,self.bounds.size.height)];
 //        //让贝塞尔曲线与CAShapeLayer产生联系
 //        shapeLayer.path = circlePath.CGPath;
 ////        shapeLayer.strokeStart = a;
 ////        shapeLayer.strokeEnd = [obj[@"precent"]floatValue] + a;
 //        a = [obj[@"precent"]floatValue] + a;
 ////        a = shapeLayer.strokeEnd;
 //
 //        //添加圆环动画
 //        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
 ////        //持续时间
 ////        pathAnimation.duration = 1.0;
 //        //开始位置和结束位置
 //        pathAnimation.fromValue = @(shapeLayer.strokeStart);
 //        pathAnimation.toValue = @(shapeLayer.strokeEnd);
 //        //设置动画的速度变化
 ////        pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
 ////        [shapeLayer addAnimation:pathAnimation forKey:@"Animation"];
 ////        //防止动画结束后回到初始状态
 ////        pathAnimation.removedOnCompletion = NO;
 ////        pathAnimation.fillMode = kCAFillModeForwards;
 //        //装进数组
 //        [animationArray addObject:pathAnimation];
 //
 //        a = 0.01 + a;
 //    }
 //
 ////    [self.layer addSublayer:shapeLayer];
 ////
 ////    //添加圆环动画
 ////    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
 ////    //持续时间
 ////    pathAnimation.duration = 5.0;
 ////    //开始位置和结束位置
 ////    pathAnimation.fromValue = @(0);
 ////    pathAnimation.toValue = @(1);
 ////    //设置动画的速度变化
 ////    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
 ////    [shapeLayer addAnimation:pathAnimation forKey:@"Animation"];
 ////    //防止动画结束后回到初始状态
 ////    pathAnimation.removedOnCompletion = NO;
 ////    pathAnimation.fillMode = kCAFillModeForwards;
 //
 //
 ////    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
 ////    animationGroup.duration = 5.0f;
 ////    animationGroup.fillMode = kCAFillModeForwards;
 ////    animationGroup.removedOnCompletion = NO;
 ////    animationGroup.animations = [animationArray copy];
 ////
 ////    [self.layer addSublayer:shapeLayer];
 ////
 ////    [self.layer addAnimation:animationGroup forKey:@"Animation"];
 
 }
 
 
 */

- (void)setCircleArray:(NSArray *)circleArray
{
    _circleArray = circleArray;
    
   [self initType];
    
}

//- (NSMutableArray *)shapeLayerArray{
//    if (!_shapeLayerArray) {
//        _shapeLayerArray = [NSMutableArray arrayWithCapacity:3];
//    }
//    return _shapeLayerArray;
//}


@end
