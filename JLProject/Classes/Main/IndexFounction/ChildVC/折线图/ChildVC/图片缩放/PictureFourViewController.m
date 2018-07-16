//
//  PictureFourViewController.m
//  JLProject
//
//  Created by UCS on 2017/7/16.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "PictureFourViewController.h"

@interface PictureFourViewController ()<UIScrollViewDelegate>{

    CGRect oldFrame;    //保存图片原来的大小
    CGRect largeFrame;  //确定图片放大最大的程度
//    BOOL   _isZoomed;   //是否处于放大状态的标志

}

@property(strong,nonatomic)UIImageView *imgView;
@property(strong,nonatomic)UIImage *image;
@property(nonatomic,weak)UIScrollView *bgView;
@end

@implementation PictureFourViewController

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = 0;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    _isZoomed = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    _image = [UIImage imageNamed:@"123.jpg"];
    
    UIScrollView *bgView = [[UIScrollView alloc] init];
    self.bgView = bgView;
//    bgView.frame = [UIScreen mainScreen].bounds;
//    bgView.frame = self.view.bounds;
    bgView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    bgView.backgroundColor = [UIColor blackColor];
    bgView.backgroundColor = [UIColor redColor];
    _imgView = [[UIImageView alloc] initWithImage:_image];
    [_imgView setContentMode:UIViewContentModeScaleToFill];
    [bgView addSubview:_imgView];
    
    // 设置_imgView的位置大小
//    CGRect frame = CGRectMake(0, 50, 0, 0);
//    frame.size.width = bgView.frame.size.width;
//    frame.size.height =frame.size.width*(_image.size.height/_image.size.width);
    CGRect frame = CGRectMake(0, 0, kScreenWidth, 300);
    _imgView.backgroundColor = [UIColor greenColor];
    _imgView.frame = frame;
    _imgView.center=bgView.center;
    [self.view addSubview:bgView];
    //最大放大比例
    bgView.maximumZoomScale = 3.0;
    bgView.contentSize=_imgView.frame.size;
    bgView.delegate = self;
    bgView.showsVerticalScrollIndicator = NO;
    bgView.showsHorizontalScrollIndicator = NO;
    bgView.bounces = NO;
    
//    //添加缩小的手势
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zoomOut:)];
//    [tap setCancelsTouchesInView:NO];
//    [tap setNumberOfTapsRequired:2];
//    [bgView addGestureRecognizer:tap];
//
//    oldFrame = bgView.frame;
//    largeFrame = CGRectMake(0 , 0 , 3 * oldFrame.size.width, 3 * oldFrame.size.height);
}


//代理方法
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imgView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    CGFloat xcenter = scrollView.center.x ;
    CGFloat ycenter = scrollView.center.y;

    xcenter = scrollView.contentSize.width > scrollView.frame.size.width ? scrollView.contentSize.width/2 : xcenter;
    ycenter = scrollView.contentSize.height > scrollView.frame.size.height ? scrollView.contentSize.height/2 : ycenter;
    [_imgView setCenter:CGPointMake(xcenter, ycenter)];
    
}

//- (void)zoomOut:(UIPinchGestureRecognizer *)pinchGestureRecognizer
//{
//    if (_isZoomed == NO) {
//        //放大
//        CGFloat xcenter = _bgView.contentSize.width/2;
//        CGFloat ycenter = _bgView.contentSize.height/2;
//        [_imgView setCenter:CGPointMake(xcenter, ycenter)];
//        _isZoomed = YES;
//    }else{
//        //缩小
//        CGFloat xcenter = _bgView.center.x;
//        CGFloat ycenter = _bgView.center.y;
//        [_imgView setCenter:CGPointMake(xcenter, ycenter)];
//        _isZoomed = NO;
//    }
//    
//}
//


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
