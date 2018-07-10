//
//  UIFont+Fit.m
//  MVMProject
//
//  Created by UCS-User on 2018/1/26.
//  Copyright © 2018年 MVMProject. All rights reserved.
//

#import "UIFont+Fit.h"

#define SCREEN_WiDTH ([[UIScreen mainScreen] bounds].size.width)
#define ScrenScale SCREEN_WiDTH/375.0

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_WiDTH == 320.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_WiDTH == 375.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_WiDTH == 414.0)

@implementation UIFont (Fit)

+ (UIFont *)systemFontWithSize:(CGFloat)fontSize {
    if (IS_IPHONE_6P) {
        return [UIFont systemFontOfSize:fontSize + 2];
    }
    else if (IS_IPHONE_6) {
        return [UIFont systemFontOfSize:fontSize];
    }
    else {
        return [UIFont systemFontOfSize:fontSize - 1];
    }
}

+ (UIFont *)boldSystemFontWithSize:(CGFloat)fontSize {
    if (IS_IPHONE_6P) {
        return [UIFont boldSystemFontOfSize:fontSize + 2];
    }else if (IS_IPHONE_6) {
        return [UIFont boldSystemFontOfSize:fontSize];
    }else {
        return [UIFont boldSystemFontOfSize:fontSize - 1];
    }
}

+ (UIFont *)italicSystemFontWithSize:(CGFloat)fontSize {
    if (IS_IPHONE_6P) {
        return [UIFont italicSystemFontOfSize:fontSize + 2];
    }else if (IS_IPHONE_6) {
        return [UIFont italicSystemFontOfSize:fontSize];
    }else {
        return [UIFont italicSystemFontOfSize:fontSize - 1];
    }
}

+ (UIFont *)fontWithName:(NSString *)fontName Withsize:(CGFloat)fontSize {
    if (IS_IPHONE_6P) {
        return [UIFont fontWithName:fontName size:fontSize + 2];
    }else if (IS_IPHONE_6) {
        return [UIFont fontWithName:fontName size:fontSize];
    }else {
        return [UIFont fontWithName:fontName size:fontSize - 1];
    }
}

@end
