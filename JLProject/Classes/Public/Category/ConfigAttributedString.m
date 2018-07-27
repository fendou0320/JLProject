//
//  ConfigAttributedString.m
//  MVMProject
//
//  Created by UCS on 2018/7/25.
//  Copyright © 2018年 MVMProject. All rights reserved.
//

#import "ConfigAttributedString.h"

@interface ConfigAttributedString ()

@property (nonatomic, strong) NSString *attribute;
@property (nonatomic, strong) id        value;
@property (nonatomic, assign) NSRange   range;

@end

@implementation ConfigAttributedString

+ (instancetype)attribute:(NSString *)attribute value:(id)value range:(NSRange)range
{
    ConfigAttributedString *config = [self new];
    
    config.attribute = attribute;
    config.value     = value;
    config.range     = range;
    
    return config;
}

+ (instancetype)font:(UIFont *)font range:(NSRange)range
{
    ConfigAttributedString *config = [self new];
    config.attribute = NSFontAttributeName;
    config.value     = font;
    config.range     = range;
    
    return config;
}

+ (instancetype)foregroundColor:(UIColor *)color range:(NSRange)range
{
    ConfigAttributedString *config = [self new];
    config.attribute = NSForegroundColorAttributeName;
    config.value     = color;
    config.range     = range;
    
    return config;
}

+ (instancetype)backgroundColor:(UIColor *)color range:(NSRange)range
{
    ConfigAttributedString *config = [self new];
    config.attribute = NSBackgroundColorAttributeName;
    config.value     = color;
    config.range     = range;
    
    return config;
}

+ (instancetype)strikethroughStyle:(NSInteger)number range:(NSRange)range
{
    ConfigAttributedString *config = [self new];
    config.attribute = NSStrikethroughStyleAttributeName;
    config.value     = [NSNumber numberWithInteger:number];
    config.range     = range;
    
    return config;
}

+ (instancetype)paragraphStyle:(NSMutableParagraphStyle *)style range:(NSRange)range
{
    ConfigAttributedString *config = [self new];
    config.attribute = NSParagraphStyleAttributeName;
    config.value     = style;
    config.range     = range;
    
    return config;
}

+ (instancetype)kern:(float)number range:(NSRange)range
{
    ConfigAttributedString *config = [self new];
    config.attribute = NSKernAttributeName;
    config.value     = [NSNumber numberWithFloat:number];
    config.range     = range;
    
    return config;
}

+ (instancetype)underlineStyle:(NSInteger)number range:(NSRange)range
{
    ConfigAttributedString *config = [self new];
    config.attribute = NSUnderlineStyleAttributeName;
    config.value     = [NSNumber numberWithInteger:number];
    config.range     = range;
    
    return config;
}

+ (instancetype)strokeColor:(UIColor *)color range:(NSRange)range
{
    ConfigAttributedString *config = [self new];
    config.attribute = NSStrokeColorAttributeName;
    config.value     = color;
    config.range     = range;
    
    return config;
}

+ (instancetype)strokeWidth:(float)number range:(NSRange)range
{
    ConfigAttributedString *config = [self new];
    config.attribute = NSStrokeWidthAttributeName;
    config.value     = [NSNumber numberWithFloat:number];
    config.range     = range;
    
    return config;
}

+ (instancetype)shadow:(NSShadow *)shadow range:(NSRange)range
{
    ConfigAttributedString *config = [self new];
    config.attribute = NSShadowAttributeName;
    config.value     = shadow;
    config.range     = range;
    
    return config;
}


////不缩进的段落样式
//+ (NSMutableParagraphStyle *)commonstyle
//{
//    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
//    //    style.lineSpacing              = 5.f;
//    style.firstLineHeadIndent      = 0.0f;
//    //    style.headIndent = 10.0f;
//    return style;
//}
//
////缩进的段落样式
//+ (NSMutableParagraphStyle *)indentationStyle
//{
//    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
//    //    style.lineSpacing              = 5.f;
//    style.firstLineHeadIndent      = 26.0f;
//    //段首行空白空间
//    //    style.paragraphSpacingBefore = 30.0f;
//    style.headIndent = 26.0f;
//    return style;
//}


@end
