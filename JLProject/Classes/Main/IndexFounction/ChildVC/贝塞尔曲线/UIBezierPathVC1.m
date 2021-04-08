//
//  UIBezierPathVC1.m
//  JLProject
//
//  Created by jiangliang on 2020/4/13.
//  Copyright © 2020 wangjiangliang. All rights reserved.
//

#import "UIBezierPathVC1.h"

@interface UIBezierPathVC1 ()

@end

@implementation UIBezierPathVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *aView = [[UIView alloc] init];
    aView.backgroundColor = [UIColor redColor];
    aView.layer.backgroundColor = [UIColor yellowColor].CGColor;
    UIView *bView = [[UIView alloc] init];
    bView.backgroundColor = [UIColor greenColor];
    bView.layer.backgroundColor = [UIColor blueColor].CGColor;
    
    [self.view addSubview:aView];
    [aView addSubview:bView];
    
    aView.layer.anchorPoint = CGPointMake(0, 0);
    aView.frame = CGRectMake(100, 100, 100, 100);
    aView.transform = CGAffineTransformMakeScale(2, 2);
    bView.frame = CGRectMake(0, 0, 50, 50);

    
    
}



@end
