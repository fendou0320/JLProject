//
//  UIEncapsulationVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/15.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "UIEncapsulationVC.h"
#import "MvvmIndexController.h"
#import "MVVMTwoController.h"
#import "LoginViewController.h"
#import "LunBoNewController.h"
#import "StarController.h"
#import "SuiJiYanZhengMaController.h"
#import "DropDownController.h"

@interface UIEncapsulationVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation UIEncapsulationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;
    
    //MARK    method for handing memry managemrnt（方法）
    //TODO    通知更新需要做的事情
    //FIXME   你想要修改的bug
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    //    cell.backgroundColor = RandomColor1;
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"启动引导页";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"MVVM页面1";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"MVVM页面2--首页";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"登录页面";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"MVVM页面3--新式轮播图";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"星星";
    }else if (indexPath.row == 6){
        cell.textLabel.text = @"随机验证码";
    }else if (indexPath.row == 7){
        cell.textLabel.text = @"下拉框";
    }else if (indexPath.row == 8){
        cell.textLabel.text = @"启动页引导图";
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
        cell.textLabel.text = @"";
    }else if (indexPath.row == 20){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 21){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 22){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 23){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 24){
        cell.textLabel.text = @"";
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0){
        
      
    }else if (indexPath.row == 1){
        
        MvvmIndexController *jd = [[MvvmIndexController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 2){
        
        MVVMTwoController *jd = [[MVVMTwoController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 3){
        
        LoginViewController *jd = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 4){
        
        LunBoNewController *jd = [[LunBoNewController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 5){
        
        StarController *jd = [[StarController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 6){
        
        SuiJiYanZhengMaController *jd = [[SuiJiYanZhengMaController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 7){
        
        DropDownController *jd = [[DropDownController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 8){
        
        
    }else if (indexPath.row == 9){
        
        
    }else if (indexPath.row == 10){
        
        
    }
    
}


@end
