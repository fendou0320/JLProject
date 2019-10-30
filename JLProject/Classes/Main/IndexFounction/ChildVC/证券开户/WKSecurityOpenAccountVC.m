//
//  WKSecurityOpenAccountVC.m
//  JLProject
//
//  Created by jiangliang on 2019/6/28.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "WKSecurityOpenAccountVC.h"
#import <WebKit/WebKit.h>

@interface WKSecurityOpenAccountVC ()

@end

@implementation WKSecurityOpenAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    NSMutableURLRequest *request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://soft.thinkive.com:458/m/open/views/account/index.html"]];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
}


@end
