//
//  MarketChartViewController.m
//  JLProject
//
//  Created by jiangliang on 2019/1/31.
//  Copyright © 2019年 wangjiangliang. All rights reserved.
//

#import "MarketChartViewController.h"
#import "AppDelegate.h"
#import <WebKit/WebKit.h>

@interface MarketChartViewController ()<WKUIDelegate, WKNavigationDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) UIImageView *errorView;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@end

@implementation MarketChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.wkWebView.frame = CGRectMake(0, 0, kScreenWidth, 300);
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://money.sina.cn/h5chart/appchartistock.html?theme=black&direction=vertical&symbol=sh601857"]]];
    
    //点击手势
    self.tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapChange:)];
    self.tap.numberOfTapsRequired = 1;
    self.tap.delegate=self;
    [self.wkWebView addGestureRecognizer:self.tap];
//    [self.view addGestureRecognizer:self.tap];
    
    [self.view addSubview:self.wkWebView];
    
}

//点击
-(void)doTapChange:(UITapGestureRecognizer *)sender{

    [self changeFrame];
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (gestureRecognizer == self.tap)
    {
        return YES;
    }
    return NO;
}

#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    
}

// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    
}

#pragma mark - lazy load

- (WKWebView *)wkWebView{
    if (!_wkWebView) {
        _wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) configuration:[self.class webViewConfig]];
        _wkWebView.backgroundColor = [UIColor redColor];
        _wkWebView.scrollView.showsVerticalScrollIndicator = NO;
        _wkWebView.scrollView.showsHorizontalScrollIndicator = NO;
        _wkWebView.navigationDelegate = self;
        _wkWebView.opaque = NO;
        _wkWebView.scrollView.bounces = NO;
    }
    return _wkWebView;
}

+(WKWebViewConfiguration *)webViewConfig{
    WKUserContentController *userContentController = WKUserContentController.new;
    
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    
    NSMutableString *jsString = [NSMutableString stringWithString:@""];
    for (NSHTTPCookie *cookie in cookies) {
        [jsString appendString:[NSString stringWithFormat:@"document.cookie='%@';", [self javascriptStringWithCookie:cookie]]];
    }
    WKUserScript *cookieScript = [[WKUserScript alloc] initWithSource:jsString  injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    [userContentController addUserScript:cookieScript];
    WKWebViewConfiguration* webViewConfig = WKWebViewConfiguration.new;
    webViewConfig.userContentController = userContentController;
    static WKProcessPool *processPool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        processPool = [WKProcessPool new];
    });
    webViewConfig.processPool = processPool;
    return webViewConfig;
}

+(NSString *)javascriptStringWithCookie:(NSHTTPCookie*)cookie {
    NSString *string = [NSString stringWithFormat:@"%@=%@;domain=%@;path=%@;",
                        cookie.name,
                        cookie.value,
                        cookie.domain,
                        cookie.path ?: @"/"];
    
    if (cookie.secure) {
        string = [string stringByAppendingString:@"secure=true"];
    }
    return string;
}

// 允许自动旋转
-(BOOL)shouldAutorotate{
    return YES;
}
// 横屏时是否将状态栏隐藏
-(BOOL)prefersStatusBarHidden{
    return NO;
}
-(void)changeFrame{
    
    if (YES) {
        [self forceOrientationLandscapeWith:self];
    }else{
        [self forceOrientationPortraitWith:self];
    }
    
    self.wkWebView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);

}
// 横屏 home键在右边
-(void)forceOrientationLandscapeWith:(UIViewController *)VC{
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForcePortrait=NO;
    appdelegate.isForceLandscape=YES;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:VC.view.window];
    //强制翻转屏幕，Home键在右边。
    [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
    //刷新
    [UIViewController attemptRotationToDeviceOrientation];
}

// 竖屏
- (void)forceOrientationPortraitWith:(UIViewController *)VC{
    
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForcePortrait=YES;
    appdelegate.isForceLandscape=NO;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:VC.view.window];
    //强制翻转屏幕
    [[UIDevice currentDevice] setValue:@(UIDeviceOrientationPortrait) forKey:@"orientation"];
    //刷新
    [UIViewController attemptRotationToDeviceOrientation];
}

@end
