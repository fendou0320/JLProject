//
//  TemplateListViewController.m
//  JLProject
//
//  Created by UCS on 2017/6/2.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "TemplateListViewController.h"
#import "TemplateListView.h"
#import "JLProgressLine.h"

@interface TemplateListViewController ()

@end

@implementation TemplateListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    TemplateListView *view = [TemplateListView templateListViewWithFrame:CGRectMake(0, 200, kScreenWidth, 400)];
    [self.view addSubview:view];
    
    
    //进度视图封装
    JLProgressLine *progressView = [JLProgressLine progressLineWithBackColor:@"#cccccc" didColor:@"#0096e0"];
    [self.view addSubview:progressView];
    [progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(20);
        make.left.equalTo(self.view.mas_left).with.offset(40);
        make.top.equalTo(self.view.mas_top).with.offset(100);
    }];
    progressView.layer.cornerRadius= 10;
    progressView.layer.masksToBounds = YES;
    progressView.progress = 0.5f;
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
