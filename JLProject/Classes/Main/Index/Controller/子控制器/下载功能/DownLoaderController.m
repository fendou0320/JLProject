//
//  DownLoaderController.m
//  JLProject
//
//  Created by UCS on 2017/11/30.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "DownLoaderController.h"
#import "DownloaderManager.h"
#import "DownLoadBigFileManager.h"

@interface DownLoaderController ()

@end

@implementation DownLoaderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *directryPath = [path stringByAppendingPathComponent:@"VideoFile"];
    [fileManager createDirectoryAtPath:directryPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSString *filePath = [directryPath stringByAppendingPathComponent:@"test.plist"];
    [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, 100)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"下载" forState:UIControlStateNormal];
     
    [btn addTarget:self action:@selector(downLoader) forControlEvents:UIControlEventTouchUpInside];
}


- (void)downLoader{
    
//    DLog(@"下载");
//    [[DownloaderManager sharedInstance] downLoadBigFile:@"http://dlsw.baidu.com/sw-search-sp/soft/9d/25765/sogou_mac_32c_V3.2.0.1437101586.dmg"];
    
    // 此处是截取的下载地址，可以自己根据服务器的视频名称来赋值
    
//    DownLoadBigFileManager *fileManeger = [[DownLoadBigFileManager alloc] init];
//    [fileManeger startDownload];

    
    //下载二
    
    
    
}



@end
