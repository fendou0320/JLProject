//
//  JRRefreshView.h
//  JLProject
//
//  Created by jiangliang on 2019/7/11.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JRRefreshView : UIView

@property (nonatomic, copy) void (^animiationComplete)(void);


- (void)refreshView;

/**
 下拉释放后网络请求时动画
 */
- (void)startAnimation;

/**
 根据百分比设置立方体对应的状态
 用于下拉过程中的动画
 
 @param percent 百分比[0-1]
 */
- (void)refreshWithPercent:(CGFloat)percent;

/**
 请求完网络后停止动画
 */
- (void)stopAnimation;

@end

NS_ASSUME_NONNULL_END
