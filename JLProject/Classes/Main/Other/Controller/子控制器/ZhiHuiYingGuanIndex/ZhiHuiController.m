//
//  ZhiHuiController.m
//  JLProject
//
//  Created by UCS on 2017/7/22.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "ZhiHuiController.h"
#import "TemplateOneWebView.h"

#import "JianBoMap.h"


@interface ZhiHuiController ()

@end

@implementation ZhiHuiController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    TemplateOneWebView *indexMap = [[TemplateOneWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, SIZE_IPHONE6HeightPX(926))];
//    [self.view addSubview:indexMap];
//    indexMap.shouYeUrl = [NSString stringWithFormat:@"painBall('4')"];
////    indexMap.urlStr = @"http://103.8.8.10:61528/start-app.htm";
////    indexMap.urlStr = @"https://github.com/";
//    
//    indexMap.urlStr = @"10.10.0.140";
//    
//
////    NSURL *path = [NSURL URLWithString:@"http://103.8.8.10:61528/start-app.htm"];
//    
////    [self.webView loadRequest:[NSURLRequest requestWithURL:path]];
    
    JianBoMap *webview = [[JianBoMap alloc] initWithFrame:CGRectMake(0, 120, kScreenWidth, SIZE_IPHONE6HeightPX(820))];
    [self.view addSubview:webview];
    
    webview.jinTianStr = [NSString stringWithFormat:@"consumer('4','2017-07-25')"];
    
//    webview.urlStr = @"http://103.8.8.10:61523/map/world.html";//192.168.30.43:83/map/World.html

    webview.urlStr = @"http://192.168.30.43:83/map/World.html";//192.168.30.43:83/map/World.html

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
