//
//  TopViewChannalButton.m
//  newInterface
//
//  Created by wangjiangliang on 16/5/11.
//  Copyright © 2016年 wangjiangliang. All rights reserved.
//

#import "TopViewChannalButton.h"

@implementation TopViewChannalButton

+ (instancetype)topViewChannalButtonWithFrame:(CGRect)frame{
    
    return [[self alloc]initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
//         [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//         self.titleLabel.text = @"拍片";
//         self.titleLabel.textColor = [UIColor blackColor];
//         self.titleLabel.font = [UIFont systemFontOfSize:20.0f];
    }
    return self;
}

//-(void)setCategoryModel:(CategoryListModel *)categoryModel{
//    _categoryModel = categoryModel;
//    [self setTitle:categoryModel.title forState:UIControlStateNormal];
//}


@end
