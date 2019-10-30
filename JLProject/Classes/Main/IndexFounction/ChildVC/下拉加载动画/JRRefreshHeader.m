//
//  JRRefreshHeader.m
//  JLProject
//
//  Created by jiangliang on 2019/7/11.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "JRRefreshHeader.h"
#import "JRRefreshView.h"

@interface JRRefreshHeader()

@property (nonatomic, strong) JRRefreshView *animationView;

@end


@implementation JRRefreshHeader

#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    self.mj_h = 50;
    [self addSubview:self.animationView];
}


- (void)setState:(MJRefreshState)state
{
    // 根据状态做事情
    if (state == MJRefreshStateIdle) {
        if (self.state == MJRefreshStateRefreshing) {
            [self.animationView stopAnimation];
            __weak typeof(self) weakSelf = self;
            [self.animationView setAnimiationComplete:^{
                [weakSelf setSuperState:state];
            }];
        } else {
            MJRefreshCheckState
        }
    } else if (state == MJRefreshStatePulling) {
        MJRefreshCheckState
    } else if (state == MJRefreshStateRefreshing) {
        [self.animationView startAnimation];
        MJRefreshCheckState
    }else {
        MJRefreshCheckState
    }
}

- (void)setSuperState:(MJRefreshState)state
{
    MJRefreshState oldState = self.state;
    if (state != oldState){
        [super setState:state];
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    if(self.state == MJRefreshStateIdle && self.scrollView.panGestureRecognizer.state == UIGestureRecognizerStateChanged){
        [self.animationView refreshWithPercent:pullingPercent];
    }
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    [self.animationView setFrame:CGRectMake(0, 0, self.mj_w, self.mj_h)];
    [self.animationView refreshView];
}

#pragma lazy methods
- (JRRefreshView *)animationView
{
    if(!_animationView){
        _animationView = [[JRRefreshView alloc] initWithFrame:CGRectMake(0, 0, self.mj_w, self.mj_h)];
    }
    return _animationView;
}


@end
