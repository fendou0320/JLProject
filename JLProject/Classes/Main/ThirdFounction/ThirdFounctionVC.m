//
//  ThirdFounctionVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/13.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "ThirdFounctionVC.h"

#import "DongHuaViewController.h"
#import "WKWebDemoController.h"
#import "BoWenShuiQiuController.h"
#import "AudioVideoVC.h"

@interface ThirdFounctionVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ThirdFounctionVC

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
        cell.textLabel.text = @"水波纹圆球";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"WKwebview";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"音视频编解码";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"组件化开发";
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0){
        
        DongHuaViewController *donghua = [[DongHuaViewController alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 1){
        
        BoWenShuiQiuController *donghua = [[BoWenShuiQiuController alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 2){
        
        WKWebDemoController *donghua = [[WKWebDemoController alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 3){
        
        AudioVideoVC *VC = [[AudioVideoVC alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
        
    }else if (indexPath.row == 4){
        
        
        
    }
}


@end