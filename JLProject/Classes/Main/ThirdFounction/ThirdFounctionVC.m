//
//  ThirdFounctionVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/13.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "ThirdFounctionVC.h"
#import "AudioVideoVC.h"
#import "DrawGraphicsVC.h"
#import "GPUImageVC.h"
#import "AsdkVC.h"
#import "YYKitVC.h"

@interface ThirdFounctionVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ThirdFounctionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    //创建一个分组样式的UITableView
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
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
    
    return k_TableCellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.row == 0){
        cell.textLabel.text = @"图形绘制";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"GPUImage";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"Texture-asyncdisplaykit";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"音视频编解码";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"YYKitVC";
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0){
        
        DrawGraphicsVC *donghua = [[DrawGraphicsVC alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 1){
        
        GPUImageVC *vc = [[GPUImageVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 2){
        
        AsdkVC *vc = [[AsdkVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 3){
        
        AudioVideoVC *VC = [[AudioVideoVC alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
        
    }else if (indexPath.row == 4){
        
        YYKitVC *vc = [[YYKitVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}


@end
