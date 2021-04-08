//
//  TouchVC.m
//  JLProject
//
//  Created by jiangliang on 2020/6/23.
//  Copyright © 2020 wangjiangliang. All rights reserved.
//

#import "TouchVC.h"
#import "TouchViewA.h"
#import "TouchViewA1.h"
#import "TouchViewA2.h"

@interface TouchVC ()

@property (nonatomic, strong) TouchViewA *viewA;
@property (nonatomic, strong) TouchViewA1 *viewA1;
@property (nonatomic, strong) TouchViewA2 *viewA2;

@property (nonatomic, strong) UIView *viewB;
@property (nonatomic, strong) UIView *viewB1;

@end


@implementation TouchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     点击上面视图让下面视图响应
     
     // 此方法返回的View是本次点击事件需要的最佳View
     - (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event

     // 判断一个点是否落在范围内
     - (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
     
     事件传递给窗口或控件的后，就调用hitTest:withEvent:方法寻找更合适的view
     如果子控件是合适的view，则在子控件再调用hitTest:withEvent:查看子控件是不是合适的view，
     一直遍历，直到找到最合适的view，或者废弃事件。

     
     
     */
    
    
    self.viewA = [[TouchViewA alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:self.viewA];
    self.viewA.backgroundColor = [UIColor greenColor];
    
    self.viewA1 = [[TouchViewA1 alloc] initWithFrame:CGRectMake(50, 50, 150, 50)];
    [self.viewA addSubview:self.viewA1];
    self.viewA1.alpha = 0.5;
    self.viewA1.backgroundColor = [UIColor redColor];
    
    self.viewA2 = [[TouchViewA2 alloc] initWithFrame:CGRectMake(50, 70, 200, 50)];
    [self.viewA addSubview:self.viewA2];
    self.viewA2.backgroundColor = [UIColor purpleColor];
    self.viewA2.alpha = 0.5;

    self.viewB = [[UIView alloc] initWithFrame:CGRectMake(0, 400, 300, 200)];
    [self.view addSubview:self.viewB];
    self.viewB.backgroundColor = [UIColor yellowColor];
    
    self.viewB1 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    [self.viewB addSubview:self.viewB1];
    self.viewB1.backgroundColor = [UIColor grayColor];
       

}


@end
