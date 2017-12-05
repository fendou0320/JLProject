//
//  ColorDef.h
//  JLVideoPlayer
//  存放颜色的宏定义
//  Created by 王江亮 on 16/10/18.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#ifndef ColorDef_h
#define ColorDef_h

#define RandomColor ([UIColor whiteColor])

#define RandomColor1 ([UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1])

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 设置RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//清除背景色
#define CLEARCOLOR [UIColor clearColor]
//
#define COLOR_All HEXToRGB(@"#eeeeee")
//监播界面背景颜色
#define COLOR_Cinema HEXToRGB(@"#333333")
//监播查看图片按钮背景颜色
#define COLOR_PicButton HEXToRGB(@"#aaaaaa")
//监播个数字体颜色
#define COLOR_numberColor HEXToRGB(@"#999999")
//监播差异按钮颜色
#define COLOR_diffButton HEXToRGB(@"#25ff68")



//登录背景红色
#define COLOR_LOGO_Red HEXToRGB(@"#961616")
//登录背景灰色
#define COLOR_LOGO_Gray HEXToRGB(@"#d97979")
//登录背景白色
#define COLOR_LOGO_White HEXToRGB(@"#ffffff")
//登录字体颜色
#define COLOR_Writing HEXToRGB(@"#666666")
//监播黑色背景
#define COLOR_BLACKCOLOR HEXToRGB(@"#2a2a2a")
//线条颜色
#define COLOR_LINE HEXToRGB(@"#d1d1d1")
//红色字体
#define COLOR_WRITING_Red HEXToRGB(@"#ed1a1a")
//黄色字体
#define COLOR_WRITING_YELLOW HEXToRGB(@"ff882a")
//绿色字体
#define COLOR_WRITING_GREEN HEXToRGB(@"#11d34d")
//浅黑色字体
#define COLOR_WRITING_QIANBLACK HEXToRGB(@"#999999")

//线条颜色
#define COLOR_LINE_SINZONE HEXToRGB(@"#bfbfbf")

//六种颜色
#define COLOR_GAOJING_RED HEXToRGB(@"#e12727")
#define COLOR_GAOJING_ORGNGE HEXToRGB(@"#ff882a")
#define COLOR_GAOJING_YELLOW HEXToRGB(@"#fdef3b")
#define COLOR_GAOJING_Blue [UIColor blueColor]
#define COLOR_GAOJING_Green [UIColor greenColor]
#define COLOR_GAOJING_PurpleColor [UIColor purpleColor]


#define COLOR_CHATLINE_ZUOBIAO HEXToRGB(@"#8b8b8b")
//虚线
#define COLOR_LINECHAT_XUXIAN HEXToRGB(@"#222222")

#define COLOR_CHAKAN_COLOR HEXToRGB(@"#dddddc")

#define COLOR_TITLE_RED HEXToRGB(@"#ed1b1b")

//退出登录按钮
#define COLOR_LoginOut HEXToRGB(@"#808080")

//深灰色
#define COLOR_darkGray HEXToRGB(@"#c9c9ce")


#define PRFont(F)  ([UIFont fontWithName:@"PingFangSC-Regular" size:F] ? : [UIFont systemFontOfSize:F])

#define PSFont(F) [UIFont fontWithName:@"PingFangSC-Semibold" size:F]

#define PMFont(F) [UIFont fontWithName:@"PingFangSC-Medium" size:F]

#define SHFont(F) [UIFont fontWithName:@"SourceHanSansCN-Regular" size:F]


#endif /* ColorDef_h */
