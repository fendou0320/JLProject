//
//  MVVMRACVC.m
//  JLProject
//
//  Created by UCS on 2018/8/17.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MVVMRACVC.h"
#import "MVVMRACOneVC.h"

@interface MVVMRACVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MVVMRACVC

/*
 iOS 中的 MVVM 可以分为以下三种不同的实践程度，它们分别对应不同的适用场景：
 
 MVVM + KVO ，适用于现有的 MVC 项目，想转换成 MVVM 但是不打算引入 RAC 作为 binder 的团队；

 MVVM + RAC ，适用于现有的 MVC 项目，想转换成 MVVM 并且打算引入 RAC 作为 binder 的团队；

 MVVM + RAC + ViewModel-Based Navigation ，适用于全新的项目，想实践 MVVM 并且打算引入 RAC 作为 binder ，然后也想实践 ViewModel-Based Navigation 的团队。
 */

/*
 ReactiveCocoa编程思想
 ReactiveCocoa结合了几种编程风格：
 
 函数式编程（Functional Programming）
 
 响应式编程（Reactive Programming）
 
 所以，你可能听说过ReactiveCocoa被描述为函数响应式编程（FRP）框架。
 */


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
        cell.textLabel.text = @"MVVMRACOneVC";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"";
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0){
        
        MVVMRACOneVC *donghua = [[MVVMRACOneVC alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 1){
        
       
    }
}


@end
