//
//  TemplateOneWebView.h
//  JLProject
//
//  Created by UCS on 2017/7/22.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^IndexBlock)(id data);

@interface TemplateOneWebView : UIView

@property (nonatomic, copy) NSString *shouYeUrl;

@property (nonatomic, copy) NSString *urlStr;

@property (nonatomic, copy) IndexBlock dataBlock;


@end
