//
//  BackgroundPlayVC.m
//  JLProject
//
//  Created by UCS on 2018/6/27.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "BackgroundPlayVC.h"
#import <AVFoundation/AVFoundation.h>

@implementation BackgroundPlayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //添加后台播放代码：
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setActive:YES error:nil];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    //以及设置app支持接受远程控制事件代码。设置app支持接受远程控制事件，
    //其实就是在dock中可以显示应用程序图标，同时点击该图片时，打开app。
    //或者锁屏时，双击home键，屏幕上方出现应用程序播放控制按钮。
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    
    
    //用下列代码播放音乐，测试后台播放
    NSURL *url = [NSURL URLWithString:@"http://edge.ivideo.sina.com.cn/6376446.flv?KID=sina,viask&Expires=1530201600&ssig=iwBSOryLN5"];
    // 创建播放器
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
//    [url release];
    [player prepareToPlay];
    [player setVolume:1];
    player.numberOfLoops = -1; //设置音乐播放次数  -1为一直循环
    [player play]; //播放

    
    
    
    
}


@end
