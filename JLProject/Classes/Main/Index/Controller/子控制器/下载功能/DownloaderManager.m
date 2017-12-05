//
//  DownloaderManager.m
//  JLProject
//
//  Created by UCS on 2017/11/30.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "DownloaderManager.h"

static DownloaderManager *downloader = nil;

@interface DownloaderManager ()

@end

@implementation DownloaderManager

+ (instancetype)sharedInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        downloader = [[DownloaderManager alloc] init];
    });
    
    return downloader;
}

- (void)downLoadBigFile: (NSString *)url{
    
//    NSString*filepath=[NSHomeDirectory() stringByAppendingPathComponent:@"EncryptionKey"];
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *directryPath = [path stringByAppendingPathComponent:@"VideoFile"];
    
    DLog(@"%@", directryPath);
   
    [RequestManager downLoadWithUrl:url saveToPath:directryPath progress:^(int64_t bytesRead, int64_t totalBytesRead) {
        
        DLog(@"%lf, %lf", bytesRead, totalBytesRead);
        
    } success:^(id responds) {
        
//        DLog(@"%@", responds)
//        NSString *file = [caches stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
//        DLog(@"%@", caches);
//        // 将临时文件剪切或者复制Caches文件夹
//        NSFileManager *mgr = [NSFileManager defaultManager];
//        // AtPath : 剪切前的文件路径
//        // ToPath : 剪切后的文件路径
//        [mgr moveItemAtPath:location.path toPath:file error:nil];
        
    } failure:^(NSError *error) {
        
        DLog(@"error");
        
    }];
    
    
    
}










@end



