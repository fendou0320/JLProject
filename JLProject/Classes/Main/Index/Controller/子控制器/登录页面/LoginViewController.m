//
//  LoginViewController.m
//  UcsProject
//
//  Created by ucsdigital on 17/5/9.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "LoginViewController.h"
//#import "LoginLogoView.h"
//#import "ForgetPassWordController.h"
//#import "MainViewController.h"

@interface LoginViewController ()

@end

LoginViewController *loginViewCtr;

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatLoginView];
}

//创建登录页面视图
- (void)creatLoginView
{
    //用户名
    self.userName = [[UITextField alloc]init];
//    self.userName.backgroundColor = [UIColor redColor];
    self.userName.placeholder = @"请输入用户名";
    [self.view addSubview:self.userName];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(SIZE_IPHONE6PX(400));
        make.left.equalTo(self.view.mas_left).with.offset(SIZE_IPHONE6PX(100));
        make.right.equalTo(self.view.mas_right).with.offset(SIZE_IPHONE6PX(-100));
        make.height.mas_equalTo(SIZE_IPHONE6PX(100));
    }];

    //提示文字
    self.tipLabel = [[UILabel alloc]init];
    [self.view addSubview:self.tipLabel];
//    self.tipLabel.text = @"请输入密码";
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userName.mas_bottom).with.offset(SIZE_IPHONE6PX(20));
        make.left.equalTo(self.view.mas_left).with.offset(SIZE_IPHONE6PX(100));
        make.right.equalTo(self.view.mas_right).with.offset(SIZE_IPHONE6PX(-100));
        make.height.mas_equalTo(SIZE_IPHONE6PX(40));
    }];
//    self.tipLabel.textColor = COLOR_LOGO_Red;
//    self.tipLabel.font = PRFont(11);
//    self.tipLabel.hidden = YES;
    
    //密码
    self.userPwd = [[UITextField alloc]init];
    self.userPwd.secureTextEntry = YES;
    self.userPwd.placeholder = @"请输入密码";
//    self.userPwd.backgroundColor = [UIColor redColor];
    [self.view addSubview:_userPwd];
    [self.userPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tipLabel.mas_bottom).with.offset(SIZE_IPHONE6PX(20));
        make.left.equalTo(self.view.mas_left).with.offset(SIZE_IPHONE6PX(100));
        make.right.equalTo(self.view.mas_right).with.offset(SIZE_IPHONE6PX(-100));
        make.height.mas_equalTo(SIZE_IPHONE6PX(100));
    }];
    
    //登录按钮
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userPwd.mas_bottom).with.offset(SIZE_IPHONE6PX(40));
        make.left.equalTo(self.view.mas_left).with.offset(SIZE_IPHONE6PX(100));
        make.right.equalTo(self.view.mas_right).with.offset(SIZE_IPHONE6PX(-100));
        make.height.mas_equalTo(SIZE_IPHONE6PX(80));
    }];
    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    _loginBtn.backgroundColor = [UIColor redColor];
    [_loginBtn setTitleColor:COLOR_LOGO_White forState:UIControlStateNormal];
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:18.0];
    _loginBtn.layer.cornerRadius = 15;
    _loginBtn.layer.masksToBounds = YES;
//    [_loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
}


+ (void)showInview:(UIView*)superView{
    
    loginViewCtr = [[LoginViewController alloc]init];
    [superView addSubview:loginViewCtr.view];
}


+ (void)disappearView{
    
    if (loginViewCtr != nil) {
        [loginViewCtr.view removeFromSuperview];
        loginViewCtr.view = nil;
        loginViewCtr = nil;
    }
}




@end
