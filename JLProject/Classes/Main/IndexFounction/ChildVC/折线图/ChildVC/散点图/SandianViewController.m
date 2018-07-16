//
//  SandianViewController.m
//  JLProject
//
//  Created by UCS on 2017/6/8.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "SandianViewController.h"
#import "SanDianView.h"

@interface SandianViewController ()

@end

@implementation SandianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    SanDianView *chat = [[SanDianView alloc] initWithFrame:CGRectMake(40, 100, 300, 400)];
    [self.view addSubview:chat];
    
    chat.contentInsets = UIEdgeInsetsMake(20, 25, 20, 10);
    chat.xAndYLineColor = [UIColor redColor];
    chat.xAndYNumberColor = [UIColor greenColor];
    chat.yDescTextFontSize = 8.0f;
    chat.xDescTextFontSize = 8.0f;
    chat.showYLevelLine = YES;
    chat.xBiaoZhu = @"色值（白色x）";
    chat.yBiaoZhu = @"时间";
    chat.lineColorArr = [[NSMutableArray alloc] initWithArray:@[[UIColor redColor],[UIColor greenColor],[UIColor blueColor],[UIColor purpleColor]]];
    
    NSMutableArray *daysArr = [[NSMutableArray alloc] initWithObjects:@"8",@"1",@"2",@"20",@"0",@"10",@"0",nil];
    NSMutableArray *daysArr1 = [[NSMutableArray alloc] initWithObjects:@"15",@"1",@"9",@"2",@"10",@"20",@"0",nil];
    NSMutableArray *daysArr2 = [[NSMutableArray alloc] initWithObjects:@"9",@"1",@"18",@"12",@"11",@"0",@"0",nil];
    NSMutableArray *daysArr3 = [[NSMutableArray alloc] initWithObjects:@"19",@"1",@"5",@"10",@"2",@"10",@"0",nil];
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:4];
    [arr addObject:daysArr];
    [arr addObject:daysArr1];
    [arr addObject:daysArr2];
    [arr addObject:daysArr3];
    
    NSMutableArray *daysTitlesArr = [[NSMutableArray alloc] initWithObjects:@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期日",nil];
    NSMutableArray *ydata = [[NSMutableArray alloc] initWithObjects:@"0",@"5",@"10",@"15",@"20",@"25",nil];
    
    [chat reloadXdata:daysTitlesArr ydata:ydata positionData:arr];    
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
