//
//  YYLabelVC.m
//  JLProject
//
//  Created by UCS on 2018/8/1.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "YYLabelVC.h"


@interface YYLabelVC ()

@end

@implementation YYLabelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *title = @"不得不说 YYKit第三方框架确实很牛，YYLabel在富文本显示和操作方面相当强大，尤其是其异步渲染，让界面要多流畅有多流畅，这里我们介绍下简单的使用";
    //YYLabel 富文本
    YYLabel  *yyLabel = [YYLabel new];
    //异步渲染 当一个label显示巨量文字的时候就能明显感觉到此功能的强大
    yyLabel.displaysAsynchronously = YES;
    [self.view addSubview:yyLabel];
    yyLabel.numberOfLines = 0;
    
    YYTextContainer  *titleContarer = [YYTextContainer new];
    //限制宽度
    titleContarer.size = CGSizeMake(100,CGFLOAT_MAX);
    NSMutableAttributedString  *titleAttr = [self getAttr:title];
    YYTextLayout *titleLayout = [YYTextLayout layoutWithContainer:titleContarer text:titleAttr];
    CGFloat titleLabelHeight = titleLayout.textBoundingSize.height;
    yyLabel.frame = CGRectMake(50,100,100,titleLabelHeight);
    
 
}

- (NSMutableAttributedString*)getAttr:(NSString*)attributedString {
    NSMutableAttributedString * resultAttr = [[NSMutableAttributedString alloc] initWithString:attributedString];
    
    //对齐方式 这里是 两边对齐
    resultAttr.alignment = NSTextAlignmentJustified;
    //设置行间距
    resultAttr.lineSpacing = 5;
    //设置字体大小
    resultAttr.font = [UIFont systemFontOfSize:15];
    //可以设置某段字体的大小
    //[resultAttr yy_setFont:[UIFont boldSystemFontOfSize:CONTENT_FONT_SIZE] range:NSMakeRange(0, 3)];
    //设置字间距
    //resultAttr.yy_kern = [NSNumber numberWithFloat:1.0];
    return resultAttr;
}



@end
