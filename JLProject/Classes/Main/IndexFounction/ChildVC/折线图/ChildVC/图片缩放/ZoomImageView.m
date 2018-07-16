//
//  ZoomImageView.m
//  WXWeibo
//
//  Created by JL on 15/10/16.
//  Copyright (c) 2015年 JL. All rights reserved.
//

#import "ZoomImageView.h"

@interface ZoomImageView ()

@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIImageView *fullImgView;
@end

@implementation ZoomImageView

- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self _initTap];
    }
    
    return self;
}

- (void)_initTap{
    
    //等比例显示图片
    self.contentMode = UIViewContentModeScaleAspectFit;
    self.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zoomIn)];
    [self addGestureRecognizer:tap];
}

- (void)_createSubViews{
    
    if (_scrollView == nil) {
        
        _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _scrollView.contentSize = CGSizeMake(kScreenWidth+kScreenWidth, kScreenHeight);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self.window addSubview:_scrollView];
        
        //添加缩小的手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zoomOut)];
        [_scrollView addGestureRecognizer:tap];
        
        CGRect frame = [self convertRect:self.bounds toView:self.window];
        _fullImgView = [[UIImageView alloc] initWithFrame:frame];
        //等比例放大
        _fullImgView.contentMode = UIViewContentModeScaleAspectFit;
        //显示缩略图
        _fullImgView.image = self.image;
        [_scrollView addSubview:_fullImgView];
    }
}

//放大视图
- (void)zoomIn{

    //将要放大
    if ([_delegate respondsToSelector:@selector(zoomImageViewWillZoomIn:)]) {
        [_delegate zoomImageViewWillZoomIn:self];
    }
    //创建视图
    [self _createSubViews];
    
    //隐藏原始图片
    self.hidden = YES;
    
    [UIView animateWithDuration:.3 animations:^{
       
//        _fullImgView.frame = _scrollView.frame;
        _fullImgView.frame = CGRectMake(0, 0, _scrollView.contentSize.width, _scrollView.contentSize.height);
        
    } completion:^(BOOL finished) {
        
        //已经放大
        if ([_delegate respondsToSelector:@selector(zoomImageViewDidZoomIn:)]) {
            [_delegate zoomImageViewDidZoomIn:self];
        }
        //放大完成后,显示黑色背景
        _scrollView.backgroundColor = [UIColor blackColor];
    }];
}



//缩小视图
- (void)zoomOut{
    
    if ([_delegate respondsToSelector:@selector(zoomImageViewWillZoomOut:)]) {
        [_delegate zoomImageViewWillZoomOut:self];
    }
    
    _scrollView.backgroundColor = [UIColor clearColor];
    CGRect frame = [self convertRect:self.bounds toView:self.window];
    [UIView animateWithDuration:.3 animations:^{
        
        _fullImgView.frame = frame;
        
    } completion:^(BOOL finished) {
        
        //已经缩小
        if ([_delegate respondsToSelector:@selector(zoomImageViewDidZoomOut:)]) {
            [_delegate zoomImageViewDidZoomOut:self];
        }

        //移除滚动视图
        [_scrollView removeFromSuperview];
        _scrollView = nil;
        _fullImgView = nil;
        self.hidden = NO;
    }];
    
}






@end
