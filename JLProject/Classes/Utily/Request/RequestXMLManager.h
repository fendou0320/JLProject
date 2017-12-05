//
//  RequestXMLManager.h
//  UcsProject
//
//  Created by UCS on 2017/6/15.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLDictionary.h"

@interface RequestXMLManager : NSObject

//post请求
+(NSURLSessionDataTask *)requesXMLtPostWithURL:(NSString *)url parameters:(NSDictionary*)params completeBlock:(RequestFinishBlock)finishBlock errorBlock:(RequestErrorBlcok)errorBlock;

@end
