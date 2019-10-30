//
//  SecurityOpenAccountVC.m
//  JLProject
//
//  Created by jiangliang on 2019/6/28.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "SecurityOpenAccountVC.h"

@implementation SecurityOpenAccountVC

- (void)viewDidLoad{
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = webView;
    NSURL *url = [NSURL URLWithString:@"https://soft.thinkive.com:458/m/open/views/account/index.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}

@end
