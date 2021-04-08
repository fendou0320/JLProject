//
//  TouchViewA1.m
//  JLProject
//
//  Created by jiangliang on 2020/6/23.
//  Copyright © 2020 wangjiangliang. All rights reserved.
//

#import "TouchViewA1.h"

@implementation TouchViewA1

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"click TouchViewA1");
}


// // 改变图片的点击范围
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    /*
     return YES;
     则无论点击父视图哪里，响应的该视图
     */


    /*
     CGRectInset
     CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)是以rect为中心，根据dx和dy来实现缩小。
     */
    CGRect bounds = CGRectInset(self.bounds, 0, 0);
    if (CGRectContainsPoint(bounds, point)){
           //如果在path区域内，返回YES
           return YES;
    }
    return NO;

}


@end
