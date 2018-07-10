//
//  UIFont+Fit.h
//  MVMProject
//
//  Created by UCS-User on 2018/1/26.
//  Copyright © 2018年 MVMProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Fit)

+ (UIFont *)systemFontWithSize:(CGFloat)fontSize;
+ (UIFont *)boldSystemFontWithSize:(CGFloat)fontSize;
+ (UIFont *)italicSystemFontWithSize:(CGFloat)fontSize;
+ (UIFont *)fontWithName:(NSString *)fontName Withsize:(CGFloat)fontSize;

@end
