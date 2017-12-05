//
//  JDzhexianController.m
//  Dashed
//
//  Created by UCS on 2017/4/28.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "JDzhexianController.h"
#import "DashTypeOneView.h"

@interface JDzhexianController ()

@end

@implementation JDzhexianController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 300, 2)];
//    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    [DashTypeOneView drawDashLine:view lineLength:8 lineSpacing:3 lineColor:[UIColor redColor]];
    
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
