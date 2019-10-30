//
//  CRBoxInputCell_Line.m
//  CRBoxInputView_Example
//
//  Created by Chobits on 2019/1/7.
//  Copyright © 2019 BearRan. All rights reserved.
//

#import "CRBoxInputCell_Line.h"
#import "BearDefines.h"

@interface CRBoxInputCell_Line ()
{
    
}
@end

@implementation CRBoxInputCell_Line

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSepLineView];
    }
    
    return self;
}

- (void)addSepLineView
{
    weakedSelf
    static CGFloat sepLineViewHeight = 1;//4;
    static CGFloat sepLineViewWidth = 36;//4;

    UIView *_sepLineView = [UIView new];
    _sepLineView.backgroundColor = [UIColor purpleColor];//color_master;
    _sepLineView.layer.cornerRadius = sepLineViewHeight / 2.0;
    [self.contentView addSubview:_sepLineView];
    [_sepLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.height.mas_equalTo(sepLineViewHeight);
        make.width.mas_equalTo(sepLineViewWidth);
        make.centerX.equalTo(weakSelf);
    }];
    
//    _sepLineView.layer.shadowColor = [UIColor purpleColor].CGColor;//[color_master colorWithAlphaComponent:0.2].CGColor;
//    _sepLineView.layer.shadowOpacity = 1;
//    _sepLineView.layer.shadowOffset = CGSizeMake(0, 2);
//    _sepLineView.layer.shadowRadius = 1;
}


@end
