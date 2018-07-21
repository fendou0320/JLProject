//
//  FourFounctionVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/13.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "FourFounctionVC.h"
#import "GPUImageVC.h"
#import "AsdkVC.h"

@interface FourFounctionVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation FourFounctionVC

- (void)viewDidLoad {
    [super viewDidLoad];
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
        cell.textLabel.text = @"GPUImage";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"Texture-asyncdisplaykit";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"";
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0){
        
        GPUImageVC *vc = [[GPUImageVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 1){
       
        AsdkVC *vc = [[AsdkVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 2){
        
      
    }else if (indexPath.row == 3){
        
        
    }else if (indexPath.row == 4){
        
        
        
    }
}

@end
