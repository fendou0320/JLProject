//
//  CustomPopUpView.h
//  JLProject
//
//  Created by jiangliang on 2018/9/11.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPopUpView : UIView
//默认倒角   default = 5.0
@property (nonatomic,assign) CGFloat                        cornerRaius;
////设置偏移距离 default = 0（与触摸点在Y轴上的偏移）
@property (nonatomic,assign)  CGFloat                       offset;
// 从关联点创建
+ (instancetype)customPopUpViewWithWidth:(CGFloat)width titleString: (NSString *)titleString titleFont: (UIFont *)titleFont atPoint:(CGPoint)point;
// 从关联视图创建（可以是UIView和UIBarButtonItem）
+ (instancetype)customPopUpViewWithWidth:(CGFloat)width titleString: (NSString *)titleString titleFont: (UIFont *)titleFont relyonView:(id)view;
- (void)show;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end

