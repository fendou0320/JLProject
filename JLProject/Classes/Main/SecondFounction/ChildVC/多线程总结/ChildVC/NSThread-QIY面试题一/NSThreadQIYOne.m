//
//  NSThreadQIYOne.m
//  JLProject
//
//  Created by jiangliangwang on 2018/8/14.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "NSThreadQIYOne.h"
#import <AVFoundation/AVFoundation.h>
#import "QIYPlayer.h"

@interface NSThreadQIYOne ()
@property (nonatomic, strong) UIButton *btnOne;
@property (nonatomic, strong) UIButton *btnTwo;
@property (nonatomic, strong) UIButton *btnthree;
@property (nonatomic, strong) UIButton *btnfour;

@property (nonatomic, strong) QIYPlayer *player;

@end

@implementation NSThreadQIYOne

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"nsthread一直存活，可cancel";
    
    [self setUpBtnUI];

    _player = [QIYPlayer shareInstace];
    _player.frame = CGRectMake(0, 200, kScreenWidth, 300);
    [self.view addSubview:_player];
}


- (void)setUpBtnUI{
    
    self.btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnOne.frame = CGRectMake(0, SIZE_IPHONE6(0), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:self.btnOne];
    self.btnOne.backgroundColor = RandomColor;
    [self.btnOne setTitle:@"视频一播放" forState:UIControlStateNormal];
    [self.btnOne addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnTwo.frame = CGRectMake(0, SIZE_IPHONE6(40), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:self.btnTwo];
    self.btnTwo.backgroundColor = RandomColor;
    [self.btnTwo setTitle:@"视频二播放" forState:UIControlStateNormal];
    [self.btnTwo addTarget:self action:@selector(btnTwo:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnthree = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnthree.frame = CGRectMake(0, SIZE_IPHONE6(80), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:self.btnthree];
    self.btnthree.backgroundColor = RandomColor;
    [self.btnthree setTitle:@"开始" forState:UIControlStateNormal];
    [self.btnthree addTarget:self action:@selector(btnthree:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnfour = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnfour.frame = CGRectMake(0, SIZE_IPHONE6(120), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:self.btnfour];
    self.btnfour.backgroundColor = RandomColor;
    [self.btnfour setTitle:@"暂停" forState:UIControlStateNormal];
    [self.btnfour addTarget:self action:@selector(btnfour:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnOne: (UIButton *)sender{
    
    NSURL *mediaUrl = [NSURL URLWithString:@"http://mvvideo10.meitudata.com/5785a7fc4fc2a8429.mp4?k=01a98080a7f155385c9c4893f4e4309c&t=5b7badde"];
    _player.mediaUrl = mediaUrl;
}

- (void)btnTwo: (UIButton *)sender
{
    NSURL *mediaUrl = [NSURL URLWithString:@"http://ali.cdn.kaiyanapp.com/ca41515acf967fc06249c1a16a16f466_1280x720_854x480.mp4?auth_key=1534645832-0-0-d0abf2f59c8e61fa9521c638d94a5004"];
    _player.mediaUrl = mediaUrl;
}

- (void)btnthree: (UIButton *)sender
{
    [_player playAction];
}

- (void)btnfour: (UIButton *)sender
{
    [_player pauseAction];
}



@end
