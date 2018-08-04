//
//  RunTimeUseCaseVC.m
//  JLProject
//
//  Created by UCS on 2018/7/9.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "RunTimeUseCaseVC.h"
#import <objc/runtime.h>
#import <objc/message.h>

#import "NSURL+JLCatrgory.h"

@interface RunTimeUseCaseVC ()

@end

@implementation RunTimeUseCaseVC

//Hook


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RunTime--高级应用";
    
    //
    [self creatSubView];

    
}



- (void)creatSubView{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 150, kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btn];
    btn.backgroundColor = RandomColor;
    [btn setTitle:@"用runTime实现--检查系统NSURL是否为空" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btntwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btntwo.frame = CGRectMake(0, SIZE_IPHONE6(250), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btntwo];
    btntwo.backgroundColor = RandomColor;
    [btntwo setTitle:@"动态添加方法" forState:UIControlStateNormal];
    [btntwo addTarget:self action:@selector(btnTwo:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnthree = [UIButton buttonWithType:UIButtonTypeCustom];
    btnthree.frame = CGRectMake(0, SIZE_IPHONE6(350), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btnthree];
    btnthree.backgroundColor = RandomColor;
    [btnthree setTitle:@"demo展示" forState:UIControlStateNormal];
    [btnthree addTarget:self action:@selector(demoShow:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnOne: (UIButton *)sender{
    
    NSURL *url = [NSURL URLWithString:@"www.baidu.com"];
    //有中文字符则生成为空
    NSURL *urlError = [NSURL URLWithString:@"www.baidu.com/中文"];
    //判空可用catory，实例

//    NSURL *url = [NSURL JL_URLWithString:@"www.baidu.com"];
//    NSURL *urlError = [NSURL JL_URLWithString:@"www.baidu.com/中文"];
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSLog(@"%@, %@", url, urlError);
    
    
    
}



- (void)btnTwo: (UIButton *)sender{
    
    
    
}

- (void)demoShow: (UIButton *)sender{
    
    
}












@end
