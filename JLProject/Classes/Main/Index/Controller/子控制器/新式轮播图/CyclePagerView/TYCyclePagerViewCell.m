//
//  TYCyclePagerViewCell.m
//  TYCyclePagerViewDemo
//
//  Created by tany on 2017/6/14.
//  Copyright © 2017年 tany. All rights reserved.
//

#import "TYCyclePagerViewCell.h"

@interface TYCyclePagerViewCell ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation TYCyclePagerViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addImage];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor clearColor];
        [self addImage];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

- (void)addImage{

    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    [self addSubview:self.imageView];
}

- (void)setImageString:(NSString *)imageString{

    _imageString = imageString;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageString] placeholderImage:nil];
}


@end
