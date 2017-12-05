//
//  PictureViewController.m
//  JLProject
//
//  Created by UCS on 2017/7/10.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "PictureViewController.h"

@interface PictureViewController (){
    
    UIView *background;
}


@property (strong, nonatomic) UIImageView *minImageView;

@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self tapAction];
    
//    //添加点击手势
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
//    [_minImageView addGestureRecognizer:tapGesture];
    
}

- (void) tapAction{
//    //创建一个黑色背景
//    //初始化一个用来当做背景的View。我这里为了省时间计算，宽高直接用的5s的尺寸
//    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//    background = bgView;
//    [bgView setBackgroundColor:[UIColor whiteColor]];
//    [self.view addSubview:bgView];
//    
//    //创建显示图像的视图
//    //初始化要显示的图片内容的imageView（这里位置继续偷懒...没有计算）
    ZoomImageView *imgView = [[ZoomImageView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, 200)];
    //要显示的图片，即要放大的图片
    [imgView setImage:[UIImage imageNamed:@"123.jpg"]];
//    [bgView addSubview:imgView];
    imgView.userInteractionEnabled = YES;
    [self.view addSubview: imgView];
    
    
//    //添加点击手势（即点击图片后退出全屏）
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeView)];
//    [imgView addGestureRecognizer:tapGesture];
//    
//    [self shakeToShow:bgView];//放大过程中的动画
    
}

-(void)closeView{
    
    [background removeFromSuperview];
}

//放大过程中出现的缓慢动画
- (void) shakeToShow:(UIView*)aView{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
