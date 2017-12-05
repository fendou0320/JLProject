//
//  JDyuanhuanController.m
//  Dashed
//
//  Created by UCS on 2017/4/28.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "JDyuanhuanController.h"

#import "CircleView.h"


@interface JDyuanhuanController ()

@end

@implementation JDyuanhuanController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    [self myCreat];
}

- (void)myCreat{
    
    
    CircleView *view1 =[[CircleView alloc]initWithFrame:CGRectMake(50, 150, 250, 250)];
    //    //设置圆角
    //    view1.layer.cornerRadius = view1.frame.size.width / 2;
    //    //将多余的部分切掉
    //    view1.layer.masksToBounds = YES;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view1.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:view1.bounds.size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = view1.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    view1.layer.mask = maskLayer;
    [self.view addSubview:view1];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
