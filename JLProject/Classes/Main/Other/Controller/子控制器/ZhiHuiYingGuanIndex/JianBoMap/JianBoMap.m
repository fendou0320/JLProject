//
//  JianBoMap.m
//  UcsProject
//
//  Created by UCS on 2017/7/6.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "JianBoMap.h"

@interface JianBoMap ()
//@property (nonatomic, assign)MapZHINENGJIANBOType mapType;
@end

@implementation JianBoMap

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self creatWebView];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)creatWebView{
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.backgroundColor = [UIColor greenColor];
    self.webView.delegate = self;
    [self addSubview:self.webView];
    
    for (UIView *_aView in [self.webView subviews])
    {
        if ([_aView isKindOfClass:[UIScrollView class]])
        {
            [(UIScrollView *)_aView setShowsVerticalScrollIndicator:NO];
            //右侧的滚动条
            [(UIScrollView *)_aView setShowsHorizontalScrollIndicator:NO];
            //下侧的滚动条
            for (UIView *_inScrollview in _aView.subviews)
            {
                if ([_inScrollview isKindOfClass:[UIImageView class]])
                {
                    _inScrollview.hidden = YES;  //上下滚动出边界时的黑色的图片
                }
            }
        }
    }
    [(UIScrollView *)[[self.webView subviews] objectAtIndex:0] setBounces:NO];
}


- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    NSLog(@"webview开始加载");
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    NSLog(@"webview加载结束");
    
    self.jsContext[@"abcMap"] = self;
    
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
        
        NSLog(@"异常信息：%@", exceptionValue);
    };

    
    //1
//    NSError *error1;
//    NSString *path1 = [[NSBundle mainBundle]pathForResource:@"jquery-1.8.2" ofType:@"js"];
//    NSString *content1 = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:&error1];
//    if (error1) {
//    } else {
//    }
//    NSString *alertJS1 = [NSString stringWithFormat:@"loadScriptString(%@)", content1];
//    [self.jsContext evaluateScript:alertJS1];

//    NSError *error2;
//    NSString *path2 = [[NSBundle mainBundle]pathForResource:@"jquery-jvectormap-au-mill" ofType:@"js"];
//    NSString *content2 = [NSString stringWithContentsOfFile:path2 encoding:NSUTF8StringEncoding error:&error2];
//    if (error2) {
//    } else {
//    }
//    NSString *alertJS2 = [NSString stringWithFormat:@"loadScriptString(%@)", content1];
//    [self.jsContext evaluateScript:alertJS1];

//    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:3];
//    [arr addObject: [[NSBundle mainBundle]pathForResource:@"jquery-1.8.2" ofType:@"js"]];
//    [arr addObject: [[NSBundle mainBundle]pathForResource:@"jquery-jvectormap-2.0.3.min" ofType:@"js"]];
//    [arr addObject: [[NSBundle mainBundle]pathForResource:@"jquery-jvectormap-cn-mill" ofType:@"js"]];
//    [arr addObject: [[NSBundle mainBundle]pathForResource:@"jquery-jvectormap-world-mill-en" ofType:@"js"]];
//    [arr addObject: [[NSBundle mainBundle]pathForResource:@"jquery-jvectormap-world-cn-mill-en" ofType:@"js"]];
    
//    [arr addObject: [[NSBundle mainBundle]pathForResource:@"jquery-jvectormap-au-mill" ofType:@"js"]];

//    NSString *path1 = [[NSBundle mainBundle]pathForResource:@"jquery-1.8.2" ofType:@"js"];
    
//    NSString *path1;
//    
//    for (NSString *str in arr) {
//        
//        path1 = str;
//        
//     
//        
//        
//    }
    
    {
        NSError *error1;
        NSString *path1 = [[NSBundle mainBundle]pathForResource:@"jquery-1.8.2-mill" ofType:@"js"];
        NSString *content1 = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:&error1];
        if (error1) {
            
        } else {
            
        }
        NSString *alertJS1 = [NSString stringWithFormat:@"loadScriptString('%@')", content1];
        [self.jsContext evaluateScript:alertJS1];
    }

    
    
        {
            NSError *error1;
            NSString *path1 = [[NSBundle mainBundle]pathForResource:@"jquery-jvectormap-2.0.3.min" ofType:@"js"];
            NSString *content1 = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:&error1];
            if (error1) {
    
            } else {
    
            }
            NSString *alertJS1 = [NSString stringWithFormat:@"loadScriptString('%@')", content1];
            [self.jsContext evaluateScript:alertJS1];
        }
    

    
    
    {
        NSError *error1;
        NSString *path1 = [[NSBundle mainBundle]pathForResource:@"jquery-jvectormap-world-cn-mill-en" ofType:@"js"];
        NSString *content1 = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:&error1];
        if (error1) {
            
        } else {
            
        }
        
        NSString *alertJS1 = [NSString stringWithFormat:@"loadScriptString('%@')", content1];//
        [self.jsContext evaluateScript:alertJS1];
    }
    
    
    {
        NSError *error1;
        NSString *path1 = [[NSBundle mainBundle]pathForResource:@"jquery-jvectormap-world-mill-en" ofType:@"js"];
        NSString *content1 = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:&error1];
        if (error1) {
            
        } else {
            
        }
        
        NSString *alertJS1 = [NSString stringWithFormat:@"loadScriptString('%@')", content1];//
        [self.jsContext evaluateScript:alertJS1];
    }

    
    {
        NSError *error1;
        NSString *path1 = [[NSBundle mainBundle]pathForResource:@"jquery.cookie" ofType:@"js"];
        NSString *content1 = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:&error1];
        if (error1) {
            
        } else {
            
        }
        
        NSString *alertJS1 = [NSString stringWithFormat:@"loadScriptString('%@')", content1];//
        [self.jsContext evaluateScript:alertJS1];
    }

    
