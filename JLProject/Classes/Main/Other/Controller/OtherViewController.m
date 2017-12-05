//
//  OtherViewController.m
//  UcsProject
//
//  Created by UCS on 2017/5/3.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "OtherViewController.h"
#import "DongHuaViewController.h"
#import "WKwebOneOneController.h"
#import "WKWebDemoController.h"
#import "ZhiHuiController.h"
#import "BoWenShuiQiuController.h"

@interface OtherViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end


@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    //创建一个分组样式的UITableView
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    self.automaticallyAdjustsScrollViewInsets = NO;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.row == 0){
        cell.textLabel.text = @"各种动画";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"智能监播首页地图WKwebview";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"WKwebview网络demo";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"智慧影管首页WKwebview";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"水波纹圆球";
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0){
        
        DongHuaViewController *donghua = [[DongHuaViewController alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 1){
       
        WKwebOneOneController *donghua = [[WKwebOneOneController alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 2){
       
        WKWebDemoController *donghua = [[WKWebDemoController alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];

    }else if (indexPath.row == 3){
        
        ZhiHuiController *donghua = [[ZhiHuiController alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 4){
        
        BoWenShuiQiuController *donghua = [[BoWenShuiQiuController alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }
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
