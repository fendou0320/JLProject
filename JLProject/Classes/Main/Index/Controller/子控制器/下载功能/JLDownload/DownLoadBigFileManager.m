//
//  DownLoadBigFileManager.m
//  MVMProject
//
//  Created by UCS on 2017/12/4.
//  Copyright © 2017年 MVMProject. All rights reserved.
//

#import "DownLoadBigFileManager.h"

@interface DownLoadBigFileManager()<NSURLSessionDownloadDelegate>
/**
 *  下载任务
 */
@property (nonatomic, strong) NSURLSessionDownloadTask* downloadTask;
/**
 *  resumeData记录下载位置
 */
@property (nonatomic, strong) NSData* resumeData;

@property (nonatomic, strong) NSURLSession *session;

@end


@implementation DownLoadBigFileManager

- (NSURLSession *)session
{
    if (nil == _session) {
        
        NSURLSessionConfiguration *cfg = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:cfg delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}

/**
 *  从0开始下载
 */
- (void)startDownload
{
    //创建session
    [self session];
    
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    DLog(@"%@", caches);
    
    //    NSURL* url = [NSURL URLWithString:@"http://localhost:8080/shudai99/resources/The_Fixer.mp4"];
    NSURL* url = [NSURL URLWithString:@"http://dlsw.baidu.com/sw-search-sp/soft/9d/25765/sogou_mac_32c_V3.2.0.1437101586.dmg"];
    // 创建任务
    self.downloadTask = [_session downloadTaskWithURL:url];
    // 开始任务
    [self.downloadTask resume];
    
}


#pragma mark -- NSURLSessionDownloadDelegate
/**
 *  下载完毕会调用
 *
 *  @param location     文件临时地址
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location
{
    
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    // response.suggestedFilename ： 建议使用的文件名，一般跟服务器端的文件名一致
    NSString *file = [caches stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    
    DLog(@"%@", caches);
    
    // 将临时文件剪切或者复制Caches文件夹
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // AtPath : 剪切前的文件路径
    // ToPath : 剪切后的文件路径
    [mgr moveItemAtPath:location.path toPath:file error:nil];
    
    // 提示下载完成
    [[[UIAlertView alloc] initWithTitle:@"下载完成" message:downloadTask.response.suggestedFilename delegate:self cancelButtonTitle:@"知道了" otherButtonTitles: nil] show];
}

/**
 *  每次写入沙盒完毕调用
 *  在这里面监听下载进度，totalBytesWritten/totalBytesExpectedToWrite
 *
 *  @param bytesWritten              这次写入的大小
 *  @param totalBytesWritten         已经写入沙盒的大小
 *  @param totalBytesExpectedToWrite 文件总大小
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
//    self.myPregress.progress = (double)totalBytesWritten/totalBytesExpectedToWrite;
//    self.pgLabel.text = [NSString stringWithFormat:@"下载进度:%f",(double)totalBytesWritten/totalBytesExpectedToWrite];
    DLog(@"%lf", (double)totalBytesWritten/totalBytesExpectedToWrite);
}

/**
 *  恢复下载后调用，
 */
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes
{
    
}




@end
