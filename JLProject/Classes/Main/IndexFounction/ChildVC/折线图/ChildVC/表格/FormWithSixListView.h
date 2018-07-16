//
//  FormWithSixListView.h
//  JLProject
//
//  Created by UCS on 2017/6/8.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  NS_ENUM(NSInteger, FormWithSixListViewType){
    
    FormWithSixListViewTypeTitle = 0,                          //标题
    FormWithSixListViewTypeContent = 1,                        //内容
};

typedef  NS_ENUM(NSInteger, FormWithSixListViewColorType){
    
    FormWithSixListViewColorTypeOne = 0,                         //深色
    FormWithSixListViewColorTypeTwo = 1,                         //浅色
};

@interface FormWithSixListView : UIView


+ (instancetype)formWithSixListViewWithFrame: (CGRect)frame formWithSixListViewType: (FormWithSixListViewType)type formWithSixListViewColorType: (FormWithSixListViewColorType) colorType;


@end
