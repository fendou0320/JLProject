//
//  TopView.h
//  newInterface
//
//  Created by wangjiangliang on 16/5/11.
//  Copyright © 2016年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopViewChannalButton.h"

@class TopView;

@protocol TopViewDelegate <NSObject>

@optional
/**
 *  点击频道按钮
 *
 *  @param topView topView
 *  @param button  button
 */
- (void)topView:(TopView *)topView didClickChannalButton:(TopViewChannalButton *)button;

@end

@interface TopView : UIView

@property (nonatomic,weak) id<TopViewDelegate> topViewDelegate;

/**
 *  快速初始化方法
 *
 *  @param frame    frame
 *  @param delegate topViewdelegate

 *
 *  @return 对象
 */
+(instancetype)topViewWithFrame:(CGRect)frame delegate:(id<TopViewDelegate>) delegate;

/**
 *  数据源
 */
@property (nonatomic,strong) NSArray *modelArray;

///**
// *
// *
// *  @param modelArray modelArray
// *  @param index      之前选中的index
// */
//- (void)setModelArray:(NSArray *)modelArray withIndex:(NSInteger)index;


///**
// *  设置导航栏点击第几个按钮
// *
// *  @param index index
// */
//- (void)topViewWithBtn: (NSInteger)index;

@end
