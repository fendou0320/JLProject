//
//  NSDictionary+SetNullWithStr.h
//  MVMProject
//
//  Created by UCS-User on 2018/2/6.
//  Copyright © 2018年 MVMProject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SetNullWithStr)

/*
 *把服务器返回的<null> 替换为“”
 *json表示获取到的带有NULL对象的json数据
 *NSDictionary *newDict = [NSDictionary changeType:json];
 */
+(id)changeType:(id)object;

@end
