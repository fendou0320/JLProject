//
//  LoginViewModel.h
//  JLProject
//
//  Created by jiangliangwang on 2018/8/27.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginViewModel : NSObject

@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, strong) RACSignal *loginEnableSingal;
@property (nonatomic, strong) RACCommand *loginCommand;
@property (nonatomic, strong) RACSubject *statusSubject;
@property (nonatomic) BOOL logining;



@end
