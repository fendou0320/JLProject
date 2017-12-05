//
//  MvvmIndexController.m
//  JLProject
//
//  Created by UCS on 2017/8/17.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "MvvmIndexController.h"
#import "BaseCollectionView.h"

@interface MvvmIndexController ()<BaseCollectionViewDelegete>

@end

@implementation MvvmIndexController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BaseCollectionView *view = [BaseCollectionView baseCollectionView:CGRectMake(0, 0, kScreenWidth, kScreenHeight) withDelegate:self];
    [self.view addSubview:view];
    
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
