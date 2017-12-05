//
//  RequestManager.h
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/11/28.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetWorking.h"

typedef void (^RequestFinishBlock)(id result);
typedef void (^RequestErrorBlcok)(NSError *error);
typedef void (^DefaultBlock)();
/**
 上传进度

 @param bytesWritten      已上传大小
 @param totalBytesWritten 总大小
 */
typedef void (^upLoadProgressBlock)(int64_t bytesWritten, int64_t totalBytesWritten);
/**
 下载进度

 @param bytesRead      已下载大小
 @param totalBytesRead 总大小
 */
typedef void (^downLoadProgressBlock)(int64_t bytesRead, int64_t totalBytesRead);

@interface RequestManager : NSObject

/**
 get简单请求

 @param url         请求地址
 @param finishBlock 请求成功
 @param errorBlock  请求失败

 @return NSURLSessionDataTask
 */
+(NSURLSessionDataTask *)requestGetWithURL:(NSString *)url completeBlock:(RequestFinishBlock)finishBlock errorBlock:(RequestErrorBlcok)errorBlock;

/**
 get复杂请求

 @param url         请求地址
 @param beforeBlock 请求之前的操作
 @param finishBlock 请求成功
 @param errorBlock  请求失败
 @param endBlock    请求结束

 @return NSURLSessionDataTask
 */
+(NSURLSessionDataTask *)requestGetWithURL:(NSString *)url beforeBlock:(DefaultBlock)beforeBlock completeBlock:(RequestFinishBlock)finishBlock errorBlock:(RequestErrorBlcok)errorBlock endBlock:(DefaultBlock)endBlock;

/**
 post简单请求

 @param url         请求地址
 @param params      请求参数
 @param finishBlock 请求成功
 @param errorBlock  请求失败

 @return NSURLSessionDataTask
 */
+(NSURLSessionDataTask *)requestPostWithURL:(NSString *)url parameters:(NSDictionary*)params completeBlock:(RequestFinishBlock)finishBlock errorBlock:(RequestErrorBlcok)errorBlock;

/**
 post复杂请求

 @param url         请求地址
 @param params      请求参数字典
 @param beforeBlock 请求之前的操作
 @param finishBlock 请求成功
 @param errorBlock  请求失败
 @param endBlock    请求结束

 @return NSURLSessionDataTask
 */
+(NSURLSessionDataTask *)requestPostWithURL:(NSString *)url parameters:(NSDictionary*)params beforeBlock:(DefaultBlock)beforeBlock completeBlock:(RequestFinishBlock)finishBlock errorBlock:(RequestErrorBlcok)errorBlock endBlock:(DefaultBlock)endBlock;

/**
 上传图片

 @param url        上传地址
 @param image      上传图片
 @param fileName   给图片起一个名字，默认为当前日期时间,格式为"yyyyMMddHHmmss"，后缀为`jpg`
 @param name       与指定的图片相关联的名称，这是由后端写接口的人指定的，如imagefiles
 @param mimeType   图片类型 默认为image/jpeg
 @param parameters 参数
 @param progress   上传进度
 @param success    上传成功
 @param fail       上传失败

 @return NSURLSessionDataTask
 */
+(NSURLSessionDataTask *)upLoadWithUrl: (NSString *)url
                                 image: (UIImage *)image
                              filename: (NSString *)fileName
                                  name: (NSString *)name
                              mimeType:(NSString *)mimeType
                            parameters:(NSDictionary *)parameters
                              progress:(upLoadProgressBlock)progress
                               success:(SuccessBlock)success
                                  fail:(FailureBlock)fail;

/**
 上传文件

 @param url           上传路径
 @param uploadingFile 待上传的文件路径
 @param progress      上传进度
 @param successBlock  上传成功
 @param failBlock     上传失败

 @return NSURLSessionUploadTask
 */
+ (NSURLSessionUploadTask *)uploadFileWithUrl: (NSString *)url
                                uploadingFile: (NSString *)uploadingFile
                                     progress: (upLoadProgressBlock)progress
                                      success: (SuccessBlock)successBlock
                                         fail: (FailureBlock)failBlock;

/**
 下载文件

 @param url           下载路径
 @param saveToPath    下载到本地哪个路径下
 @param progressBlock 下载进度
 @param successBlock  下载成功后的回调
 @param failBlock     下载失败后的回调

 @return NSURLSessionDownloadTask
 */
+(NSURLSessionDownloadTask *)downLoadWithUrl: (NSString *)url
                                  saveToPath: (NSString *)saveToPath
                                    progress: (downLoadProgressBlock)progressBlock
                                     success: (SuccessBlock)successBlock
                                     failure: (FailureBlock)failBlock;

/**
 取消所有请求
 */
+(void)cancelAllRequest;

/**
 取消指定请求

 @param task 指定task
 */
+(void)cancelRequest: (NSURLSessionDataTask *)task;

@end
