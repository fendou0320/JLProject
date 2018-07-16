//
//  FZyuanhuanController.m
//  Dashed
//
//  Created by UCS on 2017/4/28.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "FZyuanhuanController.h"

//#import "JLRingChart.h"


@interface FZyuanhuanController ()

@end

@implementation FZyuanhuanController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    [self creatView];

}

- (void)creatView{
    
//    NSArray *_daysArr = @[@"8",@"6",@"5"];
//    NSArray *_daysTitlesArr = @[@"星期一",@"星期二",@"星期三"];
//    
//    JLRingChart *ring = [[JLRingChart alloc] initWithFrame:CGRectMake(0, 100, k_MainBoundsWidth, k_MainBoundsWidth)];
//    /*        background color         */
//    ring.backgroundColor = [UIColor whiteColor];
//    /*        Data source array, only the incoming value, the corresponding ratio will be automatically calculated         */
//    ring.valueDataArr = [_daysArr copy];
//    ring.valueDataTitlesArr = _daysTitlesArr;
//    /*         Width of ring graph        */
//    ring.ringWidth = 35.0;
//    /*        Fill color for each section of the ring diagram         */
//    ring.fillColorArray = @[[UIColor colorWithRed:1.000 green:0.783 blue:0.371 alpha:1.000], [UIColor colorWithRed:1.000 green:0.562 blue:0.968 alpha:1.000],[UIColor colorWithRed:0.313 green:1.000 blue:0.983 alpha:1.000],[UIColor colorWithRed:0.560 green:1.000 blue:0.276 alpha:1.000],[UIColor colorWithRed:0.239 green:0.651 blue:0.170 alpha:1.000],[UIColor colorWithRed:0.239 green:0.651 blue:0.170 alpha:1.000]];
//    /*        Start animation             */
//    [ring showAnimation];
//    [self.view addSubview:ring];
//    //    self.ringChart = ring;
    

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
