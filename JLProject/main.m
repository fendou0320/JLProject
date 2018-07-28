//
//  main.m
//  JLProject
//
//  Created by UCS on 2017/6/2.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
//        NSString * (^myBlcok)(int, NSString *) = ^NSString *(int a, NSString *b){
//            return [NSString stringWithFormat:@"传入的参数分别为：%d,%@", a , b];
//        };
//        NSLog(@"%@", myBlcok(100, @"200"));
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
