//
//  MethodSwizzlingSonVC+Swizzling.m
//  JLProject
//
//  Created by UCS on 2018/7/11.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MethodSwizzlingSonVC+Swizzling.h"

@implementation MethodSwizzlingSonVC (Swizzling)

+ (void)load{
    DLog(@"catory中的load方法");
}

@end