//    {
//        NSError *error1;
//        NSString *path1 = [[NSBundle mainBundle]pathForResource:@"jquery-1.8.2" ofType:@"js"];
//        NSString *content1 = [NSString stringWithContentsOfFile:path1 encoding:NSUTF8StringEncoding error:&error1];
//        if (error1) {
//            
//        } else {
//            
//        }
//        NSString *alertJS1 = [NSString stringWithFormat:@"loadScriptString(%@)", content1];
//        [self.jsContext evaluateScript:alertJS1];
//    }

    
    
   //--------------------------------
    
    {
        NSString *alertJS111 = _jinTianStr;
        [self.jsContext evaluateScript:alertJS111];
    }

    
    
//    if (_mapType == MapZHINENGJIANBOTypeWorld) {
//        
//        
//    }else if (_mapType == MapZHINENGJIANBOTypeCHINA){
//        
//        NSString *alertJS = _jinTianStr; //准备执行的js代码
////        NSString *alertJS = [NSString stringWithFormat:@"consumer('%@','%@')",[AccountManager sharedInstance].userID, TIME_NOW]; //准备执行的js代码
//        [self.jsContext evaluateScript:alertJS];
//        
//    }
    
}

// 如果返回NO，代表不允许加载这个请求
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    // 说明协议头是ios
//    NSURL *url = request.URL;
//    NSString *urlStr = [url absoluteString];
    
//    if ([urlStr isEqualToString:@"http://103.8.8.10:61523/map/China.html"]) {
//        
//        _mapType = MapZHINENGJIANBOTypeCHINA;
////        _jinTianStr = [NSString stringWithFormat:@"consumer('%ld','%d')", [(long)[AccountManager sharedInstance].userID st] ,0];
//        
//        if (self.chinaBlock) {
//            self.chinaBlock(@"china");
//        }
//        
//    }else if ([urlStr isEqualToString:@"http://103.8.8.10:61523/map/world.html"]){
//        
//        _mapType = MapZHINENGJIANBOTypeWorld;
//        
//        if (self.chinaBlock) {
//            self.chinaBlock(@"world");
//        }
//
//    }else if ([urlStr isEqualToString:@"http://103.8.8.10:61523/map/World.html?cleanCookie=true"]){
//    
//        _mapType = MapZHINENGJIANBOTypeWorld;
//        
//        if (self.chinaBlock) {
//            self.chinaBlock(@"world");
//        }
//
//    }
//    
//    //    if ([urlStr isEqualToString:@"http://192.168.30.43:83/map/China.html"]) { //China
//    //
//    //        _mapType = MapZHINENGJIANBOTypeCHINA;
//    //
//    //        if (self.chinaBlock) {
//    //            self.chinaBlock(@"china");
//    //        }
//    //
//    //    }else if ([urlStr isEqualToString:@"http://192.168.30.43:83/map/World.html"]){
//    //
//    //        _mapType = MapZHINENGJIANBOTypeWorld;
//    //        if (self.chinaBlock) {
//    //            self.chinaBlock(@"world");
//    //        }
//    //    }
    
    return YES;
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    NSLog(@"%@", error);
}


- (void)callInfo:(id)data{
    
    NSLog(@"%@", data);
    if (self.dataBlock) {
        self.dataBlock(data);
    }
}


- (void)back: (id)data{
    
    NSLog(@"%@", data);
    //    self.urlStr = @"http://192.168.30.43:83/map/World.html";
}


- (void)setUrlStr:(NSString *)urlStr{
    
    _urlStr = urlStr;
    
//    //缓存web清除
//    [[NSURLCache sharedURLCache] removeAllCachedResponses];
//    if (urlStr) {//清除所有cookie
//        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:urlStr]];
//        for (int i = 0; i < [cookies count]; i++) {
//            NSHTTPCookie *cookie = (NSHTTPCookie *)[cookies objectAtIndex:i];
//            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
//        }
//    }
    
    NSURL* url = [NSURL URLWithString:urlStr];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    [self.webView loadRequest:request];
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.webView.scrollView.contentOffset= CGPointMake(self.width, self.height);
    self.webView.scrollView.contentInset = UIEdgeInsetsZero;
}


- (void)tiaoZhuanQianYiTian: (NSString *)tianshu{
    
    //@"http://103.8.8.10:61523/map/China.html"
    
    _jinTianStr = tianshu;
    
    NSURL* url = [NSURL URLWithString:_urlStr];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
    
}






@end
