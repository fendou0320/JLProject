//
//  UILabel+Alignment.h
//  UcsProject
//
//  Created by UCS on 2018/6/2.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Alignment)
//两端对齐
- (void)textAlignmentLeftAndRight;
//指定Label的width两端对齐
- (void)textAlignmentLeftAndRightWith:(CGFloat)labelWidth;

//设置冒号左侧距离
- (void)textAlignmentLeftWidth: (CGFloat)leftWidth leftStr: (NSString *)leftStr rightWidth: (CGFloat)rightWidth rightStr: (NSString *)rightStr;
@end
