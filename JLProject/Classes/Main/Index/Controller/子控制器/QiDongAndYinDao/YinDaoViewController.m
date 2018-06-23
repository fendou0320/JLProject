//
//  YinDaoViewController.m
//  JLProject
//
//  Created by UCS on 2017/7/31.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "YinDaoViewController.h"

YinDaoViewController *guideViewController;

@interface YinDaoViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *guideScrollView;
@property (nonatomic, strong) UIImageView *qiDongYe;
@end

@implementation YinDaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.view.backgroundColor = [UIColor redColor];
    
    _guideScrollView = [[UIScrollView alloc] init];
    _guideScrollView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    _guideScrollView.pagingEnabled = YES;
    _guideScrollView.bounces = NO;
    _guideScrollView.delegate = self;
    [_guideScrollView setShowsHorizontalScrollIndicator:NO];
    [_guideScrollView setShowsVerticalScrollIndicator:NO];
    _guideScrollView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_guideScrollView];

    int x = 0;
    UIImageView *firstImgView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, kScreenWidth, kScreenHeight)];
    [firstImgView setImage:[AppUtily loadBundleImage:@"yinDaoYe0"]];
    firstImgView.userInteractionEnabled = YES;
    [_guideScrollView addSubview:firstImgView];
    
    x+= kScreenWidth;
    UIImageView *secondImgView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, kScreenWidth, kScreenHeight)];
    [secondImgView setImage:[AppUtily loadBundleImage:@"yinDaoYe1"]];
    secondImgView.userInteractionEnabled = YES;
    [_guideScrollView addSubview:secondImgView];
    
    x+= kScreenWidth;
    UIImageView *thirdImgView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, kScreenWidth, kScreenHeight)];
    [thirdImgView setImage:[AppUtily loadBundleImage:@"yinDaoYe2"]];
    thirdImgView.userInteractionEnabled = YES;
    [_guideScrollView addSubview:thirdImgView];

    x+= kScreenWidth;
    UIImageView *fourImgView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, kScreenWidth, kScreenHeight)];
    [fourImgView setImage:[AppUtily loadBundleImage:@"yinDaoYe3"]];
    fourImgView.userInteractionEnabled = YES;
    [_guideScrollView addSubview:fourImgView];

    x+= kScreenWidth;
    UIImageView *fiveImgView = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, kScreenWidth, kScreenHeight)];
    [fiveImgView setImage:[AppUtily loadBundleImage:@"yinDaoYe4"]];
    fiveImgView.userInteractionEnabled = YES;
    [_guideScrollView addSubview:fiveImgView];

    UIButton * secondSkipBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, kScreenHeight-150, 200, 50)];
    secondSkipBtn.backgroundColor = [UIColor redColor];
    [secondSkipBtn addTarget:self action:@selector(jinRuApp:) forControlEvents:UIControlEventTouchUpInside];
    [fiveImgView addSubview:secondSkipBtn];
    
    [_guideScrollView setContentSize:CGSizeMake(x+kScreenWidth, _guideScrollView.frame.size.height)];
    
    
    self.qiDongYe = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.qiDongYe setImage:[UIImage imageNamed:@"QiDong2"]];
    self.qiDongYe.userInteractionEnabled=YES;
    [self.view addSubview:self.qiDongYe];
    
    UIButton * huanYingBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, kScreenHeight-150, 200, 50)];
    huanYingBtn.backgroundColor = [UIColor greenColor];
    [huanYingBtn addTarget:self action:@selector(huanYingBtnApp:) forControlEvents:UIControlEventTouchUpInside];
    [self.qiDongYe addSubview:huanYingBtn];
    
}



+(void)showInView:(UIView*)superView{
    
    guideViewController = [[YinDaoViewController alloc]init];
    [superView addSubview:guideViewController.view];
}

- (void)jinRuApp: (UIButton *)sender{

    [guideViewController.view removeFromSuperview];
    guideViewController = nil;
}

- (void)huanYingBtnApp: (UIButton *)sender{

    [self.qiDongYe removeFromSuperview];
    self.qiDongYe = nil;
}

//- (void)dealloc{
//    
//    NSLog(@"%@", guideViewController);
//}

@end
