//
//  GPUImageVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/17.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "GPUImageVC.h"
#import "GPUImage.h"

@interface GPUImageVC ()

@end

@implementation GPUImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = RandomColor;
    
    UIImage *inputImage = [UIImage imageNamed:@"QiDong2"];
    //
    GPUImageSketchFilter *disFilter = [[GPUImageSketchFilter alloc] init];
    [disFilter forceProcessingAtSize:inputImage.size];
    [disFilter useNextFrameForImageCapture];
    
    GPUImagePicture *stallImageSource = [[GPUImagePicture alloc] initWithImage:inputImage];
    //添加滤镜
    [stallImageSource addTarget:disFilter];
    //开始渲染
    [stallImageSource processImage];
    
    //获取渲染后的图片
    UIImage *newImage = [disFilter imageFromCurrentFramebuffer];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
    imageView.frame = CGRectMake(0, 100, kScreenWidth, SIZE_IPHONE6(400));
    [self.view addSubview:imageView];
    
}



@end
