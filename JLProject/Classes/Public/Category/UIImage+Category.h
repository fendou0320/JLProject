//
//  UIImage+Category.h
//  JLProject
//
//  Created by UCS on 2018/8/3.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

/**
 *  根据颜色生成一张图片
 *  @param imageName 提供的颜色
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
