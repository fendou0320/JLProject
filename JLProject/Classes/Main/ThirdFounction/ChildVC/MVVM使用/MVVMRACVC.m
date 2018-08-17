//
//  MVVMRACVC.m
//  JLProject
//
//  Created by UCS on 2018/8/17.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MVVMRACVC.h"

@interface MVVMRACVC ()

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
}



@end
