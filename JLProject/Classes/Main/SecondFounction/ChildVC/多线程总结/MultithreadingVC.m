//
//  MultithreadingVC.m
//  JLProject
//
//  Created by UCS on 2018/8/4.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MultithreadingVC.h"
#import "GcdDemoOneVC.h"
#import "GcdDemoTwoVC.h"
#import "GCDCaseInterviewVC.h"
#import "GCDGroupCaseVC.h"
#import "NSOperationBaseVC.h"

@interface MultithreadingVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MultithreadingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建一个分组样式的UITableView
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return k_TableCellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    //    cell.backgroundColor = RandomColor1;
    
    if (indexPath.row == 0){
        cell.textLabel.text = @"GCD串行并行--主队列全局队列";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"GCD各种函数";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"GCD面试题";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"GCD串并行组合";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"NSOperation总结";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 6){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 7){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 8){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 9){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 10){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 11){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 12){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 13){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 14){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 15){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 16){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 17){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 18){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 19){
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0){
        
        GcdDemoOneVC *jd = [[GcdDemoOneVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 1){
        
        GcdDemoTwoVC *jd = [[GcdDemoTwoVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 2){
        
        GCDCaseInterviewVC *jd = [[GCDCaseInterviewVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 3){
        
        GCDGroupCaseVC *jd = [[GCDGroupCaseVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 4){
        
        NSOperationBaseVC *jd = [[NSOperationBaseVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 5){
        
        
    }else if (indexPath.row == 6){
        
        
        
    }else if (indexPath.row == 7){
        
        
        
    }else if (indexPath.row == 8){
        
        
    }else if (indexPath.row == 9){
        
        
        
    }else if (indexPath.row == 10){
        
        
        
    }else if (indexPath.row == 11){
        
        
    }else if (indexPath.row == 12){
        
        
    }else if (indexPath.row == 13){
        
        
    }else if (indexPath.row == 14){
        
        
    }else if (indexPath.row == 15){
        
        
    }else if (indexPath.row == 16){
        
        
    }else if (indexPath.row == 17){
        
        
    }
    
}


@end
