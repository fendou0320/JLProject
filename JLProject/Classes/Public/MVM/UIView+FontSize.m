//
//  UIView+FontSize.m
//  MVMProject
//
//  Created by UCS-User on 2018/1/29.
//  Copyright © 2018年 MVMProject. All rights reserved.
//

#import "UIView+FontSize.h"
#import <objc/runtime.h>

#define IgnoreTagKey @"IgnoreTagKey"
#define FontScaleKey @"FontScaleKey"

#define ScrenScale [UIScreen mainScreen].bounds.size.width/375.0

#define SCREEN_WiDTH ([[UIScreen mainScreen] bounds].size.width)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_WiDTH == 320.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_WiDTH == 375.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_WiDTH == 414.0)

@implementation UIView (FontSize)

/**
 设置需要忽略的空间tag值
 
 @param tagArr tag值数组
 */
+ (void)setIgnoreTags:(NSArray<NSNumber*> *)tagArr{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:tagArr forKey:IgnoreTagKey];
    [defaults synchronize];
}

/**
 设置字体大小比例
 
 @param value 需要设置的比例
 */
+ (void)setFontScale:(CGFloat)value{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@(value) forKey:FontScaleKey];
    [defaults synchronize];
}

+ (NSArray *)getIgnoreTags{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *ignoreTagsArr = [defaults objectForKey:IgnoreTagKey];
    return ignoreTagsArr.count?ignoreTagsArr:0;
}

+ (CGFloat)getFontScale{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *valueNum = [defaults objectForKey:FontScaleKey];
    return valueNum?valueNum.floatValue:0;
}

+ (CGFloat)fontWithSize:(CGFloat)fontSize {
    if (IS_IPHONE_6P) {
        return fontSize + 2;
    }
    else if (IS_IPHONE_6) {
        return fontSize;
    }
    else {
        return fontSize-1;
    }
}
@end




@implementation UILabel (FontSize)

+ (void)load{
    if(!UILabelEnable) return;
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode {
    [self myInitWithCoder:aDecode];
    if (self) {
        NSArray *ignoreTags = [UIView getIgnoreTags];
        for (NSNumber *num in ignoreTags) {
            if(self.tag == num.integerValue) return self;
        }

        CGFloat fontSize = self.font.pointSize;
//        CGFloat scale = [UIView getFontScale];
        CGFloat fontScaleSize = [UIView fontWithSize:fontSize];
        self.font = [self.font fontWithSize:fontScaleSize];
    }
    return self;
}
@end


@implementation UIButton (FontSize)

+ (void)load {
    if(!UIButtonEnable) return;
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode {
    [self myInitWithCoder:aDecode];
    if (self) {
        NSArray *ignoreTags = [UIView getIgnoreTags];
        for (NSNumber *num in ignoreTags) {
            if(self.tag == num.integerValue) return self;
        }
        CGFloat fontSize = self.titleLabel.font.pointSize;
        CGFloat fontScaleSize = [UIView fontWithSize:fontSize];
        self.titleLabel.font = [self.titleLabel.font fontWithSize:fontScaleSize];
    }
    return self;
}

@end



@implementation UITextField (FontSize)

+ (void)load {
    if(!UITextFieldEnable) return;
    
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode {
    [self myInitWithCoder:aDecode];
    if (self) {
        NSArray *ignoreTags = [UIView getIgnoreTags];
        for (NSNumber *num in ignoreTags) {
            if(self.tag == num.integerValue) return self;
        }
        CGFloat fontSize = self.font.pointSize;
        CGFloat fontScaleSize = [UIView fontWithSize:fontSize];
        self.font = [self.font fontWithSize:fontScaleSize];
    }
    return self;
}

@end



@implementation UITextView (FontSize)

+ (void)load {
    if(!UITextViewEnable) return;
    
    //xib或storyBoard
    Method ibImp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myIbImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(ibImp, myIbImp);
    
    //initFrame
    //    Method cmp = class_getInstanceMethod([self class], @selector(initWithFrame:));
    //    Method myCmp = class_getInstanceMethod([self class], @selector(myInitWithFrame:));
    //    method_exchangeImplementations(cmp, myCmp);
}

//xib或storyBoard
- (id)myInitWithCoder:(NSCoder*)aDecode {
    [self myInitWithCoder:aDecode];
    if (self) {
        NSArray *ignoreTags = [UIView getIgnoreTags];
        for (NSNumber *num in ignoreTags) {
            if(self.tag == num.integerValue) return self;
        }
        CGFloat fontSize = self.font.pointSize;
        CGFloat fontScaleSize = [UIView fontWithSize:fontSize];
        self.font = [self.font fontWithSize:fontScaleSize];
    }
    return self;
}

//initFrame
//- (id)myInitWithFrame:(CGRect)frame{
//    [self myInitWithFrame:frame];
//    if(self){
//        //textView 此时的 self.font 还是 nil 所以无法修改
//        CGFloat fontSize = self.font.pointSize;
//        self.font = [self.font fontWithSize:fontSize*ScrenScale];
//    }
//    return self;
//}



@end
