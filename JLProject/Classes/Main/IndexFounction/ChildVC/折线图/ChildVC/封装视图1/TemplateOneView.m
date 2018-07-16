//
//  TemplateOneView.m
//  Dashed
//
//  Created by UCS on 2017/6/2.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "TemplateOneView.h"

#define TemplateOneViewTitleFont 12.0f
#define TemplateOneViewTitleWidth 50

@interface TemplateOneView ()
@property (nonatomic, strong) UILabel *oneLabel;
@property (nonatomic, strong) UILabel *twoLabel;
@property (nonatomic, strong) UILabel *threeLabel;
@property (nonatomic, strong) UILabel *fourLabel;
@property (nonatomic, strong) UILabel *fiveLabel;
@end

@implementation TemplateOneView

+ (instancetype)templateOneViewWithFrame: (CGRect)frame TemplateOnetype: (TemplateOneViewType)type templateOneViewColorType: (TemplateOneViewColorType)colorType;
{
    TemplateOneView *view = [[TemplateOneView alloc] initWithFrame:frame TemplateOnetype:type];
    if (colorType == TemplateOneViewColorTypeOne) {
        view.backgroundColor = [UIColor grayColor];
    }else{
        view.backgroundColor = [UIColor whiteColor];
    }
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame TemplateOnetype: (TemplateOneViewType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        
        if (type == TemplateOneViewTypeTypeTwo) {
          
            [self creatSubviewTypeTwo];
        }else if (type == TemplateOneViewTypeTypeThree){
        
            [self creatSubviewTypeThree];
        }else if (type == TemplateOneViewTypeTypeFive){
        
            [self creatSubviewTypeFive];
        }
    }
    return self;
}

- (void)creatSubviewTypeTwo{

    weakedSelf
    self.oneLabel = [[UILabel alloc] init];
    [self creatLabel:self.oneLabel];
    self.oneLabel.text = @"日期";
    [self addSubview:self.oneLabel];
    [self.oneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf.mas_left).with.offset(40/2);
        make.width.mas_equalTo(TemplateOneViewTitleWidth);
//        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    self.twoLabel = [[UILabel alloc] init];
    [self creatLabel:self.twoLabel];
    self.twoLabel.text = @"票房(人次)";
    [self addSubview:self.twoLabel];
    [self.twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.right.equalTo(weakSelf.mas_right).with.offset(-40/2);
        make.width.mas_equalTo(TemplateOneViewTitleWidth);
//        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
}

- (void)creatSubviewTypeThree{
    
    weakedSelf
    self.oneLabel = [[UILabel alloc] init];
    [self creatLabel:self.oneLabel];
    self.oneLabel.text = @"项目明细";
    [self addSubview:self.oneLabel];
    [self.oneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf.mas_left).with.offset(40/2);
        make.width.mas_equalTo(TemplateOneViewTitleWidth);
//        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    self.twoLabel = [[UILabel alloc] init];
    [self creatLabel:self.twoLabel];
    self.twoLabel.text = @"票房(人次)";
    [self addSubview:self.twoLabel];
    [self.twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.centerX.equalTo(weakSelf);
        make.width.mas_equalTo(TemplateOneViewTitleWidth);
//        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
 
    self.threeLabel = [[UILabel alloc] init];
    [self creatLabel:self.threeLabel];
    self.threeLabel.text = @"收入占比";
    [self addSubview:self.threeLabel];
    [self.threeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.right.equalTo(weakSelf.mas_right).with.offset(-40/2);
        make.width.mas_equalTo(TemplateOneViewTitleWidth);
//        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];

}

- (void)creatSubviewTypeFive{
    
    weakedSelf
    self.oneLabel = [[UILabel alloc] init];
    [self creatLabel:self.oneLabel];
    self.oneLabel.text = @"日期";
    [self addSubview:self.oneLabel];
    [self.oneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf.mas_left).with.offset(40/2);
        make.width.mas_equalTo(TemplateOneViewTitleWidth);
//        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    self.twoLabel = [[UILabel alloc] init];
    [self creatLabel:self.twoLabel];
    self.twoLabel.text = @"最佳";
    [self addSubview:self.twoLabel];
    [self.twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf.oneLabel.mas_right).with.offset(40/2);
        make.width.mas_equalTo(TemplateOneViewTitleWidth);
//        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    self.threeLabel = [[UILabel alloc] init];
    [self creatLabel:self.threeLabel];
    self.threeLabel.text = @"全国";
    [self addSubview:self.threeLabel];
    [self.threeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.centerX.equalTo(weakSelf);
        make.width.mas_equalTo(TemplateOneViewTitleWidth);
//        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    
    self.fiveLabel = [[UILabel alloc] init];
    [self creatLabel:self.fiveLabel];
    self.fiveLabel.text = @"院线";
    [self addSubview:self.fiveLabel];
    [self.fiveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.right.equalTo(weakSelf.mas_right).with.offset(-40/2);
        make.width.mas_equalTo(TemplateOneViewTitleWidth);
//        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    self.fourLabel = [[UILabel alloc] init];
    [self creatLabel:self.fourLabel];
    self.fourLabel.text = @"当前院线";
    [self addSubview:self.fourLabel];
    [self.fourLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.right.equalTo(weakSelf.fiveLabel.mas_left).with.offset(-40/2);
        make.width.mas_equalTo(TemplateOneViewTitleWidth);
//        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
}

#pragma mark - label处理
- (UILabel *)creatLabel: (UILabel *)label{

    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:TemplateOneViewTitleFont];
//    label.backgroundColor = [UIColor greenColor];
    [label sizeToFit];
    return label;
}


@end
