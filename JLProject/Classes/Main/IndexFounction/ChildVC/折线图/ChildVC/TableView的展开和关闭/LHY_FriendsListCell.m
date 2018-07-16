//
//  LHY_FriendsListCell.m
//  JLProject
//
//  Created by UCS on 2017/6/19.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "LHY_FriendsListCell.h"

@implementation LHY_FriendsListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 加载视图
        [self.contentView addSubview:self.headPortraitImageView];
        [self.contentView addSubview:self.nicknameLabel];
        [self.contentView addSubview:self.signatureLabel];
    }
    return self;
}

#pragma mark *** Getters ***
- (UIImageView *)headPortraitImageView {
    if (!_headPortraitImageView) {
        
        _headPortraitImageView = [[UIImageView alloc] init];
        _headPortraitImageView.bounds = CGRectMake(0, 0, 60, 60);
        _headPortraitImageView.center = CGPointMake(40, 40);
        // 设置文本现实模式
        _headPortraitImageView.contentMode = UIViewContentModeScaleAspectFit;
        // 设置圆角
        _headPortraitImageView.layer.cornerRadius = 30;
        // 设置图层超出父视图部分不显示
        _headPortraitImageView.layer.masksToBounds = YES;
    }
    return _headPortraitImageView;
    
}
- (UILabel *)nicknameLabel {
    if (!_nicknameLabel) {
        _nicknameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 5, 310, 30)];
        _nicknameLabel.font = [UIFont boldSystemFontOfSize:18];
        _nicknameLabel.textColor = [UIColor redColor];
    }
    return _nicknameLabel;
}

- (UILabel *)signatureLabel {
    if (!_signatureLabel) {
        _signatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, 310, 20)];
        _signatureLabel.font = [UIFont systemFontOfSize:15];
    }
    return _signatureLabel;
}
@end
