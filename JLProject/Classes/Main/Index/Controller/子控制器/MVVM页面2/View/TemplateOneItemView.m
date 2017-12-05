//
//  TemplateOneItemView.m
//  JLProject
//
//  Created by UCS on 2017/8/23.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "TemplateOneItemView.h"


@implementation TemplateOneItemView

+ (instancetype)IndexBaseItemView: (CGRect)frame{

    TemplateOneItemView *view = [[self alloc] initWithFrame:frame];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatSubView];
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)creatSubView{

    _bigImageView = [[UIImageView alloc]init];
    [_bigImageView setImage:[UIImage imageNamed:@"456x256--首页.png"]];
    [self addSubview:_bigImageView];
    [_bigImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self).with.offset(SIZE_IPHONE6PX(-65));
    }];
    
    _imgButtomLabel = [[UILabel alloc]init];
    _imgButtomLabel.text = @"视频标题视频标题视频标题视频标题视频标题视频标题视频标题";
    _imgButtomLabel.font = [UIFont systemFontOfSize:12];
    _imgButtomLabel.textAlignment = NSTextAlignmentLeft;
    _imgButtomLabel.textColor = [UIColor blackColor];
    [self addSubview:self.imgButtomLabel];
    [_imgButtomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-6);
        make.left.equalTo(self).with.offset(6);
        make.bottom.equalTo(_imgButtomLabel).with.offset(-6);
        make.height.mas_equalTo(12);
    }];
}

- (void)tap:(UITapGestureRecognizer *)tap{
    if (self.clickBlock) {
        self.clickBlock(tap.view);
    }
}

- (void)reloadDate{

    [_bigImageView setImage:[UIImage imageNamed:@"456x256--首页.png"]];
    _imgButtomLabel.text = @"视频标题视频标题视频标题视频标题视频标题视频标题视频标题";
}


@end
