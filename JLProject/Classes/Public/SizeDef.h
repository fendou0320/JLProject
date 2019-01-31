//
//  SizeDef.h
//  JLVideoPlayer
//  存放尺寸的宏定义
//  Created by 王江亮 on 16/10/18.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#ifndef SizeDef_h
#define SizeDef_h

//获取当前屏幕尺寸
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
//当给出一个iphone6屏幕上的尺寸时，按照当前屏幕的大小换算出实际的值
#define SIZE_IPHONE6(_size) (kScreenWidth / 375.0 * (_size))
//px的数值传入
#define SIZE_IPHONE6PX(_size) (kScreenWidth / 375.0 * ((_size)/2))
#define SIZE_IPHONE6HeightPX(_size) (kScreenHeight / 667.0 * ((_size)/2))

//下导航高度
#define kTabBarHeight 49.0
//上导航高度
#define kNavgationBarHeight 64.0
//动态加载图的宽度
#define kLoadingGifWidth 50.0
//动态加载图的高度
#define kLoadingGifHeight 50

#define k_TableCellHeight 50

//登录录入框高度
#define kLoginAccountHeight 42.0f
//导航栏按钮距离左右侧宽度
#define kleftBtnHeight 10.0f
//导航栏按钮宽度
#define kNavBtnWidth 23.0f

//封装弹窗按钮高度
#define kUtilyBtnHeight 45.0f

//文字高度
#define kWriting_Height_SIZAONG 14.0f
#define kWriting_Height_SIZATWO 11.0f
#define kWriting_Height_SIZATHREE 13.0f

//拍片-今天-宽度
#define kPaipianTodaywidth 152/2
#define kPaipianTodayheight 75/2

//细线宽度
#define kCommenLineWidth 1.0f
#define kCommenLineHeight 1.0f

#define kZHEXIANTUWIDTH 344/2
#define kSANDIANTUHeight 416/2


// font
#define JRRelateFont(font)      kRelateFont(font)
#define JRFont8                 JRRelateFont(8)
#define JRFont10                JRRelateFont(10)
#define JRFont11                JRRelateFont(11)
#define JRFont12                JRRelateFont(12)
#define JRFont13                JRRelateFont(13)
#define JRFont14                JRRelateFont(14)
#define JRFont15                JRRelateFont(15)
#define JRFont16                JRRelateFont(16)
#define JRFont17                JRRelateFont(17)
#define JRFont18                JRRelateFont(18)
#define JRFont20                JRRelateFont(20)
#define JRFont24                JRRelateFont(24)
#define JRFont36                JRRelateFont(36)

// bold font
#define JRRelateBoldFont(font)  kRelateBoldFont(font)
#define JRBoldFont8             JRRelateBoldFont(8)
#define JRBoldFont10            JRRelateBoldFont(10)
#define JRBoldFont11            JRRelateBoldFont(11)
#define JRBoldFont12            JRRelateBoldFont(12)
#define JRBoldFont13            JRRelateBoldFont(13)
#define JRBoldFont14            JRRelateBoldFont(14)
#define JRBoldFont15            JRRelateBoldFont(15)
#define JRBoldFont16            JRRelateBoldFont(16)
#define JRBoldFont17            JRRelateBoldFont(17)
#define JRBoldFont18            JRRelateBoldFont(18)
#define JRBoldFont20            JRRelateBoldFont(20)
#define JRBoldFont24            JRRelateBoldFont(24)
#define JRBoldFont36            JRRelateBoldFont(36)

#define kRelateToIphone6(length)            ((length)*(kScreenWidth)/(375.0f))

#define kRelate(length)                     kRelateToIphone6(length)

#define kRelateFont(font)                   [UIFont systemFontOfSize:kRelateToIphone6(font)]

#define kRelateBoldFont(font)               [UIFont boldSystemFontOfSize:kRelateToIphone6(font)]

// length
#define JRRelate(length)        kRelateToIphone6(length)
#define JRMargin8                 JRRelate(8.f)
#define JRMargin10                JRRelate(10.f)
#define JRMargin12                JRRelate(12.f)
#define JRMargin15                JRRelate(15.f)
#define JRMargin20                JRRelate(20.f)


#endif /* SizeDef_h */
