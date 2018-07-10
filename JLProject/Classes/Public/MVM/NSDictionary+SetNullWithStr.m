//
//  NSDictionary+SetNullWithStr.m
//  MVMProject
//
//  Created by UCS-User on 2018/2/6.
//  Copyright © 2018年 MVMProject. All rights reserved.
//

#import "NSDictionary+SetNullWithStr.h"

@implementation NSDictionary (SetNullWithStr)

//将NSDictionary中的Null类型的项目转化成@""
+(NSDictionary *)nullDic:(NSDictionary *)dic
{
    NSArray *keyArr = [dic allKeys];
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc] init];
    for (int i = 0; i < keyArr.count; i++)
    {
        id obj = [dic objectForKey:keyArr[i]];
        
        obj = [self changeType:obj];
        
        [resDic setObject:obj forKey:keyArr[i]];
    }
    return resDic;
}

//将NSArray中的Null类型的项目转化成@""
+(NSArray *)nullArr:(NSArray *)arr
{
    NSMutableArray *resArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < arr.count; i++)
    {
        id obj = arr[i];
        
        obj = [self changeType:obj];
        
        [resArr addObject:obj];
    }
    return resArr;
}

//将NSString类型的原路返回
+(NSString *)stringToString:(NSString *)string
{
    if (string == nil || string == NULL || [string isEqualToString:@"null"]) {
        return @"";
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return @"";
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return @"";
    }
    
    return string;
}

//将Null类型的项目转化成@""
+(NSString *)nullToString
{
    return @"";
}

//主要方法
//类型识别:将所有的NSNull类型转化成@""
+(id)changeType:(id)object
{
    if ([object isKindOfClass:[NSDictionary class]])
    {
        return [self nullDic:object];
    }
    else if([object isKindOfClass:[NSArray class]])
    {
        return [self nullArr:object];
    }
    else if([object isKindOfClass:[NSString class]])
    {
        return [self stringToString:object];
    }
    else if([object isKindOfClass:[NSNull class]])
    {
        return [self nullToString];
    }
    else
    {
        return object;
    }
}


@end
