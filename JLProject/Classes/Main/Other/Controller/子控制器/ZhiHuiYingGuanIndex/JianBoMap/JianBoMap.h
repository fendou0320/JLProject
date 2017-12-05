//
//  JianBoMap.h
//  UcsProject
//
//  Created by UCS on 2017/7/6.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

typedef void(^JianBoMapBlock)(id data);

typedef void(^JianBoINChinaBlock)(id data);

@protocol JianBoMapDelegate <JSExport>

- (void)callInfo:(id)data;

- (void)back: (id)data;
@end


@interface JianBoMap : UIView<UIWebViewDelegate,JianBoMapDelegate>

@property (nonatomic, strong) JSContext *jsContext;

@property (nonatomic, strong)  UIWebView *webView;

@property (nonatomic, copy) JianBoMapBlock dataBlock;

@property (nonatomic, copy) JianBoINChinaBlock chinaBlock;

//地址
@property (nonatomic, copy) NSString *urlStr;

@property (nonatomic, copy) NSString *jinTianStr;

- (void)tiaoZhuanQianYiTian: (NSString *)tianshu;







@end
