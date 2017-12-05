//
//  LHY_HeaderView.m
//  JLProject
//
//  Created by UCS on 2017/6/19.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "LHY_HeaderView.h"

@implementation LHY_HeaderView

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor clearColor];
        self.layer.borderWidth = 0.34;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        // 加载控件
        [self.contentView addSubview:self.indictorImageView];
        [self.contentView addSubview:self.sectionTitleLabel];
        
        // 添加点击手势
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTapGesture:)];
        [self addGestureRecognizer:tapGesture];
        
    }
    return self;
}



#pragma mark *** Gestures ***
- (void)respondsToTapGesture:(UITapGestureRecognizer *)gesture {
    // 判断代理是否存并且遵守协议，如果满足条件，则让代理执行协议方法，并且将对应组以及tag值传递给代理；
    if (_delegate && [_delegate conformsToProtocol:@protocol(LHY_HeaderViewDelegate)]) {
        [_delegate lhyHeaderView:self didSelectedWithTag:self.tag];
    }
}

#pragma mark *** Getters ***
- (UIImageView *)indictorImageView {
    if (!_indictorImageView) {
        _indictorImageView = [[UIImageView alloc] init];
        _indictorImageView.bounds = CGRectMake(0, 0, 20, 20);
        _indictorImageView.center = CGPointMake(15, 22);
    }
    return _indictorImageView;
}

- (UILabel *)sectionTitleLabel {
    if (!_sectionTitleLabel) {
        _sectionTitleLabel = [[UILabel alloc] init];
        _sectionTitleLabel.bounds = CGRectMake(0, 0, 200, 30);
        _sectionTitleLabel.center = CGPointMake(CGRectGetMaxX(self.indictorImageView.frame) + CGRectGetMidX(_sectionTitleLabel.bounds) + 10, 22);
        _sectionTitleLabel.font = [UIFont boldSystemFontOfSize:18];
    }
    return _sectionTitleLabel;
}


@end
