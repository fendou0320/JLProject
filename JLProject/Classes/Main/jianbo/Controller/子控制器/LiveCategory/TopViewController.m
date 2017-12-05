//
//  TopViewController.m
//  JLProject
//
//  Created by UCS on 2017/6/6.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "TopViewController.h"

#import "TopView.h"

@interface TopViewController ()<TopViewDelegate>

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏非筛选部分
    CGRect frame = CGRectMake(0, 200, self.view.frame.size.width, 30);
    
    TopView *colunmnTopView = [TopView topViewWithFrame:frame delegate:self];
    [self.view addSubview:colunmnTopView];
    colunmnTopView.backgroundColor = [UIColor greenColor];
    
    colunmnTopView.modelArray = [[NSArray alloc]initWithObjects:@"One",@"Two",@"Three",@"Four",@"Five", nil];
    
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
