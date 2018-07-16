//
//  TemplateOneViewController.m
//  Dashed
//
//  Created by UCS on 2017/6/2.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "TemplateOneViewController.h"

#import "TemplateOneView.h"

#import "FormWithSixListView.h"

@interface TemplateOneViewController ()

@end

@implementation TemplateOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    FormWithSixListView *view = [FormWithSixListView formWithSixListViewWithFrame:CGRectMake(0, 150, kScreenWidth, 50) formWithSixListViewType:FormWithSixListViewTypeTitle formWithSixListViewColorType:FormWithSixListViewColorTypeOne];
    [self.view addSubview:view];
    FormWithSixListView *view1 = [FormWithSixListView formWithSixListViewWithFrame:CGRectMake(0, 200, kScreenWidth, 50) formWithSixListViewType:FormWithSixListViewTypeTitle formWithSixListViewColorType:FormWithSixListViewColorTypeTwo];
    [self.view addSubview:view1];
    
    FormWithSixListView *view2 = [FormWithSixListView formWithSixListViewWithFrame:CGRectMake(0, 250, kScreenWidth, 50) formWithSixListViewType:FormWithSixListViewTypeContent formWithSixListViewColorType:FormWithSixListViewColorTypeOne];
    [self.view addSubview:view2];
    FormWithSixListView *view3 = [FormWithSixListView formWithSixListViewWithFrame:CGRectMake(0, 300, kScreenWidth, 50) formWithSixListViewType:FormWithSixListViewTypeContent formWithSixListViewColorType:FormWithSixListViewColorTypeTwo];
    [self.view addSubview:view3];
    
    TemplateOneView *view9 = [TemplateOneView templateOneViewWithFrame:CGRectMake(0, 550, kScreenWidth, 50) TemplateOnetype:TemplateOneViewTypeTypeThree templateOneViewColorType:TemplateOneViewColorTypeTwo];
    [self.view addSubview:view9];
//
//    TemplateOneView *view2 = [TemplateOneView templateOneViewWithFrame:CGRectMake(0, 200, kScreenWidth, 50) TemplateOnetype:TemplateOneViewTypeTypeThree templateOneViewColorType:TemplateOneViewColorTypeOne];
//    [self.view addSubview:view2];
//    
//    TemplateOneView *view3 = [TemplateOneView templateOneViewWithFrame:CGRectMake(0, 250, kScreenWidth, 50) TemplateOnetype:TemplateOneViewTypeTypeTwo templateOneViewColorType:TemplateOneViewColorTypeTwo];
//    [self.view addSubview:view3];
//    
//    TemplateOneView *view4 = [TemplateOneView templateOneViewWithFrame:CGRectMake(0, 300, kScreenWidth, 50) TemplateOnetype:TemplateOneViewTypeTypeTwo templateOneViewColorType:TemplateOneViewColorTypeOne];
//    [self.view addSubview:view4];
//    
//    TemplateOneView *view5 = [TemplateOneView templateOneViewWithFrame:CGRectMake(0, 350, kScreenWidth, 50) TemplateOnetype:TemplateOneViewTypeTypeFive templateOneViewColorType:TemplateOneViewColorTypeTwo];
//    [self.view addSubview:view5];
//    
//    TemplateOneView *view6 = [TemplateOneView templateOneViewWithFrame:CGRectMake(0, 400, kScreenWidth, 50) TemplateOnetype:TemplateOneViewTypeTypeFive templateOneViewColorType:TemplateOneViewColorTypeOne];
//    [self.view addSubview:view6];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








@end
