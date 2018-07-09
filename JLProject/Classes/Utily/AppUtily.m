//
//  AppUtily.m
//  JLVideoPlayer
//
//  Created by UCS on 2017/5/2.
//  Copyright © 2017年 WangJiangliang. All rights reserved.
//

#import "AppUtily.h"

@implementation AppUtily

+ (NSString *)getProjectVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [NSString stringWithFormat:@"%@",[infoDictionary objectForKey:@"CFBundleShortVersionString"]];
    return version;
}

+ (BOOL)isFirstRun
{
    NSString *key = [NSString stringWithFormat:@"isFirstRun_%@",[AppUtily getProjectVersion]];
    BOOL isFirstRun = [[[NSUserDefaults standardUserDefaults] valueForKey:key] boolValue];
    [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return !isFirstRun;
}

+(uint64_t)getFreeDiskspace
{
    
    uint64_t totalSpace = 0.0f;
    uint64_t totalFreeSpace = 0.0f;
    
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error:&error];
    if (dictionary) {
        NSNumber *fileSystemSizeInBytes = [dictionary objectForKey: NSFileSystemSize];
        NSNumber *freeFileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemFreeSize];
        totalSpace = [fileSystemSizeInBytes floatValue];
        totalFreeSpace = [freeFileSystemSizeInBytes floatValue];
    }else{
        
        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %ld", [error domain], (long)[error code]);
    }
    
    return totalFreeSpace;
}

+ (NSInteger)howManyDaysInThisMonth:(NSInteger)year month:(NSInteger)imonth
{
    if((imonth == 1)||(imonth == 3)||(imonth == 5)||(imonth == 7)||(imonth == 8)||(imonth == 10)||(imonth == 12)){
        return 31;
    }
    if((imonth == 4)||(imonth == 6)||(imonth == 9)||(imonth == 11)){
        return 30;
    }
    if((year%4 == 1)||(year%4 == 2)||(year%4 == 3)){
        return 28;
    }
    if(year%400 == 0){
        return 29;
    }
    if(year%100 == 0){
        return 28;
    }
    return 29;
}

+ (NSString *)formatTime:(NSInteger)value
{
    if(value < 0) value = 0;
    NSInteger hour    =   0;
    NSInteger minute  =   0;
    NSInteger second  =   0;
    
    minute = value / 60;
    hour = minute / 60;
    minute = minute % 60;
    second = value % 60;
    return [NSString stringWithFormat:@"%02ld:%02ld:%02ld" , hour , minute , second];
}

+(NSDate*)stringDate:(NSString*)str
{
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d = [dateFormatter dateFromString:str];
    return d;
}

+ (UIColor *)hexToRGB:(NSString *)hexColor
{
    NSString *str = nil;
    if([hexColor rangeOfString:@"#"].length>0){
        
        str = [hexColor substringFromIndex:1];
    }else{
        str = hexColor;
    }
    if(str.length<=0)
    {
        return [UIColor clearColor];
    } else if (str.length != 6){
        return [UIColor clearColor];
        
    }
    unsigned int red, green, blue;
    NSRange range;
    range.length =2;
    range.location =0;
    [[NSScanner scannerWithString:[str substringWithRange:range]]scanHexInt:&red];
    range.location =2;
    [[NSScanner scannerWithString:[str substringWithRange:range]]scanHexInt:&green];
    range.location =4;
    [[NSScanner scannerWithString:[str substringWithRange:range]]scanHexInt:&blue];
    return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green/255.0f)blue:(float)(blue/255.0f)alpha:1.0f];
}

+ (void)showAlertViewPhoneWithTitle: (NSString *)title message:(NSString*)messageStr
{

    //创建标题
    NSString *confirmButtonTitle = NSLocalizedString(@"拨打",nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"取消",nil);
    //创建UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    //确定按钮
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        DLog(@"确定");
        NSMutableString* str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"86-13520307449"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }];
    //取消
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
         DLog(@"取消");
    }];
    
//    NSMutableAttributedString *messageAtt = [[NSMutableAttributedString alloc] initWithString:messageStr];
//    [messageAtt addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30/2] range:NSMakeRange(0, title.length)];
//    [messageAtt addAttribute:NSForegroundColorAttributeName value:COLOR_LOGO_Red range:NSMakeRange(0, title.length)];
//    [alertController setValue:messageAtt forKey:@"attributedMessage"];
    
    //将按钮放到UIAlertController
    [alertController addAction:confirmAction];
    [alertController addAction:cancelAction];
    //跳转
    //[UIApplication sharedApplication].keyWindow
    UIViewController *ctr = [AppUtily getCurrentVC];
    [ctr presentViewController:alertController animated:YES completion:nil];
}


