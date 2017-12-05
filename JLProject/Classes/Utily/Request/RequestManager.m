//
//  RequestManager.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/11/28.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "RequestManager.h"

static AFHTTPSessionManager *_manager;

@implementation RequestManager

+ (AFHTTPSessionManager *)shareManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        //申明返回的结果是json类型
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        //申明发送的数据是二进制类型
        manager.requestSerializer=[AFHTTPRequestSerializer serializer];
        manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/plain",@"text/javascript",@"text/xml",@"image/*", nil];
        //清求时间设置
        manager.requestSerializer.timeoutInterval = 30;
        //要设置请求登陆时不保存cookies,这里可以设置
        manager.requestSerializer.HTTPShouldHandleCookies = NO;
        // 设置允许同时最大并发数量，过大容易出问题
        manager.operationQueue.maxConcurrentOperationCount = 3;
        _manager = manager;
    });
    return _manager;
}

//{
//    // 1.初始化单例类
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.securityPolicy.SSLPinningMode = AFSSLPinningModeCertificate;
//    // 2.设置证书模式
//    NSString * cerPath = [[NSBundle mainBundle] pathForResource:@"xxx" ofType:@"cer"];
//    NSData * cerData = [NSData dataWithContentsOfFile:cerPath];
//    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:[[NSSet alloc] initWithObjects:cerData, nil]];
//    // 客户端是否信任非法证书
//    mgr.securityPolicy.allowInvalidCertificates = YES;
//    // 是否在证书域字段中验证域名
//    [mgr.securityPolicy setValidatesDomainName:NO];
//}
//
//{
//    // 1.初始化单例类
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    // 2.设置非校验证书模式
//    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//    manager.securityPolicy.allowInvalidCertificates = YES;
//    [manager.securityPolicy setValidatesDomainName:NO];
//}

#pragma mark - get请求
+(NSURLSessionDataTask *)requestGetWithURL:(NSString *)url completeBlock:(RequestFinishBlock)finishBlock errorBlock:(RequestErrorBlcok)errorBlock{
    return [RequestManager requestGetWithURL:url beforeBlock:nil completeBlock:finishBlock errorBlock:errorBlock endBlock:nil];
}

#pragma mark - get请求总类
+(NSURLSessionDataTask *)requestGetWithURL:(NSString *)url beforeBlock:(DefaultBlock)beforeBlock completeBlock:(RequestFinishBlock)finishBlock errorBlock:(RequestErrorBlcok)errorBlock endBlock:(DefaultBlock)endBlock{

    if (url == nil || url.length == 0) {
        url = @"";
    }
    
    if (beforeBlock) beforeBlock();
    //去掉空字符串
    NSString *urlStr = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    //utf8转码
    NSString *urlUTF8 = [NSString stringWithString:[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    AFHTTPSessionManager *manager = [RequestManager shareManager];
    
    NSURLSessionDataTask *task = [manager GET:urlUTF8 parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

#ifdef DEBUG
        NSLog(@"返回数据： %@", responseObject);
#endif
        if (finishBlock) finishBlock(responseObject);
        if (endBlock) endBlock();

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (errorBlock) errorBlock(error);
        if (endBlock) endBlock();

    }];
    return task;
}

#pragma mark - post请求
+(NSURLSessionDataTask *)requestPostWithURL:(NSString *)url parameters:(NSDictionary*)params completeBlock:(RequestFinishBlock)finishBlock errorBlock:(RequestErrorBlcok)errorBlock{
    return [RequestManager requestPostWithURL:url parameters:params beforeBlock:nil completeBlock:finishBlock errorBlock:errorBlock endBlock:nil];
}

#pragma mark - post请求总类
+(NSURLSessionDataTask *)requestPostWithURL:(NSString *)url parameters:(NSDictionary*)params beforeBlock:(DefaultBlock)beforeBlock completeBlock:(RequestFinishBlock)finishBlock errorBlock:(RequestErrorBlcok)errorBlock endBlock:(DefaultBlock)endBlock{

    if (url == nil || url.length == 0) {
        url = @"";
    }
    
    if (beforeBlock) beforeBlock();

    //去掉空字符串
    NSString *urlStr = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    //utf8转码
    NSString *urlUTF8 = [NSString stringWithString:[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    AFHTTPSessionManager *manager = [RequestManager shareManager];
    
    NSURLSessionDataTask *task = [manager POST:urlUTF8 parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
#ifdef DEBUG
        NSLog(@"返回数据： %@", responseObject);
#endif
        if (finishBlock) finishBlock(responseObject);
        if (endBlock) endBlock();
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (errorBlock) errorBlock(error);
        if (endBlock) endBlock();
    }];
    
    return task;
}

#pragma mark - 上传图片
+(NSURLSessionDataTask *)upLoadWithUrl: (NSString *)url
                                 image: (UIImage *)image
                              filename: (NSString *)fileName
                                  name: (NSString *)name
                              mimeType:(NSString *)mimeType
                            parameters:(NSDictionary *)parameters
                              progress:(upLoadProgressBlock)progress
                               success:(SuccessBlock)success
                                  fail:(FailureBlock)fail{

    if (url == nil || url.length == 0) {
        url = @"";
    }
    //去掉空字符串
    NSString *urlStr = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    //utf8转码
    NSString *urlUTF8 = [NSString stringWithString:[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    AFHTTPSessionManager *manager = [RequestManager shareManager];
    NSURLSessionDataTask *task = [manager POST:urlUTF8 parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //上传图片
        NSData *imageData = UIImageJPEGRepresentation(image, 1);
        NSString *imageFileName = fileName;
        //如果名字为空，用时间戳建个名字
        if (fileName == nil || ![fileName isKindOfClass:[NSString class]] || fileName.length == 0) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            imageFileName = [NSString stringWithFormat:@"%@.jpg", str];
        }
        // 上传图片，以文件流的格式
        [formData appendPartWithFileData:imageData name:name fileName:imageFileName mimeType:mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //显示进度
        if (progress) {
            progress(uploadProgress.completedUnitCount, uploadProgress.totalUnitCount);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //上传成功
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //上传失败
        if (fail) {
            fail(error);
        }
    }];
    return task;
}

#pragma mark - 上传文件
+ (NSURLSessionUploadTask *)uploadFileWithUrl: (NSString *)url
                              uploadingFile: (NSString *)uploadingFile
                                   progress: (upLoadProgressBlock)progress
                                    success: (SuccessBlock)successBlock
                                       fail: (FailureBlock)failBlock{
    if (url == nil || url.length == 0) {
        url = @"";
    }
    //去掉空字符串
    NSString *urlStr = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    //utf8转码
    NSString *urlUTF8 = [NSString stringWithString:[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLRequest *downloadRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlUTF8]];
    
    AFHTTPSessionManager *manager = [RequestManager shareManager];
    
    NSURLSessionUploadTask *task = [manager uploadTaskWithRequest:downloadRequest fromFile:[NSURL URLWithString:uploadingFile] progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress.completedUnitCount, uploadProgress.totalUnitCount);
        }
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error) {
            if (failBlock) {
                failBlock(error);
            }
        }else{
            if (successBlock) {
                successBlock(responseObject);
            }
        }
    }];
    return task;
}

#pragma mark - 下载文件
+(NSURLSessionDownloadTask *)downLoadWithUrl: (NSString *)url
                                  saveToPath: (NSString *)saveToPath
                                    progress: (downLoadProgressBlock)progressBlock
                                     success: (SuccessBlock)successBlock
                                     failure: (FailureBlock)failBlock{
    if (url == nil || url.length == 0) {
        url = @"";
    }
    //去掉空字符串
    NSString *urlStr = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    //utf8转码
    NSString *urlUTF8 = [NSString stringWithString:[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *downloadRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlUTF8]];
    
    AFHTTPSessionManager *manager = [RequestManager shareManager];
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:downloadRequest progress:^(NSProgress * _Nonnull downloadProgress) {
        
        if (progressBlock) {
            progressBlock(downloadProgress.completedUnitCount, downloadProgress.totalUnitCount);
        }
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //返回地址
        return [NSURL URLWithString:saveToPath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error == nil) {
            //下载成功
            if (successBlock) {
                successBlock(response);
            }
        }else{
            //下载失败
            if (failBlock) {
                failBlock(error);
            }
        }
        
        
    }];
    //执行下载
    [task resume];
    
    return task;
}

#pragma mark - 结束所有请求
+(void)cancelAllRequest{

    AFHTTPSessionManager *manager = [RequestManager shareManager];
    for (NSURLSessionDataTask *task in [manager tasks]) {
        [task cancel];
    }
}

#pragma mark - 取消指定请求
+(void)cancelRequest: (NSURLSessionDataTask *)task{

    //NSURLSessionTaskStateRunning = 0,
    //NSURLSessionTaskStateSuspended = 1,
    //NSURLSessionTaskStateCanceling = 2,
    //NSURLSessionTaskStateCompleted = 3,
    if ((task.state == NSURLSessionTaskStateRunning)||(task.state == NSURLSessionTaskStateSuspended)) {
        [task cancel];
    }
}




@end
