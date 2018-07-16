//
//  TemplateOneItemView.h
//  JLProject
//
//  Created by UCS on 2017/8/23.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TemplateOneItemViewClickBlock)(id sender);

@interface TemplateOneItemView : UIView
/**
 *  大图片
 */
@property (nonatomic, strong) UIImageView *bigImageView;
/**
 *  点击事件block
 */
@property (nonatomic,copy) TemplateOneItemViewClickBlock clickBlock;

/**
 *  大图片底部的文字
 */
@property (nonatomic, strong) UILabel *imgButtomLabel;

/**
 *  初始化方法
 *
 *  @param frame frame
 *
 *  @return 对象
 */
+ (instancetype)IndexBaseItemView: (CGRect)frame;


- (void)reloadDate;


@end
