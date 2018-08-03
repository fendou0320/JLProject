//
//  BaseCommonUIVC.h
//  JLProject
//
//  Created by UCS on 2018/8/1.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseCommonUIVC : BaseViewController

@property (nonatomic, strong) UIButton *btnOne;
@property (nonatomic, strong) UIButton *btnTwo;
@property (nonatomic, strong) UIButton *btnThree;
@property (nonatomic, strong) UIButton *btnFour;

- (void)btnOne: (UIButton *)sender;

- (void)btnTwo: (UIButton *)sender;

- (void)btnThree: (UIButton *)sender;

- (void)btnFour: (UIButton *)sender;


@end
