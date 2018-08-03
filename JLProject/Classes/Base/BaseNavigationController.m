//
//  BaseNavigationController.m
//  JLVideoPlayer
//
//  Created by UCS on 2017/5/2.
//  Copyright © 2017年 WangJiangliang. All rights reserved.
//

#import "BaseNavigationController.h"
#import "MainViewController.h"

@interface BaseNavigationController ()<UINavigationControllerDelegate>

@end

@implementation BaseNavigationController

//+ (void)load
//{
//    UIBarButtonItem *item=[UIBarButtonItem appearanceWhenContainedIn:self, nil ];
//    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
//    dic[NSFontAttributeName]=[UIFont systemFontOfSize:15];
//    dic[NSForegroundColorAttributeName]=[UIColor blackColor];
//    [item setTitleTextAttributes:dic forState:UIControlStateNormal];
//    
//    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
//    
//    [bar setBackgroundImage:[UIImage imageWithColor:[UIColor blackColor]] forBarMetrics:UIBarMetricsDefault];
//    NSMutableDictionary *dicBar=[NSMutableDictionary dictionary];
//    
//    dicBar[NSFontAttributeName]=[UIFont systemFontOfSize:15];
//    [bar setTitleTextAttributes:dic];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.navigationBar.translucent = NO;
}

//二级页面tabbar消失
#pragma mark -UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSInteger count = self.viewControllers.count;
    MainViewController *mainTBC = (MainViewController *)self.tabBarController;
    if (count == 1) {
        mainTBC.tabBar.hidden = NO;
    }else if (count == 2) {
        mainTBC.tabBar.hidden = YES;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
    // 修改tabBra的frame
    CGRect frame = self.tabBarController.tabBar.frame;
    frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
    self.tabBarController.tabBar.frame = frame;
}






@end
