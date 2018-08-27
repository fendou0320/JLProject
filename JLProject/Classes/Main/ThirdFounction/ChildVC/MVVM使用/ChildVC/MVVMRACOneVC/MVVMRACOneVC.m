//
//  MVVMRACOneVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/8/24.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MVVMRACOneVC.h"
#import "LoginViewModel.h"

@interface MVVMRACOneVC ()
@property (nonatomic, strong) UILabel *promptLabel;
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UITextField *accountField;
@property (nonatomic, strong) UITextField *passWordField;
@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic, strong) LoginViewModel *loginViewModel;

@end

@implementation MVVMRACOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
    //绑定 视图 和 viewModel
    [self bindViewModel];
    
}

- (void)setUpUI{
    
    self.headImage = [[UIImageView alloc] initWithFrame:CGRectMake(100, 50, 100, 100)];
    [self.view addSubview:self.headImage];
    self.headImage.backgroundColor = RandomColor;
    
    self.accountField = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, 200, 40)];
    self.accountField.backgroundColor = RandomColor;
    [self.view addSubview:self.accountField];
    
    self.passWordField = [[UITextField alloc] initWithFrame:CGRectMake(50, 250, 200, 40)];
    self.passWordField.backgroundColor = RandomColor;
    [self.view addSubview:self.passWordField];
    
    self.sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.sureBtn];
    self.sureBtn.backgroundColor = RandomColor;
    self.sureBtn.frame = CGRectMake(100, 300, 100, 40);
    [self.sureBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.sureBtn addTarget:self action:@selector(loginBtn) forControlEvents:UIControlEventTouchUpInside];
    
    self.promptLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 300, 200, 200)];
    self.promptLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.promptLabel];
    self.promptLabel.text = @"状态";
}

- (void)loginBtn{
    
    
}

- (void)bindViewModel
{
    @weakify(self)
    
    RAC(self.loginViewModel, account) = self.accountField.rac_textSignal;
    RAC(self.loginViewModel, password) = self.passWordField.rac_textSignal;
    RAC(self.sureBtn, enabled) = self.loginViewModel.loginEnableSingal;
    RAC(self.promptLabel, text) = self.loginViewModel.statusSubject;
    
    //头像信号的订阅
    [RACObserve(self.loginViewModel, iconUrl) subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        self.headImage.image = [UIImage imageNamed:x];
    } error:^(NSError * _Nullable error) {
    }];
    
//    //登录按钮能否使用
//    [self.loginViewModel.loginEnableSingal subscribeNext:^(id  _Nullable x) {
//        @strongify(self)
//        
//        UIColor *backgroundColor = (x.integerValue == 0)?[UIColor lightGrayColor]:[UIColor blueColor];
//        
//        self.sureBtn
//    }];
//    
//    self.headImage
    
}

    

    
    
    


@end
