//
//  TemplateOneView.h
//  Dashed
//
//  Created by UCS on 2017/6/2.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  NS_ENUM(NSInteger, TemplateOneViewType){
    
    TemplateOneViewTypeTypeTwo = 2,                          //两栏
    TemplateOneViewTypeTypeThree = 4,                        //三栏
    TemplateOneViewTypeTypeFive = 5                          //五栏
};

typedef  NS_ENUM(NSInteger, TemplateOneViewColorType){
    
    TemplateOneViewColorTypeOne = 0,                         //深色
    TemplateOneViewColorTypeTwo = 1,                         //浅色
};

@interface TemplateOneView : UIView


+ (instancetype)templateOneViewWithFrame: (CGRect)frame TemplateOnetype: (TemplateOneViewType)type templateOneViewColorType: (TemplateOneViewColorType)colorType;


@end
