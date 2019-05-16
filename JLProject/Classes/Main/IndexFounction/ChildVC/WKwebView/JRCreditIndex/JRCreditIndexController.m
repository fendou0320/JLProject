//
//  JRCreditIndexController.m
//  JRCredit
//
//  Created by jiangliang on 2019/3/28.
//

#import "JRCreditIndexController.h"

@interface JRCreditIndexController ()

@property(nonatomic, strong) WebViewJavascriptBridge *bridge;

@property (nonatomic, strong) UIButton *button;

@end

@implementation JRCreditIndexController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.urlStr = @"http://10.238.252.87:8081/borrowMoneyPage?H5source=sinaFinance";//http://quyong-test24.wejoydata.com
    self.wkWebView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-kTabBarHeight-kNavgationBarHeight);
    [WebViewJavascriptBridge enableLogging];
    _bridge = [WebViewJavascriptBridge bridgeForWebView:self.wkWebView];
    [_bridge setWebViewDelegate:self];

    weakedSelf
    [_bridge registerHandler:@"jsCallObjcAndResponse" handler:^(id data, WVJBResponseCallback responseCallback) {
        //对应的模块名
        NSString *moduleName = [data objectForKey:@"moduleName"];
        //对应的功能名
        NSString *functionName = [data objectForKey:@"functionName"];
        //对应的参数
        NSString *paramsDic = [data objectForKey:@"params"];
        //跳转到对应的界面
        [weakSelf handleJumpWithModuleName:moduleName functionName:functionName params:paramsDic callBack:responseCallback];
    }];
    
    [self loadRequest];
    
    
    self.button = [[UIButton alloc] init];
    [self.button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
}

- (void)loadRequest{
    if (self.urlStr && self.urlStr.length > 0) {
        NSURL *url = [NSURL URLWithString:self.urlStr];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20.f];
        [request setHTTPShouldHandleCookies:NO];
        [self.wkWebView loadRequest:request];
    }
}

// h5和原生跳转交互处理
- (void)handleJumpWithModuleName:(NSString *)moduleName functionName: (NSString *)functionName params: (NSDictionary *)params callBack: (WVJBResponseCallback) responseCallback{
//    //调动原生
//    if ([moduleName isEqualToString:@"account"]) {
//        if ([functionName isEqualToString:@"login"]) {
//            //跳转客户端登录页
////            [self.navigationController pushViewController:[[CTMediator sharedInstance] jr_Account_AppLoginIndex_viewController] animated:YES];
//        }
//    }else if ([moduleName isEqualToString:@"stockDetail"]){
////        if ([functionName isEqualToString:@"open"]) {
////            //打开详情页
////            JRStockModel *stockMode = [[JRStockModel alloc] init];
////            if ([[params allKeys] containsObject:@"name"]) {
////                stockMode.name = [params objectForKey:@"name"];
////            }
////            if ([[params allKeys] containsObject:@"symbol"]) {
////                stockMode.symbol = [params objectForKey:@"symbol"];
////            }
////            if ([[params allKeys] containsObject:@"symbol_type"]) {
////                stockMode.symbol_type = [params objectForKey:@"symbol_type"];
////            }
////            if ([[params allKeys] containsObject:@"market"]) {
////                stockMode.market = [params objectForKey:@"market"];
////            }
////            UIViewController *vc = [[CTMediator sharedInstance]jr_stockdetail_viewController:stockMode];
////            [self.navigationController pushViewController:vc animated:YES];
////        }
//    }
}


- (UIWebView *)wkWebView{
    if (!_wkWebView) {
        CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
        CGFloat statusBarHeight = MIN(statusBarSize.width, statusBarSize.height);
        CGFloat navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
        CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.view.bounds.size.height-navigationBarHeight-statusBarHeight);
        _wkWebView = [[UIWebView alloc] initWithFrame:frame];
        _wkWebView.scrollView.bounces = YES;
        _wkWebView.opaque = NO;
        _wkWebView.delegate = self;
        _wkWebView.backgroundColor = [UIColor whiteColor];
        if (@available(iOS 11.0, *)) {
            //去掉安全区域，让h5自己兼容iphoneX
            _wkWebView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [self.view addSubview:_wkWebView];
    }
    return _wkWebView;
}

@end
