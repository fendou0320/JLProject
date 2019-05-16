//
//  JRCreditIndexController.h
//  JRCredit
//
//  Created by jiangliang on 2019/3/28.
//

#import "BaseViewController.h"
#import "WebViewJavascriptBridge.h"

NS_ASSUME_NONNULL_BEGIN

@interface JRCreditIndexController : BaseViewController<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *wkWebView;

@property (nonatomic, strong) NSString *urlStr;


@end

NS_ASSUME_NONNULL_END
