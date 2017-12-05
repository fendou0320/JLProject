//
//  AppUtily.h
//  JLVideoPlayer
//
//  Created by UCS on 2017/5/2.
//  Copyright © 2017年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUtily : NSObject
@property (nonatomic,weak) UIViewController *viewCtrl;

/**
 获取版本号

 @return 版本号
 */
+ (NSString *)getProjectVersion;
/**
 判断是否第一次启动

 @return bool
 */
+ (BOOL)isFirstRun;
/**
 获取剩余磁盘空间
 
 @return 字节数
 */
+(uint64_t)getFreeDiskspace;

+ (NSInteger)howManyDaysInThisMonth:(NSInteger)year month:(NSInteger)imonth;

+ (NSString *)formatTime:(NSInteger)value;

#define HEXToRGB(string) [AppUtily hexToRGB:string]
+ (UIColor *)hexToRGB:(NSString *)hexColor;
//拨打电话
+ (void)showAlertViewPhoneWithTitle: (NSString *)title message:(NSString*)messageStr;
// 上下类型
+ (void)showAlertViewWithTitle: (NSString *)title message:(NSString*)messageStr;

+ (void)showAlertViewWithTitle: (NSString *)title message:(NSString*)messageStr viewCtrl: (UIViewController *)viewCtrl;

+ (UIViewController *)getCurrentVC;

///**
// 下载图片
//
// @param  imageurl
// */
//+ (void)downPictureWithUrl: (NSString *)imgUrl;

#define TIME_STAMP [AppUtily randomTimeStamp]
+(NSString*)randomTimeStamp;

+ (void)saveWithKey: (NSString *)keyStr valueStr: (NSString *)valueStr;

+ (NSString *)readWithKey: (NSString *)keyStr;

#define SIZE_FONT_IPHONE6(_size) [AppUtily sizeFontIphone: _size]
+ (NSInteger)sizeFontIphone: (CGFloat)size;

////xml数据请求拼接
//#define URLBYTAG(field) [AppUtily urlByTag:field]
//+ (NSString *)urlByTag:(NSString *) field;
//
////xml数据请求拼接
//#define PAIPIANURLBYTAG(field) [AppUtily paiPianUrlByTag:field]
//+ (NSString *)paiPianUrlByTag:(NSString *) field;

+(UIImage*)loadBundleImage:(NSString*)name;

@end
