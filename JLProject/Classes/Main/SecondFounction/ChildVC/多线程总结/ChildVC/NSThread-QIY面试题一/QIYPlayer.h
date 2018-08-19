//
//  QIYPlayer.h
//  JLProject
//
//  Created by UCS on 2018/8/18.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface QIYPlayer : UIView

@property (nonatomic, strong) NSURL *mediaUrl;

+ (instancetype)shareInstace;

- (void)playAction;

- (void)pauseAction;

@end
