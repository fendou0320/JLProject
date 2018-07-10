//
//  StarController.m
//  JLProject
//
//  Created by UCS on 2017/9/10.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "StarController.h"
#import "TQStarRatingView.h"
#import "CostomsStarView.h"

@interface StarController ()
@property (nonatomic, strong) TQStarRatingView *starRatingView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation StarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.starRatingView = [[TQStarRatingView alloc] initWithFrame:CGRectMake(30, 200, 250, 50)
                                                     numberOfStar:kNUMBER_OF_STAR];
    [self.view addSubview:self.starRatingView];

    CostomsStarView *starView = [[CostomsStarView alloc] initWithFrame:CGRectMake(30, 400, 250, 50)
                                                     numberOfStar:kNUMBER_OF_STAR];
    [self.view addSubview: starView];
    [starView setScore:(1.0/10) withAnimation:NO];
    
    
    
    _titleLabel = [[UILabel alloc] init];
    [self setUpLabel:_titleLabel];
    _titleLabel.font = [UIFont systemFontWithSize:15];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(SIZE_IPHONE6(10));
        make.right.equalTo(self.view).with.offset(SIZE_IPHONE6(-20));
        make.top.equalTo(self.view.mas_top).with.offset(300);
        make.height.mas_equalTo(SIZE_IPHONE6(110)/6);
    }];
    
    [self.titleLabel textAlignmentLeftWidth:100 leftStr:@"判断类型的" rightWidth:100 rightStr:@":hhsahfa"];
    
}

- (void)setUpLabel: (UILabel *)label{
    
    label.font = [UIFont systemFontWithSize:12];
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 1;
//    label.textColor = COLOR_333333;
    label.backgroundColor = RandomColor;
    [self.view addSubview:label];
    
}

@end
