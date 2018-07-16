//
//  BaseCollectionViewCell.m
//  JLProject
//
//  Created by UCS on 2017/8/17.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface BaseCollectionViewCell ()
@property (nonatomic, strong) UIImageView *headImage;
@end

@implementation BaseCollectionViewCell

+ (instancetype)baseCollectionViewCell: (UICollectionView *)collectionView indexpath: (NSIndexPath *)indexpath{
    
    BaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BaseCollectionViewCell" forIndexPath:indexpath];
    return cell;
}


- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.backgroundColor = [UIColor greenColor];
        
        self.headImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"288x360.jpg"]];
        self.headImage.contentMode = UIViewContentModeScaleToFill;
        [self addSubview: self.headImage];
        [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.width);
            make.height.mas_equalTo(self.height-20);
            make.top.equalTo(self);
            make.left.equalTo(self);
        }];

        
        
    }
    return self;
}


@end
