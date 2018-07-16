//
//  FZzhexianController.m
//  Dashed
//
//  Created by UCS on 2017/4/28.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "FZzhexianController.h"
#import "JHLineChart.h"

#define k_MainBoundsWidth [UIScreen mainScreen].bounds.size.width
#define k_MainBoundsHeight [UIScreen mainScreen].bounds.size.height
#define k_PointColor [UIColor colorWithRed:25 / 255.0 green:65 / 255.0 blue:86 / 255.0 alpha:1.0]

@interface FZzhexianController ()
@property(nonatomic,strong)NSArray* daysArr;
@property(nonatomic,strong)NSArray* daysTitlesArr;
@end

@implementation FZzhexianController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    [self drawLineChart];
}

-(void)drawLineChart
{
    UIView* chargeBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, k_MainBoundsWidth, 260)];
    chargeBgView.backgroundColor = [UIColor colorWithRed:100 / 255.0 green:100 / 255.0 blue:3 / 255.0 alpha:1.0];
//    chargeBgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:chargeBgView];
    /*     Create object        */
    JHLineChart *lineChart = [[JHLineChart alloc] initWithFrame:CGRectMake(0, 74, k_MainBoundsWidth, 250) andLineChartType:JHChartLineEveryValueForEveryX];
    
    lineChart.hasPoint = NO;
    lineChart.xLineDataArr = [self.daysTitlesArr copy];
    lineChart.contentInsets = UIEdgeInsetsMake(0, 25, 20, 10);
    
    lineChart.lineChartQuadrantType = JHLineChartQuadrantTypeFirstQuardrant;
    
    lineChart.valueArr = @[@[],self.daysArr,@[@"4",@"3",@"11",@"6",@"15",@"1",@"18"],@[@"19",@"5",@"1",@"6",@"5",@"16",@"8"]];
    lineChart.showYLevelLine = YES;
    lineChart.showYLine = YES;
    lineChart.showValueLeadingLine = NO;
    lineChart.showLevePoint = NO;
    lineChart.showAnimationDuration = 0.1;
    lineChart.valueFontSize = 9.0;
    
    lineChart.backgroundColor = [UIColor colorWithRed:3 / 255.0 green:3 / 255.0 blue:3 / 255.0 alpha:1.0];
    
    /* Line Chart colors */
    lineChart.valueLineColorArr =@[ k_PointColor, k_PointColor];
    /* Colors for every line chart*/
    lineChart.pointColorArr = @[[UIColor colorWithRed:71 / 255.0 green:184 / 255.0 blue:240 / 255.0 alpha:1.0],[UIColor colorWithRed:71 / 255.0 green:184 / 255.0 blue:240 / 255.0 alpha:1.0]];
    /* color for XY axis */
    lineChart.xAndYLineColor = [UIColor colorWithRed:71 / 255.0 green:184 / 255.0 blue:240 / 255.0 alpha:1.0];
    /* XY axis scale color */
    lineChart.xAndYNumberColor = [UIColor colorWithRed:71 / 255.0 green:184 / 255.0 blue:240 / 255.0 alpha:1.0];
    /* 设置每个点的字体颜色 */
    lineChart.pointNumberColorArr = @[[UIColor colorWithRed:71 / 255.0 green:184 / 255.0 blue:240 / 255.0 alpha:1.0],[UIColor colorWithRed:71 / 255.0 green:184 / 255.0 blue:240 / 255.0 alpha:1.0]];
    /* Dotted line color of the coordinate point  每个点 x y 轴直线 */
    lineChart.positionLineColorArr = @[[UIColor blueColor],[UIColor greenColor]];
    /*        Set whether to fill the content, the default is False         */
    lineChart.contentFill = YES;
    /*        Set whether the curve path         */
    lineChart.pathCurve = YES;
    /*        Set fill color array         */
    lineChart.contentFillColorArr = @[[UIColor colorWithRed:0 green:0.5 blue:0 alpha:0.6],[UIColor colorWithRed:25 / 255.0  green:65 / 255.0 blue:86 / 255.0 alpha:0.6]];
//    lineChart.contentFillColorArr = @[[UIColor blueColor],[UIColor orangeColor]];

    [self.view addSubview:lineChart];
//    self.lineChart = lineChart;
    /*       Start animation        */
    [lineChart showAnimation];
}

-(NSArray *)daysArr
{
    if (_daysArr == nil) {
        _daysArr = @[@"8",@"1",@"2",@"16",@"2",@"3",@"19"];
    }
    return _daysArr;
}

-(NSArray*)daysTitlesArr
{
    if (_daysTitlesArr == nil) {
        _daysTitlesArr = @[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期日"];
    }
    return _daysTitlesArr;
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
