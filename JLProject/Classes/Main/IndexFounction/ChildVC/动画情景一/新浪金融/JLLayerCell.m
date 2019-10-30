//
//  JLLayerCell.m
//  JLProject
//
//  Created by jiangliang on 2019/6/13.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "JLLayerCell.h"

@interface JLLayerCell ()

@property (nonatomic, strong) CALayer *buttomLayer;

@end

@implementation JLLayerCell

- (void)layoutSubviews{
    
    if (!_buttomLayer) {
        self.contentView.backgroundColor = RandomColor;
        [self.contentView.layer insertSublayer:self.buttomLayer atIndex:0];
    }
}


- (CALayer *)buttomLayer{
    if (!_buttomLayer) {
        _buttomLayer = [CALayer layer];
        CGRect subFrame = self.frame;
        _buttomLayer.frame = CGRectMake(10, 0, kScreenWidth-20, subFrame.size.height);
        _buttomLayer.cornerRadius = 8.f;
        _buttomLayer.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:1].CGColor;
        _buttomLayer.masksToBounds = NO;
        _buttomLayer.shadowColor = [UIColor greenColor].CGColor;
        _buttomLayer.shadowOpacity = 0.8;
        _buttomLayer.shadowRadius = 10.f;
        _buttomLayer.shadowOffset = CGSizeMake(0,0);
    }
    return _buttomLayer;
}

@end
