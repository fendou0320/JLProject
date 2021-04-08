//
//  Animation2.m
//  JLProject
//
//  Created by jiangliang on 2020/4/16.
//  Copyright © 2020 wangjiangliang. All rights reserved.
//

#import "Animation2.h"

@interface Animation2 ()

@end

@implementation Animation2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //去swift项目中实现
    
    //请画出一条开始和结束比较慢, 中间比较快的⻉塞尔曲线(即 UIViewAnimationOptionCurveEaseInOut). 另外能否给出一条有弹性效果的曲线.

    
    
//    @synchronized (self) {
//        sleep(2);
//    }
    
//    NSConditionLock *lock1 = [[NSConditionLock alloc] initWithCondition:0];
//    lock1 lockWhenCondition:0
    
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//        NSLog(@"任务一");
//        sleep(3);
//        dispatch_semaphore_signal(semaphore);
//    });
//    NSLog(@"任务结束");
    
//    return;

    

    UIBezierPath *animationPath = [UIBezierPath bezierPath];
    [animationPath moveToPoint:CGPointMake(100, 100)];
//    [animationPath addLineToPoint:CGPointMake(300, 100)];
//    [animationPath addLineToPoint:CGPointMake(300, 500)];
    [animationPath addLineToPoint:CGPointMake(100, 500)];
    [animationPath stroke];

//    NSValue *orginalValue = [NSValue valueWithCGPoint:self.view.layer.position];
//    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(300, 100)];
//    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(300, 500)];
//    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(100, 500)];

    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.path = animationPath.CGPath;
    [self.view.layer addSublayer:layer];

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = [NSNumber numberWithInt:0];
    animation.toValue = [NSNumber numberWithInt:1];
    animation.duration = 2;
    animation.repeatCount = 10;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    [layer addAnimation:animation forKey:nil];
    

    
    
//    CAKeyframeAnimation *keyFA = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    keyFA.values = @[orginalValue, value1, value2, value3];
//    keyFA.keyTimes = @[@(0.0), @(1), @(2), @(1)];
//    keyFA.duration = 5;
//    keyFA.repeatCount = 100;
//
//    [self.view.layer addAnimation:keyFA forKey:@""];
    
    
    

    
    
    
    
    
    
}





@end
