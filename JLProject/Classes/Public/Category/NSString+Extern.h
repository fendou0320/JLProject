//
//  NSString+Extern.h
//  cbox
//
//  Created by 王江亮 on 16/7/6.
//  Copyright © 2016年 tjianli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extern)

/**
 *  获取文字长度
 *
 *  @param textFont 字体大小
 *
 *  @return 返回的就是CGFloat型长度
 */
- (CGFloat)stringWidthFont: (CGFloat)textFont;
- (NSString *)stringReplaceSpace: (NSString *)str;
/**
 计算显示区域

 @param font 字号
 @param size 最大宽高
 @return size
 */
- (CGSize)stringSizeWithFont:(UIFont *)font size:(CGSize)size;
/**
 字符串在Label中是否显示一行

 @param label label
 @return YES = 显示一行 / NO = 显示多行
 */
- (BOOL)isSingleLineForLabel:(UILabel *)label;

- (NSString *)pinJieString: (NSString *)stringOne stringTwo:(NSString *)stringTwo;



@end
