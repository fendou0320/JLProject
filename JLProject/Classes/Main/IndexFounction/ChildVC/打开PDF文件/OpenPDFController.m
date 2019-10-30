//
//  OpenPDFController.m
//  JLProject
//
//  Created by jiangliang on 2019/5/12.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "OpenPDFController.h"

@interface OpenPDFController ()

@end

@implementation OpenPDFController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 600)];
    [self.view addSubview:webView];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"PrivacyPolicy.pdf" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    
}



@end
