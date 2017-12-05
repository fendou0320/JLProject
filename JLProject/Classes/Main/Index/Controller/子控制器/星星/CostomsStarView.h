//
//  CostomsStarView.h
//  JLProject
//
//  Created by UCS on 2017/9/10.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBACKGROUND_STAR @"backgroundStar"
#define kFOREGROUND_STAR @"foregroundStar"
#define kNUMBER_OF_STAR  5

@interface CostomsStarView : UIView

@property (nonatomic, readonly) int numberOfStar;

/**
 *  Init TQStarRatingView
 *
 *  @param frame  Rectangles
 *  @param number 星星个数
 *
 *  @return TQStarRatingViewObject
 */
- (id)initWithFrame:(CGRect)frame numberOfStar:(int)number;

/**
 *  设置控件分数
 *
 *  @param score     分数，必须在 0 － 1 之间
 *  @param isAnimate 是否启用动画
 */
- (void)setScore:(float)score withAnimation:(bool)isAnimate;

/**
 *  设置控件分数
 *
 *  @param score      分数，必须在 0 － 1 之间
 *  @param isAnimate  是否启用动画
 *  @param completion 动画完成block
 */
- (void)setScore:(float)score withAnimation:(bool)isAnimate completion:(void (^)(BOOL finished))completion;

@end
