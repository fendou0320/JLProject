//
//  JLSecondRreshHeader.m
//  JLProject
//
//  Created by jiangliang on 2019/7/17.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "JLSecondRreshHeader.h"

@implementation JLSecondRreshHeader

#pragma mark - 重写父类的方法
- (void)prepare{
    [super prepare];
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=22; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", i]];
        [idleImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 22; i<=45; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    
    self.height = 60;
    //隐藏时间
    self.lastUpdatedTimeLabel.hidden = YES;
    //隐藏状态
    self.stateLabel.hidden = YES;
}



@end
