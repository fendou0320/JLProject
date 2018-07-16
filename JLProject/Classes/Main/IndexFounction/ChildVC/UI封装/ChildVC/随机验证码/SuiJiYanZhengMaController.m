//
//  SuiJiYanZhengMaController.m
//  JLProject
//
//  Created by UCS on 2017/11/17.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "SuiJiYanZhengMaController.h"

@interface SuiJiYanZhengMaController ()

@end

@implementation SuiJiYanZhengMaController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //获取验证码按钮
    AutoCodeView *captchaView = [[AutoCodeView alloc]init];;
    [self.view addSubview: captchaView];
    [captchaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_bottom).with.offset(SIZE_IPHONE6(20));
        make.left.equalTo(self.view.mas_right).with.offset(3);
        make.width.mas_equalTo(SIZE_IPHONE6(100));
        make.height.mas_equalTo(SIZE_IPHONE6(40));
    }];
    captchaView.layer.cornerRadius = 6.0;
    captchaView.layer.masksToBounds = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




@end
