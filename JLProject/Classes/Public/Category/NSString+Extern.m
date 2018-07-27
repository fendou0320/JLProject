//
//  NSString+Extern.m
//  cbox
//
//  Created by 王江亮 on 16/7/6.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import "NSString+Extern.h"


#define PLACEFODERSTRING (NSString *)@"占位"

@implementation NSString (Extern)

- (CGFloat)stringWidthFont: (CGFloat)textFont{

    if(self == nil || [self length] == 0){
        return 0.0;
    }
    //设置字体大小
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:textFont]};
    CGFloat width = [self boundingRectWithSize:CGSizeMake(1000, textFont) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size.width;
    return width;
}


- (NSString *)stringReplaceSpace: (NSString *)str{

    NSString *newStr = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    return newStr;
}

- (CGSize)stringSizeWithFont:(UIFont *)font size:(CGSize)size{
    NSDictionary *dic = @{NSFontAttributeName:font};
    return  [self boundingRectWithSize:size
                               options:NSStringDrawingUsesLineFragmentOrigin
                            attributes:dic
                               context:nil].size;
}

- (BOOL)isSingleLineForLabel:(UILabel *)label{
    if ([self stringSizeWithFont:label.font size:CGSizeMake(label.frame.size.width, MAXFLOAT)].height > [PLACEFODERSTRING stringSizeWithFont:label.font size:CGSizeMake(label.frame.size.width, MAXFLOAT)].height) {
        return NO;
    }
    return YES;
}

- (NSString *)pinJieString: (NSString *)stringOne stringTwo:(NSString *)stringTwo;
{
    NSString *str = [NSString stringWithFormat:@"%@ %@", stringOne, stringTwo];
    return str;
}

- (NSMutableAttributedString *)createAttributedStringAndConfig:(NSArray *)configs
{
    NSMutableAttributedString *attributedString = \
    [[NSMutableAttributedString alloc] initWithString:self];
    
    [configs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ConfigAttributedString *oneConfig = obj;
        [attributedString addAttribute:oneConfig.attribute
                                 value:oneConfig.value
                                 range:oneConfig.range];
    }];
    
    return attributedString;
}

- (NSRange)rangeFrom:(NSString *)string
{
    return [string rangeOfString:self];
}

- (NSRange)range
{
    return NSMakeRange(0, self.length);
}


@end
