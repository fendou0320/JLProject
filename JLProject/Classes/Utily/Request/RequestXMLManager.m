//
//  RequestXMLManager.m
//  UcsProject
//
//  Created by UCS on 2017/6/15.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "RequestXMLManager.h"

static AFHTTPSessionManager *_manager;

@implementation RequestXMLManager

+ (AFHTTPSessionManager *)shareManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
//        manager.requestSerializer=[AFHTTPRequestSerializer serializer];
//        manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        manager.requestSerializer.timeoutInterval = 30;
//        manager.requestSerializer.HTTPShouldHandleCookies = NO;
//        manager.operationQueue.maxConcurrentOperationCount = 3;
        _manager = manager;
    });
    return _manager;
}

#pragma mark - post请求
+(NSURLSessionDataTask *)requesXMLtPostWithURL:(NSString *)url parameters:(NSMutableDictionary*)params completeBlock:(RequestFinishBlock)finishBlock errorBlock:(RequestErrorBlcok)errorBlock{
    
    AFNetworkReachabilityStatus network = [MonitoringNetwork monitoringNetworkState];
    if (network == AFNetworkReachabilityStatusNotReachable) {
        return nil;
    }else{
    }
    
    if (url == nil || url.length == 0) {
        url = @"";
    }
    NSString *urlStr = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *urlUTF8 = [NSString stringWithString:[urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    AFHTTPSessionManager *manager = [RequestXMLManager shareManager];
    NSURLSessionDataTask *task = [manager POST:urlUTF8 parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {

        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
#ifdef DEBUG
        NSLog(@"返回数据： %@", responseObject);
#endif
        NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLParser:responseObject];
                
        if (finishBlock) {
            finishBlock(xmlDoc);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
#ifdef DEBUG
        NSLog(@"请求失败： %@", error);
#endif
        
        if (errorBlock) errorBlock(error);
        
    }];
    return task;
}

#pragma mark - 结束所有请求
+(void)cancelAllRequest{
    
    AFHTTPSessionManager *manager = [RequestXMLManager shareManager];
    for (NSURLSessionDataTask *task in [manager tasks]) {
        [task cancel];
    }
}

#pragma mark - 取消指定请求
+(void)cancelRequest: (NSURLSessionDataTask *)task{
    
     if ((task.state == NSURLSessionTaskStateRunning)||(task.state == NSURLSessionTaskStateSuspended)) {
        [task cancel];
    }
}


@end
