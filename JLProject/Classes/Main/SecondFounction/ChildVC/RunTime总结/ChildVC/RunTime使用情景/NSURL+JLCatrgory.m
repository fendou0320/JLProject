//
//  NSURL+JLCatrgory.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/28.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "NSURL+JLCatrgory.h"

@implementation NSURL (JLCatrgory)

//+ (instancetype)URLWithString:(NSString *)String{
//    NSURL *url = [[NSURL alloc] initWithString:String];
//    return url;
//}


+ (instancetype)JL_URLWithString: (NSString *)string{
    
//    NSURL *url = [NSURL URLWithString:string];
    
    /*
     URLWithString  ---> URLWithString实现的地址
     JL_URLWithString ---> JL_URLWithString实现的地址
     
     交换之后
     URLWithString  ---> JL_URLWithString实现的地址
     JL_URLWithString ---> URLWithString实现的地址
     
     防止产生递归
     
     */
    
    //看起来像是死循环---但一定要这样写，调用URLWithString必定产生递归
    NSURL *url = [NSURL JL_URLWithString:string];//走到了系统的方法实现
    if (!url) {
        // 抛出异常方式一
        NSException *excp = [NSException exceptionWithName:@"UrlError" reason:@"传入的url有异常！" userInfo:nil];
        // 抛出异常
        [excp raise];
//        // 抛出异常方式二
//        @throw [NSException exceptionWithName:@"UrlError" reason:@"传入的url有异常！" userInfo:@{@"异常原因":string}]
    }
    return url;
}



/*
 //hook思想--钩子思想
 method_exchangeImplementations 交换方法
 class_getClassMethod  获取类方法
 class_getInstanceSize  获取实例方法
 */

+ (void)load{
    
    /*
     URLWithString  ---> URLWithString实现的地址
     JL_URLWithString ---> JL_URLWithString实现的地址
     
     交换之后
     URLWithString  ---> JL_URLWithString实现的地址
     JL_URLWithString ---> URLWithString实现的地址
     
     防止产生递归
     
     */
    Method urlWithStr = class_getClassMethod([self class], @selector(URLWithString:));
    Method urlWithJLStr = class_getClassMethod([self class], @selector(JL_URLWithString:));
    method_exchangeImplementations(urlWithStr, urlWithJLStr);
    
    
}



@end
