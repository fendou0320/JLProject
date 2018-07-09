//
//  BaseViewController.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/10/18.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = RandomColor;
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////点击返回按钮用
//-(void)delloc
//{
//    [self.manager invalidateSessionCancelingTasks:YES];
//}
//
//-(void)loadNew
//{
//    //结束之前的所有请求
//    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
//    //网络请求
//    //code...
//}





@end
