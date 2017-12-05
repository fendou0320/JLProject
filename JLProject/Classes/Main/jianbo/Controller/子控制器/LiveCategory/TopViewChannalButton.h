//
//  TopViewChannalButton.h
//  newInterface
//
//  Created by wangjiangliang on 16/5/11.
//  Copyright © 2016年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "CategoryListModel.h"

@interface TopViewChannalButton : UIButton

@property (nonatomic,assign) int index;

+ (instancetype)topViewChannalButtonWithFrame: (CGRect)frame;
/**
 *  频道数据模型
 */
//@property (nonatomic,strong) CategoryListModel *categoryModel;

@end
