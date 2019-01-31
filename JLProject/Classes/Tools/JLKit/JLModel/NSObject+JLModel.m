//
//  NSObject+JLModel.m
//  JLProject
//
//  Created by jiangliang on 2018/9/12.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "NSObject+JLModel.h"

/**
 这个内部的类主要是对这个类的描述。包含了和此类转换相关的数据。

 */
@interface JLModelMeta : NSObject {
    @package
    
}
@end
@implementation JLModelMeta

@end


/**
 对外调用使用
 */
@implementation NSObject (JLModel)

/**
 json转字典

 @param json json
 @return 字典
 */
+ (NSDictionary *)_jl_dictionaryWithJson: (id)json {
    if (!json||json == (id)kCFNull) return nil;
    NSDictionary *dic = nil;
    NSData *jsonData = nil;
    if ([json isKindOfClass:[NSDictionary class]]) {
        dic = json;
    }else if ([json isKindOfClass:[NSString class]]){
        jsonData = [(NSString *)json dataUsingEncoding:NSUTF8StringEncoding];
    }else if ([json isKindOfClass:[NSData class]]){
        jsonData = json;
    }
    if (jsonData) {
        dic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
        if (![dic isKindOfClass:[NSDictionary class]]) dic = nil;
    }
    return dic;
}

/**
 json转model
 返回model
 */
+ (nullable instancetype)modelWithJson: (id)json {
    NSDictionary *dic = [self _jl_dictionaryWithJson:json];
    return [self modelWithDictionary:dic];
}

/**
 字典转成model

 @param dictionary 字典
 @return model
 */
+ (instancetype)modelWithDictionary: (NSDictionary *)dictionary{
    
    if (!dictionary||dictionary == (id)kCFNull) return nil;
    if (![dictionary isKindOfClass:[NSDictionary class]]) return nil;
    
    Class cls = [self class];
    
    
    return nil;
}



@end
