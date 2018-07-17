//
//  AudioVideoVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/17.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "AudioVideoVC.h"
#import <AVFoundation/AVFoundation.h>

@interface AudioVideoVC ()<AVCaptureAudioDataOutputSampleBufferDelegate>
@property(nonatomic,strong)UILabel *cLabel;

@end

@implementation AudioVideoVC

//#MARK - 知识点
//VideoToolBox

//GPUImage = AVFoundation(采集) + OpenGL ES(处理采集的图片、视频、直播)





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}


@end
