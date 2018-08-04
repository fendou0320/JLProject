//
//  MethodSwizzlingSonVC.m
//  JLProject
//
//  Created by UCS on 2018/7/11.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MethodSwizzlingSonVC.h"

@interface MethodSwizzlingSonVC ()

@end

@implementation MethodSwizzlingSonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DLog(@"原来的viewDidLoad方法");
}

- (void)swizzViewDidLoad{
    [super viewDidLoad];
    DLog(@"替换后的swizzViewDidLoad方法");
}

+ (void)load{
    DLog(@"本类中的load方法");
}


@end