+ (void)showAlertViewWithTitle: (NSString *)title message:(NSString*)messageStr{
    
    //创建标题
    NSString *cancelButtonTitle = NSLocalizedString(@"确定", nil);
    //创建UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    //创建按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    //将按钮放到UIAlertController
    [alertController addAction:cancelAction];
    //跳转
    //[UIApplication sharedApplication].keyWindow
    UIViewController *ctr = [AppUtily getCurrentVC];
    
    [ctr presentViewController:alertController animated:YES completion:nil];
    
}

+ (void)showAlertViewWithTitle: (NSString *)title message:(NSString*)messageStr viewCtrl: (UIViewController *)viewCtrl{
    
    //创建标题
    NSString *cancelButtonTitle = NSLocalizedString(@"确定", nil);
    //创建UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    //创建按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    //将按钮放到UIAlertController
    [alertController addAction:cancelAction];
    //跳转
    //[UIApplication sharedApplication].keyWindow
    [viewCtrl presentViewController:alertController animated:YES completion:nil];
    
}

#pragma mark - 获取当前控制器
+ (UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]){
        
        result = nextResponder;
    }else{
        
        result = window.rootViewController;
    }
    return result;
}

//+ (void)downPictureWithUrl: (NSString *)imgUrl{
//
//    UIImage *imge = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl]]];
//    
//    UIImageWriteToSavedPhotosAlbum(imge, nil, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
//}
//
//
//- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
//{
//    if (!error) {
//        DLog(@"保存成功");
//    }else{
//        DLog(@"保存失败,请重新保存!");
//    }
//}

+(NSString*)randomTimeStamp;{

    return [NSString stringWithFormat:@"%f",[[NSDate date] timeIntervalSince1970]*1000];
}

+ (void)saveWithKey: (NSString *)keyStr valueStr: (NSString *)valueStr
{
    if ([keyStr isEqualToString:@""]) {
        
    }else{
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setValue:valueStr forKey:keyStr];
        [defaults synchronize];
    }
}

+ (NSString *)readWithKey: (NSString *)keyStr
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults valueForKey:keyStr];
}

+ (NSInteger)sizeFontIphone: (CGFloat)size{

    double fontSize = (kScreenWidth / 375.0 * (size));
    NSInteger index = (NSInteger)floor(fontSize / 1.0);
    if (index%2==0) {
        
    }else{
        index = index + 1;
    }
    return index;
}

////xml数据拼接
//+ (NSString *)urlByTag:(NSString*) field
//{
//    NSString * url = [NSString stringWithFormat:@"%@,%@", BASE_NOC_SERVER_URL, field];
//    return url;
//}
//
////拍片数据拼接
//+ (NSString *)paiPianUrlByTag:(NSString*) field;
//{
//    NSString * url = [NSString stringWithFormat:@"%@,%@", PAIPIAN_SERVER_URL, field];
//    return url;
//}

+(UIImage*)loadBundleImage:(NSString*)name{
    
    NSString *path = [NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] resourcePath],name];
    
    NSString *retinaPath = [[path stringByDeletingLastPathComponent] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@@2x.%@", [[path lastPathComponent] stringByDeletingPathExtension], [path pathExtension]]];
    
    if( [UIScreen mainScreen].scale == 2.0 && [[NSFileManager defaultManager] fileExistsAtPath:retinaPath] == YES)
        return [[UIImage alloc] initWithCGImage:[[UIImage imageWithData:[NSData dataWithContentsOfFile:retinaPath]] CGImage] scale:2.0 orientation:UIImageOrientationUp];
    else
        return [UIImage imageWithContentsOfFile:path];
}

//判断是视频还是图片
+ (BOOL)judgeVideoOrImage:(NSString *)url{
//    AVAsset *asset = [AVURLAsset URLAssetWithURL:url options:dictionary];
//    NSArray *tracks = [asset tracksWithMediaType:AVMediaTypeVideo];
//    BOOL hasVideoTrack = [tracks count] > 0;
}




@end
