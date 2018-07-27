//
//  RichTextVC.m
//  JLProject
//
//  Created by UCS on 2018/7/27.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "RichTextVC.h"
#import "NSString+Extern.h"

@interface RichTextVC ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation RichTextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"富文本";
    
//    NSString *contentStr = @"1、游戏基本信息内容\n2、游戏相关资质信息内容\n如：软件著作权证书、运营登记证书\n3、相关媒资信息文件\n如：游戏宣传片、游戏宣传海报、游戏主题曲等\n4、游戏文件数据包\n如果是网页游戏，请上传游戏开发包如果是平台游戏，请上传游戏数据包如果是端游，请上传游戏文件";//
    NSString *firstString = @"1、游戏基本信息内容";
    NSString *secondString = @"2、游戏相关资质信息内容";
    NSString *secondContentString = @"如：软件著作权证书、运营登记证书";
    NSString *threeString = @"3、相关媒资信息文件";
    NSString *threeContentStr = @"如：游戏宣传片、游戏宣传海报、游戏主题曲等";
    NSString *fourString = @"4、游戏文件数据包";
    NSString *fourContentStr = @"如果是网页游戏，请上传游戏开发包;\n如果是平台游戏，请上传游戏数据包;\n如果是端游，请上传游戏文件;";

    NSString *contentString = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n%@\n", firstString, secondString, secondContentString, threeString, threeContentStr, fourString, fourContentStr];
    
    NSRange firstStringRange = [contentString rangeOfString:firstString];
    NSRange secondStringRange = [contentString rangeOfString:secondString];
    NSRange secondContentStrRange = [contentString rangeOfString:secondContentString];
    NSRange threeStringRange = [contentString rangeOfString:threeString];
    NSRange threeContentStrRange = [contentString rangeOfString:threeContentStr];
    NSRange fourStringRange = [contentString rangeOfString:fourString];
    NSRange fourContentStrRange = [contentString rangeOfString:fourContentStr];
    
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, kScreenWidth-20, 500)];
    [self.view addSubview:_titleLabel];
//    _titleLabel.backgroundColor = RandomColor;
    _titleLabel.textColor = COLOR_333333;
    _titleLabel.numberOfLines = 0;
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    
    UIFont *bigFont = [UIFont systemFontWithSize:15];
    UIFont *smallFont = [UIFont systemFontWithSize:12];
    
    NSArray *array = @[[ConfigAttributedString font:bigFont range:[contentString range]],
                       
                       [ConfigAttributedString foregroundColor:COLOR_333333 range:firstStringRange],
                       [ConfigAttributedString font:bigFont range:firstStringRange],
                       [ConfigAttributedString paragraphStyle:[self commonStyle] range:firstStringRange],

                       [ConfigAttributedString foregroundColor:COLOR_333333 range:secondStringRange],
                       [ConfigAttributedString font:bigFont range:secondStringRange],
                       [ConfigAttributedString paragraphStyle:[self commonStyle] range:secondStringRange],
                       
                       [ConfigAttributedString foregroundColor:COLOR_999999 range:secondContentStrRange],
                       [ConfigAttributedString font:smallFont range:secondContentStrRange],
                       [ConfigAttributedString paragraphStyle:[self indentationStyle] range:secondContentStrRange],
                       
                       [ConfigAttributedString foregroundColor:COLOR_333333 range:threeStringRange],
                       [ConfigAttributedString font:bigFont range:threeStringRange],
                       [ConfigAttributedString paragraphStyle:[self commonStyle] range:threeStringRange],
                       
                       [ConfigAttributedString foregroundColor:COLOR_999999 range:threeContentStrRange],
                       [ConfigAttributedString font:smallFont range:threeContentStrRange],
                       [ConfigAttributedString paragraphStyle:[self indentationStyle] range:threeContentStrRange],

                       [ConfigAttributedString foregroundColor:COLOR_333333 range:fourStringRange],
                       [ConfigAttributedString font:bigFont range:fourStringRange],
                       [ConfigAttributedString paragraphStyle:[self commonStyle] range:fourStringRange],
                       
                       [ConfigAttributedString foregroundColor:COLOR_999999 range:fourContentStrRange],
                       [ConfigAttributedString font:smallFont range:fourContentStrRange],
                       [ConfigAttributedString paragraphStyle:[self indentationStyle] range:fourContentStrRange],
                       ];
    
    
    NSMutableAttributedString *newAttributedString = [contentString createAttributedStringAndConfig:array];
    
    _titleLabel.attributedText = newAttributedString;
    
    
    
}

//不缩进段落样式
- (NSMutableParagraphStyle *)commonStyle
{
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing              = 5.f;
    style.firstLineHeadIndent      = 0.0f;
    return style;
}

//缩进段落样式
- (NSMutableParagraphStyle *)indentationStyle
{
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing              = 5.f;
    style.firstLineHeadIndent      = 26.0f;
    style.headIndent = 26.0f;
    return style;
}



//    NSMutableAttributedString *newAttributedString = [[NSMutableAttributedString alloc] initWithString:thirdTypeStr attributes:array];;//[thirdTypeStr createAttributedStringAndConfig:array];

//    NSMutableAttributedString *newAttributedString = [[NSMutableAttributedString alloc] initWithString:thirdTypeStr];
//
//    [newAttributedString addAttribute:NSParagraphStyleAttributeName
//                                value:[self commonStyle]
//                                range:firstStringRange];
//
//    [newAttributedString addAttribute:NSParagraphStyleAttributeName
//                                value:[self commonStyle]
//                                range:secondStringRange];
//
//    [newAttributedString addAttribute:NSParagraphStyleAttributeName
//                                value:[self indentationStyle]
//                                range:secondContentStrRange];

//    //段落样式一
//    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
//    //行间距
//    paragraph.lineSpacing = 3;
//    //段落间距
//    paragraph.paragraphSpacing = 5;
//    //对齐方式
//    paragraph.alignment = NSTextAlignmentLeft;
//    //指定段落开始的缩进像素
//    paragraph.firstLineHeadIndent = 5;
//    //调整全部文字的缩进像素
//    paragraph.headIndent = 5;

//    [newAttributedString addAttribute:NSParagraphStyleAttributeName
//                                value:paragraph
//                                range:[thirdTypeStr range]];
//
//    //段落样式二
//    NSMutableParagraphStyle *paragraphTwo = [[NSMutableParagraphStyle alloc] init];
//    //行间距
//    paragraphTwo.lineSpacing = 3;
//    //段落间距
//    paragraphTwo.paragraphSpacing = 5;
//    //对齐方式
//    paragraphTwo.alignment = NSTextAlignmentLeft;
//    //指定段落开始的缩进像素
//    paragraphTwo.firstLineHeadIndent = 20;
//    //调整全部文字的缩进像素
//    paragraphTwo.headIndent = 20;
//
//    [newAttributedString addAttribute:NSParagraphStyleAttributeName
//                                value:paragraphTwo
//                                range:[fourStr range]];


@end
