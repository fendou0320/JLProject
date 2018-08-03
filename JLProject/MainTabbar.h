//
//  MainTabbar.h
//  JLProject
//
//  Created by UCS on 2018/8/3.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainTabbar;

@protocol MainTabbarDelegate <NSObject>
@optional
- (void)tabBarPlusBtnClick:(MainTabbar *)tabBar;
@end

@interface MainTabbar : UITabBar

@property (nonatomic, weak) id<MainTabbarDelegate> myDelegate;

@end
