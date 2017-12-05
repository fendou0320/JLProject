//
//  TypeOneLabel.m
//  JLProject
//
//  Created by UCS on 2017/6/28.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "TypeOneLabel.h"
#import <UIKit/UIKit.h>

@implementation TypeOneLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//下面三个方法用来初始化edgeInsets
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        self.edgeInsets = UIEdgeInsetsMake(25, 0, 25, 0);
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.edgeInsets = UIEdgeInsetsMake(25, 0, 25, 0);
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.edgeInsets = UIEdgeInsetsMake(25, 0, 25, 0);
}

- (void)drawTextInRect:(CGRect)rect {
    
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _edgeInsets)];
}



@end
