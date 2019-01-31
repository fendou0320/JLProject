//
//  JLWebViewVC.m
//  JLProject
//
//  Created by jiangliang on 2018/10/26.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "JLWebViewVC.h"

@implementation JLWebViewVC

- (void)viewDidLoad{
    [super viewDidLoad];
    
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:self.webView];
    
    
//    NSMutableString *cookieValue = [NSMutableString stringWithFormat:@""];
//    NSDictionary *cookieDic = @{@"ticket":infoModel.ticket,
//                                @"userCode":infoModel.userCode,
//                                @"SESSION":infoModel.SESSION,
//                                @"fundAcct":infoModel.fundAcct,
//                                };
//    //拼接
//    for (NSString *key in cookieDic) {
//        NSString *appendString = [NSString stringWithFormat:@"%@=%@;", key, [cookieDic valueForKey:key]];
//        [cookieValue appendString:appendString];
//    }
//
    //    NSString *bString = [cookieValue substringFromIndex:cookieValue.length-1];
    
//    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://test.wkzq.com.cn/web/stock/html/trade/myStock.html"]];
    
//    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://113.105.85.167:81/account/authrize?clientNo=&cellPhoneNo=BE22BB68-FF5C-4DC2-9849-8F3C18E83D8E&riskLevel=0&timestamp=1541035584222"]];
    
//    [request addValue:@"ticket=ZjaNEgvYdKbGD+eGDJra6bLqNiY18pKT4yih9wGPIMA=#BZBvJt+nvAK8KfSb+OC/bVzqEEjDrpTE7OLrBUwD+sZgzhlY/ElKLJtA35viM+twfZkr8LjqC8qZg0Ig/n+tOGLppM7pnWaQl8xR8e+TOM53OX5hT/XS8AffJekk1azucu5qC/xpJrGPk8CM2Osiqw==#1#s7Z868HmW0k=;userCode=1000004835;SESSION=cb008ba5-09ad-47b7-948a-4a8d19b2fde6;fundAcct=1000004835" forHTTPHeaderField:@"Cookie"];
    
    
//    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://file.finance.sina.com.cn/211.154.219.97:9494/MRGG/CNSESH_STOCK/2018/2018-11/2018-11-21/4881600.PDF"]];
//
//
//    [self.webView loadRequest:request];

    
    
    
    
}

- (void)upLoadTradeCookie{
    
//    [LTCookieManager deleteAllCookie];
    
    NSMutableArray *keyArray = [NSMutableArray arrayWithCapacity:4];
    NSMutableArray *valueArray = [NSMutableArray arrayWithCapacity:4];
    
    [keyArray addObject:@"uid"];
    [keyArray addObject:@"access-token"];
    
    [valueArray addObject:@""];
    
    for (int i = 0; i<keyArray.count; i++) {
        NSMutableDictionary *cookieProperties = [[NSMutableDictionary alloc]init];
        [cookieProperties setObject:keyArray[i] forKey:NSHTTPCookieName];
        [cookieProperties setObject:valueArray[i] forKey:NSHTTPCookieValue];
        [cookieProperties setObject:@"izq.sina.com.cn" forKey:NSHTTPCookieDomain];
        [cookieProperties setObject:@"/" forKey:NSHTTPCookiePath];
        [cookieProperties setObject:@"0" forKey:NSHTTPCookieVersion];
        [cookieProperties setObject:[[NSDate date] dateByAddingTimeInterval:86000] forKey:NSHTTPCookieExpires];
        NSHTTPCookie *cookieuser = [[NSHTTPCookie alloc]initWithProperties:cookieProperties];
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookieuser];
    }
}




/*
 
 //webView种cookie
 
 {
 NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
 NSDictionary *propertiesdic= @{NSHTTPCookieName : @"userCode", NSHTTPCookieValue : [self createSessionId], NSHTTPCookieDomain : @".wkzq.com.cn", NSHTTPCookiePath : @"/"};
 NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:propertiesdic];
 if (cookie) {
 [cookieStorage setCookie:cookie];
 }
 }
 
 */



@end
