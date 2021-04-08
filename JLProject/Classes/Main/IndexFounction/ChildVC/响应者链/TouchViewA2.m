//
//  TouchViewA2.m
//  JLProject
//
//  Created by jiangliang on 2020/6/23.
//  Copyright © 2020 wangjiangliang. All rights reserved.
//

#import "TouchViewA2.h"

@implementation TouchViewA2

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"click TouchViewA2");
}

// // 改变图片的点击范围
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    // 控件范围宽度多40，高度20
    CGRect bounds = CGRectInset(self.bounds, -20, -20);
    // NSLog(@"point = %@",NSStringFromCGPoint(point));
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 30, 200, 20)];
    if ([path containsPoint:point]&& CGRectContainsPoint(bounds, point)){
        //如果在path区域内，返回YES
        return YES;
    }
    return NO;
    
}


@end
