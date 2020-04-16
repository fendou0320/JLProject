//
//  OpenPDFController.m
//  JLProject
//
//  Created by jiangliang on 2019/5/12.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "OpenPDFController.h"

@interface OpenPDFController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation OpenPDFController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 600)];
//    [self.view addSubview:webView];
//    self.webView = webView;
//
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"PrivacyPolicy.pdf" ofType:nil];
//    NSURL *url = [NSURL fileURLWithPath:path];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [webView loadRequest:request];
    
    UILongPressGestureRecognizer *menuGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(menu:)];
        menuGesture.minimumPressDuration = 0.2;
    [self.view addGestureRecognizer:menuGesture];
    
}

- (void)menu:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        
//        UIMenuController *menu = [UIMenuController sharedMenuController];
//        UIMenuItem *itemCall = [[UIMenuItem alloc] initWithTitle:@"Call" action:@selector(call:)];
//        UIMenuItem *itemMessage = [[UIMenuItem alloc] initWithTitle:@"Message" action:@selector(message:)];
//        [menu setMenuItems: @[itemCall, itemMessage]];
//
////        [menu setTargetRect:self.webView.bounds inView:self.webView];
////        [menu setMenuVisible:YES animated:YES];
////        [[UIMenuController sharedMenuController] update];
//
//        NSLog(@"点击了---哈哈");
        
            //2.设置UIMenuController
            UIMenuController * menu = [UIMenuController sharedMenuController];
            //当长按label的时候，这个方法会不断调用，menu就会出现一闪一闪不断显示，需要在此处进行判断
            if (menu.isMenuVisible)return;
            //自定义 UIMenuController
            UIMenuItem * item1 = [[UIMenuItem alloc]initWithTitle:@"剪切" action:@selector(call:)];
            UIMenuItem * item2 = [[UIMenuItem alloc]initWithTitle:@"粘贴" action:@selector(message:)];
            menu.menuItems = @[item1,item2];
            [menu setTargetRect:self.view.bounds inView:self.view];
            [menu setMenuVisible:YES animated:YES];
        
        
        
    }
}

#pragma mark - 对控件权限进行设置
/**
 *  设置label可以成为第一响应者
 *
 *  @注意：不是每个控件都有资格成为第一响应者
 */
- (BOOL)canBecomeFirstResponder
{
    return YES;
}
///**
// *  设置label能够执行那些具体操作
// *
// *  @param action 具体操作
// *
// *  @return YES:支持该操作
// */
//- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
//{
////    NSLog(@"%@",NSStringFromSelector(action));
//
//    if(action == @selector(cut:) || action == @selector(copy:) || action == @selector(myCut:)|| action == @selector(myPaste:)) return YES;
//    return NO;
//}


- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(call:)) {
        return YES;
    }else if (action == @selector(message:)){
        return YES;
    }
    return NO;
//    return YES;
}

- (void)call:(id)sender {
    
    UIPasteboard *paste = [UIPasteboard generalPasteboard];
    NSLog(@"%@", paste.string);
}

- (void)message:(id)sender {
    
    UIPasteboard *paste = [UIPasteboard generalPasteboard];
    NSLog(@"%@", paste.string);
}

@end
