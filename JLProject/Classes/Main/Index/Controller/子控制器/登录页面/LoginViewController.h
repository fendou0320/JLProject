//
//  LoginViewController.h
//  UcsProject
//
//  Created by ucsdigital on 17/5/9.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : BaseViewController<UITextFieldDelegate>

@property (nonatomic,strong) UILabel *tipLabel;//提示文字
@property (nonatomic,strong) UITextField *userName;//用户名
@property (nonatomic,strong) UITextField *userPwd;//密码
@property (nonatomic,strong) UIButton *loginBtn;//登录

+ (void)showInview:(UIView*)superView;

+ (void)disappearView;


@end
