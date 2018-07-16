//
//  LHY_HeaderView.h
//  JLProject
//
//  Created by UCS on 2017/6/19.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LHY_HeaderView;

// 协议声明
@protocol LHY_HeaderViewDelegate <NSObject>

- (void)lhyHeaderView:(LHY_HeaderView *)lhyHeaderView didSelectedWithTag:(NSInteger)tag;

@end


@interface LHY_HeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) UILabel                *sectionTitleLabel; /**< 组标题 */
@property (nonatomic, strong) UIImageView            *indictorImageView; /**< 指示图片 */

@property (nonatomic, weak) id <LHY_HeaderViewDelegate> delegate;        /**< 代理 */


@end



