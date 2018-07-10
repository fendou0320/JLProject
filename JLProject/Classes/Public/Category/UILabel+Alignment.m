//
//  UILabel+Alignment.m
//  UcsProject
//
//  Created by UCS on 2018/6/2.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "UILabel+Alignment.h"
#import<CoreText/CoreText.h>

@implementation UILabel (Alignment)

- (void)textAlignmentLeftAndRight{
    [self  textAlignmentLeftAndRightWith:CGRectGetWidth(self.frame)];
}

- (void)textAlignmentLeftAndRightWith:(CGFloat)labelWidth{
    if (self.text.length<1) {
        return;
    }
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(labelWidth,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName :self.font}  context:nil].size;
    CGFloat margin = (labelWidth - size.width)/(self.text.length - 1);
    NSNumber *number = [NSNumber numberWithFloat:margin];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString  alloc] initWithString:self.text];
    [attribute addAttribute:NSKernAttributeName value:number range:NSMakeRange(0,self.text.length -1 )];
    self.attributedText = attribute;
}

//设置冒号文字距离相等
- (void)textAlignmentLeftWidth: (CGFloat)leftWidth leftStr: (NSString *)leftStr rightWidth: (CGFloat)rightWidth rightStr: (NSString *)rightStr{
    if (leftStr.length<1) {
        return;
    }
    CGSize leftSize = [self.text boundingRectWithSize:CGSizeMake(leftWidth,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName :self.font}  context:nil].size;
    CGFloat leftmargin = (leftWidth-leftSize.width)/(leftStr.length - 1);
    NSNumber *leftNumber = [NSNumber numberWithFloat:leftmargin];
    NSString *allStr = [NSString stringWithFormat:@"%@%@", leftStr, rightStr];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:allStr];
    [attribute addAttribute:NSKernAttributeName value:leftNumber range:NSMakeRange(0,(leftStr.length) -1 )];
    self.attributedText = attribute;
}





@end
