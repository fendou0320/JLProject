//
//  JLProgressLine.h
//  JLProject
//
//  Created by UCS on 2017/6/5.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLProgressLine : UIView

/**
 *  背景色
 */
@property (nonatomic,copy) NSString *backColor;
/**
 *  已经经过的进度的颜色
 */
@property (nonatomic,copy) NSString *didColor;
/**
 *  进度
 */
@property (nonatomic,assign) CGFloat progress;

/**
 *  工厂方法
 *
 *  @param bColor 背景颜色 (例如"#ffffff")
 *  @param dColor 已经经过的进度的颜色(例如"#000000")
 *
 *  @return 对象
 */
+(instancetype)progressLineWithBackColor:(NSString *)bColor didColor:(NSString *)dColor;

+(instancetype)progressLineWithFrame:(CGRect)frame;

@end
