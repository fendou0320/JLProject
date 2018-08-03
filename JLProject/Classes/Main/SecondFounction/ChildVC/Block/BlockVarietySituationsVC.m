//
//  BlockVarietySituationsVC.m
//  JLProject
//
//  Created by UCS on 2018/7/26.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "BlockVarietySituationsVC.h"
#import "BlockVC.h"
#import "BlockInterviewVC.h"
#import "RetainCycleOneVC.h"
#import "ProxyVC.h"

@interface BlockVarietySituationsVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BlockVarietySituationsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"block各种情景";
    
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
        cell.textLabel.text = @"Block分析";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"block面试题一";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"Block循环引用情景一";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"Proxy解循环引用";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"";
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
    }
        
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0){
        
        BlockVC *jd = [[BlockVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 1){
        
        BlockInterviewVC *jd = [[BlockInterviewVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 2){
        
        RetainCycleOneVC *jd = [[RetainCycleOneVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 3){
        
        ProxyVC *jd = [[ProxyVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 4){
        
    }else if (indexPath.row == 5){
        
    }else if (indexPath.row == 6){
        
    }else if (indexPath.row == 7){
        
    }else if (indexPath.row == 8){
        
    }else if (indexPath.row == 9){
        
    }else if (indexPath.row == 10){
        
    }
    
}



@end
