//
//  NotYUANDIANViewController.m
//  JLProject
//
//  Created by UCS on 2017/6/9.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "NotYUANDIANViewController.h"
#import "JLLineChat.h"

#define SIZE_IPHONE6(_size) (kScreenWidth / 375.0 * _size)
#define SIZE_IPHONE6PX(_size) (kScreenWidth / 375.0 * (_size/2))

@interface NotYUANDIANViewController ()

@end

@implementation NotYUANDIANViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    JLLineChat *chat = [[JLLineChat alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, SIZE_IPHONE6(300/2))];
    [self.view addSubview:chat];
    
    chat.contentInsets = UIEdgeInsetsMake(20, 25, 20, 10);
    chat.xAndYLineColor = [UIColor redColor];
    chat.xAndYNumberColor = [UIColor greenColor];
    chat.yDescTextFontSize = 8.0f;
    chat.xDescTextFontSize = 8.0f;
    chat.firstXRangeStart = SIZE_IPHONE6PX(12);
    chat.lastXRangeEnd = SIZE_IPHONE6PX(20);
    chat.lastYRangeEnd = SIZE_IPHONE6PX(20);
    chat.xBiaoZhu = @"色值（白色x）";
    chat.yBiaoZhu = @"时间";
    chat.isHavePoint = YES;
    chat.showYLevelLine = YES;
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
    
    NSMutableArray *daysTitlesArr = [[NSMutableArray alloc] initWithObjects:@"6/12",@"6/13",@"6/14",@"6/15",@"6/17",@"6/18",@"6/19",nil];
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
