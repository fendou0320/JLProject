//
//  TemplateOneWebView.m
//  JLProject
//
//  Created by UCS on 2017/7/22.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "TemplateOneWebView.h"
#import <WebKit/WebKit.h>

@interface TemplateOneWebView ()<WKScriptMessageHandler,WKNavigationDelegate,WKUIDelegate>
//webView
@property(nonatomic,strong)WKWebView *webView;

@end

@implementation TemplateOneWebView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubView];
    }
    return self;
}

- (void)creatSubView{

    WKWebViewConfiguration *config = [WKWebViewConfiguration new];
    //初始化偏好设置属性：preferences
    config.preferences = [WKPreferences new];
    //The minimum font size in points default is 0;
    config.preferences.minimumFontSize = 10;
    //是否支持JavaScript
    config.preferences.javaScriptEnabled = YES;
    //不通过用户交互，是否可以打开窗口
    config.preferences.javaScriptCanOpenWindowsAutomatically = YES;
    //通过JS与webView内容交互
    config.userContentController = [WKUserContentController new];
    // 注入JS对象名称senderModel，当JS通过senderModel来调用时，我们可以在WKScriptMessageHandler代理中接收到
//    [config.userContentController addScriptMessageHandler:self name:@"senderModel"];
    [config.userContentController addScriptMessageHandler:self name:@"abcMap"];

    
    self.webView = [[WKWebView alloc]initWithFrame:self.bounds configuration:config];
    
    //    NSURL *path = [[NSBundle mainBundle] URLForResource:@"WKWebViewText" withExtension:@"html"];
    
//    NSURL *path = [NSURL URLWithString:@"http://103.8.8.10:61528/Template/start/recommend.htm"];
    
    [self addSubview:self.webView];
    
    self.webView.navigationDelegate = self;
    
    self.webView.UIDelegate = self;

}


#pragma mark - WKScriptMessageHandler
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    //这里可以通过name处理多组交互
//    if ([message.name isEqualToString:@"abcMap"]) {
//        //body只支持NSNumber, NSString, NSDate, NSArray,NSDictionary 和 NSNull类型
//        NSLog(@"%@",message.body);
//    }
}

//接收到服务器跳转请求之后调用
-(void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    
}

//开始加载时调用
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}
//当内容开始返回时调用
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
    
}
//页面加载完成之后调用
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"title:%@",webView.title);
    
    [self.webView evaluateJavaScript:_shouYeUrl completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        
        NSLog(@"%@----%@",result, error);
        
    }];

}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation
{
    
    
}

- (void)setUrlStr:(NSString *)urlStr{
    
    _urlStr = urlStr;
    NSURL* url = [NSURL URLWithString:urlStr];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    [self.webView loadRequest:request];
}

- (void)setShouYeUrl:(NSString *)shouYeUrl{
    _shouYeUrl = shouYeUrl;
}

#pragma mark = WKNavigationDelegate
////在发送请求之前，决定是否跳转
//-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
//    decisionHandler(WKNavigationActionPolicyAllow);
//}
////在响应完成时，调用的方法。如果设置为不允许响应，web内容就不会传过来
//
//-(void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
//    decisionHandler(WKNavigationResponsePolicyAllow);
//}

-(WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}


@end
