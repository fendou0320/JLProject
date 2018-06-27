//
//  IndexViewController.m
//  UcsProject
//
//  Created by UCS on 2017/5/3.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "IndexViewController.h"
#import "TypeOneLabel.h"
#import "yuanshengriliViewController.h"
#import "MSSCalendarViewController.h"
#import "YinDaoDemoController.h"
#import "MvvmIndexController.h"
#import "MVVMTwoController.h"
#import "LoginViewController.h"
#import "LunBoNewController.h"
#import "StarController.h"
#import "SuiJiYanZhengMaController.h"
#import "DownLoaderController.h"
#import "DropDownController.h"
#import "CopyTypeVC.h"
#import "RunLoopVC.h"

@interface IndexViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;
    
    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    NSLog(@"唯一标示符%@", identifierForVendor);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
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
        cell.textLabel.text = @"原生日历";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"三方日历";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"启动引导页";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"MVVM页面1";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"MVVM页面2--首页";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"登录页面";
    }else if (indexPath.row == 6){
        cell.textLabel.text = @"MVVM页面3--新式轮播图";
    }else if (indexPath.row == 7){
        cell.textLabel.text = @"星星";
    }else if (indexPath.row == 8){
        cell.textLabel.text = @"RunLoop";
    }else if (indexPath.row == 9){
        cell.textLabel.text = @"随机验证码";
    }else if (indexPath.row == 10){
        cell.textLabel.text = @"下载";
    }else if (indexPath.row == 11){
        cell.textLabel.text = @"下拉框";
    }else if (indexPath.row == 12){
        cell.textLabel.text = @"启动页引导图";
    }else if (indexPath.row == 13){
        cell.textLabel.text = @"深浅拷贝";
    }

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        yuanshengriliViewController *jd = [[yuanshengriliViewController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 1){
        
        MSSCalendarViewController *jd = [[MSSCalendarViewController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 2){
    
        YinDaoDemoController *jd = [[YinDaoDemoController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];

    }else if (indexPath.row == 3){
        
        MvvmIndexController *jd = [[MvvmIndexController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 4){
        
        MVVMTwoController *jd = [[MVVMTwoController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 5){
        
        LoginViewController *jd = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 6){
        
        LunBoNewController *jd = [[LunBoNewController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 7){
        
        StarController *jd = [[StarController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 8){
        
        RunLoopVC *jd = [[RunLoopVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 9){
        
        SuiJiYanZhengMaController *jd = [[SuiJiYanZhengMaController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 10){
        
        DownLoaderController *jd = [[DownLoaderController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 11){
        
        DropDownController *jd = [[DropDownController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 12){
        
        YinDaoDemoController *jd = [[YinDaoDemoController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 13){
        
        CopyTypeVC *jd = [[CopyTypeVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
    }



    
    
    
    
    
}

    

@end
