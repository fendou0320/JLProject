//
//  FormWithSixListView.m
//  JLProject
//
//  Created by UCS on 2017/6/8.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "FormWithSixListView.h"

#define TemplateOneViewTitleFont 12.0f
#define FormWithSixListViewTitleWidthOne 100/2
#define FormWithSixListViewTitleWidthTwo 52/2


@interface FormWithSixListView ()
@property (nonatomic, strong) UILabel *oneLabel;
@property (nonatomic, strong) UILabel *twoLabel;
@property (nonatomic, strong) UILabel *threeLabel;
@property (nonatomic, strong) UILabel *fourLabel;
@property (nonatomic, strong) UILabel *fiveLabel;
@property (nonatomic, strong) UILabel *sixLabel;
@end

@implementation FormWithSixListView

+ (instancetype)formWithSixListViewWithFrame: (CGRect)frame formWithSixListViewType: (FormWithSixListViewType)type formWithSixListViewColorType: (FormWithSixListViewColorType) colorType
{
    FormWithSixListView *view = [[FormWithSixListView alloc] initWithFrame:frame formWithSixListViewType:type];
    
    if (colorType == FormWithSixListViewColorTypeOne) {
        view.backgroundColor = [UIColor grayColor];
    }else{
        view.backgroundColor = [UIColor whiteColor];
    }
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame formWithSixListViewType: (FormWithSixListViewType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        
        if (type == FormWithSixListViewTypeTitle) {
            
            [self creatSubviewTypeTitle];
            
        }else if (type == FormWithSixListViewTypeContent){
            
            [self creatSubviewTypeContent];
        }
     }
    return self;
}


- (void)creatSubviewTypeTitle{
    
    self.oneLabel = [[UILabel alloc] init];
    [self creatLabel:self.oneLabel];
    self.oneLabel.text = @"影片名称";
    self.oneLabel.numberOfLines = 1;
    [self addSubview:self.oneLabel];
    [self.oneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.mas_left).with.offset(74/2);
        make.width.mas_equalTo(FormWithSixListViewTitleWidthOne);
        //        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    self.twoLabel = [[UILabel alloc] init];
    [self creatLabel:self.twoLabel];
    self.twoLabel.text = @"放映日期";
    self.twoLabel.numberOfLines = 1;
    [self addSubview:self.twoLabel];
    [self.twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.oneLabel.mas_right).with.offset(92/2);
        make.width.mas_equalTo(FormWithSixListViewTitleWidthOne);
        //        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    self.threeLabel = [[UILabel alloc] init];
    [self creatLabel:self.threeLabel];
    self.threeLabel.text = @"已售票数";
    self.threeLabel.numberOfLines = 2;
    [self addSubview:self.threeLabel];
    [self.threeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.twoLabel.mas_right).with.offset(55/2);
        make.width.mas_equalTo(FormWithSixListViewTitleWidthTwo);
        //        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    self.fourLabel = [[UILabel alloc] init];
    [self creatLabel:self.fourLabel];
    self.fourLabel.text = @"观影人数";
    self.fourLabel.numberOfLines = 2;
    [self addSubview:self.fourLabel];
    [self.fourLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.threeLabel.mas_right).with.offset(32/2);
        make.width.mas_equalTo(FormWithSixListViewTitleWidthTwo);
        //        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    self.fiveLabel = [[UILabel alloc] init];
    [self creatLabel:self.fiveLabel];
    self.fiveLabel.text = @"差异";
    [self addSubview:self.fiveLabel];
    [self.fiveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.fourLabel.mas_right).with.offset(32/2);
        make.width.mas_equalTo(FormWithSixListViewTitleWidthTwo);
        //        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];

    self.sixLabel = [[UILabel alloc] init];
    [self creatLabel:self.sixLabel];
    self.sixLabel.text = @"操作";
    [self addSubview:self.sixLabel];
    [self.sixLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.fiveLabel.mas_right).with.offset(32/2);
        make.width.mas_equalTo(FormWithSixListViewTitleWidthTwo);
        //        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];

}

- (void)creatSubviewTypeContent{
    
    self.oneLabel = [[UILabel alloc] init];
    [self creatLabel:self.oneLabel];
    self.oneLabel.text = @"影片名称影片名称影片名称影片名称影片名称影片名称";
    self.oneLabel.numberOfLines = 2;
    [self addSubview:self.oneLabel];
    [self.oneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.mas_left).with.offset(20/2);
        make.width.mas_equalTo(214/2);
        //        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    self.twoLabel = [[UILabel alloc] init];
    [self creatLabel:self.twoLabel];
    self.twoLabel.text = @"放映日期影片名称影片名称影片名称影片名称";
    self.twoLabel.numberOfLines = 2;
    [self addSubview:self.twoLabel];
    [self.twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.oneLabel.mas_right).with.offset(28/2);
        make.width.mas_equalTo(116/2);
        //        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    self.threeLabel = [[UILabel alloc] init];
    [self creatLabel:self.threeLabel];
    self.threeLabel.text = @"11";
    [self addSubview:self.threeLabel];
    [self.threeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.twoLabel.mas_right).with.offset(45/2);
        make.width.mas_equalTo(FormWithSixListViewTitleWidthTwo);
        //        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    self.fourLabel = [[UILabel alloc] init];
    [self creatLabel:self.fourLabel];
    self.fourLabel.text = @"22";
    [self addSubview:self.fourLabel];
    [self.fourLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.threeLabel.mas_right).with.offset(32/2);
        make.width.mas_equalTo(FormWithSixListViewTitleWidthTwo);
        //        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    self.fiveLabel = [[UILabel alloc] init];
    [self creatLabel:self.fiveLabel];
    self.fiveLabel.text = @"41";
    [self addSubview:self.fiveLabel];
    [self.fiveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.fourLabel.mas_right).with.offset(32/2);
        make.width.mas_equalTo(FormWithSixListViewTitleWidthTwo);
        //        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    
    self.sixLabel = [[UILabel alloc] init];
    [self creatLabel:self.sixLabel];
    self.sixLabel.text = @"34";
    [self addSubview:self.sixLabel];
    [self.sixLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.fiveLabel.mas_right).with.offset(32/2);
        make.width.mas_equalTo(FormWithSixListViewTitleWidthTwo);
        //        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];

}

#pragma mark - label处理
- (UILabel *)creatLabel: (UILabel *)label{
    
    label.numberOfLines = 1;
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:TemplateOneViewTitleFont];
    //    label.backgroundColor = [UIColor greenColor];
    [label sizeToFit];
    return label;
}

@end
