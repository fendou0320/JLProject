//
//  IndexLineChatTypeOneController.m
//  JLProject
//
//  Created by UCS on 2017/6/19.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "IndexLineChatTypeOneController.h"
#import "IndexLineChatTypeOne.h"
@interface IndexLineChatTypeOneController ()

@end

@implementation IndexLineChatTypeOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    IndexLineChatTypeOne *chat = [[IndexLineChatTypeOne alloc] initWithFrame:CGRectMake(0, 0, self.view.width, SIZE_IPHONE6PX(450))];
    //    self.chat = chat;
    [self.view addSubview:chat];
    chat.contentInsets = UIEdgeInsetsMake(SIZE_IPHONE6PX(44), SIZE_IPHONE6PX(83), SIZE_IPHONE6PX(72), SIZE_IPHONE6PX(46));
    chat.xAndYLineColor = COLOR_Writing;
    chat.xAndYNumberColor = COLOR_CHATLINE_ZUOBIAO;
    chat.leveLineColor = COLOR_LINECHAT_XUXIAN;
    chat.yDescTextFontSize = SIZE_FONT_IPHONE6(18/2);
    chat.xDescTextFontSize = SIZE_FONT_IPHONE6(18/2);
    
    chat.firstXRangeStart = SIZE_IPHONE6PX(20);
    chat.lastXRangeEnd = SIZE_IPHONE6PX(20);
    chat.lastYRangeEnd = SIZE_IPHONE6PX(20);
    
    chat.showYLevelLine = YES;
    chat.xBiaoZhu = @"时间";
    chat.yBiaoZhu = @"票房（人次）";
    NSMutableArray *color = [NSMutableArray arrayWithCapacity:3];
    [color addObject:[UIColor redColor]];
    [color addObject:[UIColor greenColor]];
    [color addObject:[UIColor purpleColor]];
    chat.positionLineColorArr = color;
    NSMutableArray *yArray = [[NSMutableArray alloc] initWithObjects:@"5万",@"10万",@"15万",@"20万",@"20万",nil];
    NSMutableArray *daysTitlesArr = [[NSMutableArray alloc] initWithObjects:@"6/12",@"6/13",@"6/14",@"6/15",@"6/17",@"6/18",@"6/19",nil];
    NSMutableArray *date = [NSMutableArray arrayWithCapacity:3];
    NSMutableArray *dataArray1 = [[NSMutableArray alloc] initWithObjects:@"21",@"6",@"7",@"15",@"18",@"2",@"22",nil];
    NSMutableArray *dataArray2 = [[NSMutableArray alloc] initWithObjects:@"1",@"16",@"17",@"5",@"8",@"12",@"2",nil];
    NSMutableArray *dataArray3 = [[NSMutableArray alloc] initWithObjects:@"2",@"7",@"7",@"1",@"19",@"2",@"23",nil];
    [date addObject:dataArray1];
    [date addObject:dataArray2];
    [date addObject:dataArray3];
    
    [chat reloadXdata:daysTitlesArr ydata:yArray positionData:date];

    
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
