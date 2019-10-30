//
//  JRRefreshView.m
//  JLProject
//
//  Created by jiangliang on 2019/7/11.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "JRRefreshView.h"

@interface JRRefreshView ()

//@property (nonatomic, strong)CALayer *roundMaskLayer;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation JRRefreshView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
       
        self.backgroundColor = RandomColor;
        
        [self addSubview: self.imageView];
        self.imageView.backgroundColor = RandomColor;
        
        
    }
    return self;
}

- (void)refreshView{
    
}

/**
 下拉释放后网络请求时动画
 */
- (void)startAnimation{
    
}

/**
 根据百分比设置立方体对应的状态
 用于下拉过程中的动画
 
 @param percent 百分比[0-1]
 */
- (void)refreshWithPercent:(CGFloat)percent{
    
}

/**
 请求完网络后停止动画
 */
- (void)stopAnimation{
    
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake((kScreenWidth-30)/2, 10, 30, 30);
        _imageView.animationImages = @[[UIImage imageNamed:@"27"],
                                       [UIImage imageNamed:@"28"],
                                       [UIImage imageNamed:@"29"],
                                       [UIImage imageNamed:@"30"],
                                       [UIImage imageNamed:@"31"],
                                       [UIImage imageNamed:@"32"],
                                       [UIImage imageNamed:@"33"],
                                       [UIImage imageNamed:@"34"],
                                       [UIImage imageNamed:@"35"],
                                       [UIImage imageNamed:@"36"],
                                       [UIImage imageNamed:@"37"],
                                       [UIImage imageNamed:@"38"],
                                       [UIImage imageNamed:@"39"],
                                       [UIImage imageNamed:@"40"],
                                       ];
//        _imageView.image = [UIImage imageNamed:@"40"];
//        _imageView.animationDuration =30.0;
    }
    return _imageView;
}

//- (void)setUpLayer{
//
//
//
//}
//
//- (CALayer *)roundMaskLayer {
//    if (!_roundMaskLayer) {
//        _roundMaskLayer = [CALayer layer];
//        _roundMaskLayer.backgroundColor = [UIColor whiteColor].CGColor;
//    }
//    return _roundMaskLayer;
//}


@end
