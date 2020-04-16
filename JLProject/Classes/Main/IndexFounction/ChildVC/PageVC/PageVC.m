//
//  PageVC.m
//  JLProject
//
//  Created by jiangliang on 2020/2/19.
//  Copyright © 2020 wangjiangliang. All rights reserved.
//

#import "PageVC.h"

@interface PageVC ()

@end

@implementation PageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    //快手面试题一
    NSLog(@"");
    int i = 10;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"dispatch_async  --- %d", i);
    });
    i = 20;
    NSLog(@"main --- %d", i);
    
    //快手面试题二
    UIView *aView = [[UIView alloc] init];
    aView.backgroundColor = [UIColor redColor];
    UIView *bView = [[UIView alloc] init];
//    bView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:aView];
    [aView addSubview:bView];
    //anchorPoint是相对于自身layer，anchorPoint点(锚点)的值是用相对bounds的比例值来确定的，
    aView.layer.anchorPoint = CGPointMake(1, 1);
//    aView.layer.position =
    aView.frame = CGRectMake(100, 100, 100, 100);
//    aView.transform = CGAffineTransformMakeScale(2, 2);
//    bView.frame = CGRectMake(0, 0, 50, 50);
      
    
    
}

/*
 使用递归, 计算从1加到100的值
 */

- (int)getNumsWithNum: (int)num{
    
    return 0;
}

/*
 5. 使用递归, 计算从1加到100的值.
 6. 设计一个递归搜索指定类型文件的函数, 要求写清返回值, 函数
 名, 参数列表
 7. 合并两个个有序链表
 8. 递归实现阶乘, 大数阶乘的实现方案, 估算下64位操作系统阶乘 可计算的最大数值.
 */





@end
