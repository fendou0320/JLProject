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


#endif /* SizeDef_h */
