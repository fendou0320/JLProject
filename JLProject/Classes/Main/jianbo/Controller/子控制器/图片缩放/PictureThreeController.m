//
//  PictureThreeController.m
//  JLProject
//
//  Created by UCS on 2017/7/16.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "PictureThreeController.h"

typedef NS_ENUM(NSInteger, ZoomedStatues)
{
    kMinScaleState          =   0,
    kFitMaxScaleState       =   1,
    kMaxScaleState          =   2,
    kOtherScaleState        =   3
}NS_AVAILABLE_IOS(6_0);

@interface PictureThreeController (){

    UITapGestureRecognizer*             _doubleTapGesture;              //双击手势
    BOOL                                _isZoomed;                      //是否处于放大状态的标志

}

@property(nonatomic, assign)ZoomedStatues   zoomStatus;

@property(nonatomic, assign)CGFloat         minZoomScale;
@property(nonatomic, assign)CGFloat         maxFitZoomScale;
@property(nonatomic, assign)CGFloat         maxZoomScale;
@property(nonatomic, assign)CGPoint         touchOrigin;

@property(nonatomic, strong)UIImageView   *imageView;  //图片

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation PictureThreeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _zoomStatus = kMinScaleState;
    _minZoomScale = 1.0f;
    _maxFitZoomScale = 3.0f;
    _maxZoomScale = 8.0f;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,200, kScreenWidth, 280)];
    [_imageView setMultipleTouchEnabled:YES];
    [_imageView setUserInteractionEnabled:YES];
    [_imageView setImage:[UIImage imageNamed:@"123.jpg"]];
    [self.view addSubview:_imageView];
    
    _doubleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapForZoom:)];
    [_doubleTapGesture setCancelsTouchesInView:NO];
    [_doubleTapGesture setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:_doubleTapGesture];
    
    
    _maxFitZoomScale = self.view.frame.size.height / (_imageView.size.height * (self.view.frame.size.width / _imageView.size.width));
    _maxZoomScale = _maxFitZoomScale * 2;
    
    _scrollView.maximumZoomScale = _maxZoomScale;
    
}

//双击放大操作
- (IBAction)doubleTapForZoom:(UITapGestureRecognizer*)sender
{
    UITapGestureRecognizer* tap = (UITapGestureRecognizer*)sender;
    
    _touchOrigin = [tap locationInView:self];
    
    switch (_zoomStatus)
    {
        case kMinScaleState:
        {
            [self zoomToFitMaxScale];
        }
            break;
        case kFitMaxScaleState:
        {
            [self zoomToMinScale:YES];
        }
            break;
        case kMaxScaleState:
        {
            [self zoomToMinScale:YES];
        }
            break;
        case kOtherScaleState:
        {
            [self zoomToMinScale:YES];
        }
            break;
        default:
            break;
    }
}

- (void)zoomToMinScale:(BOOL)animation
{
    [_scrollView setZoomScale:_minZoomScale animated:animation];
    [_scrollView setContentOffset:CGPointMake(0, 0) animated:animation];
    if(!animation){
        _zoomStatus = kMinScaleState;
    }
    _isZoomed = NO;
}

- (void)zoomToFitMaxScale
{
    [_scrollView setZoomScale:_maxFitZoomScale animated:YES];
    [_scrollView setContentOffset:CGPointMake(_touchOrigin.x * (_maxFitZoomScale - 1), 0) animated:NO];
    _isZoomed = YES;
}

- (void)zoomToMaxScale
{
    [_scrollView setZoomScale:_maxZoomScale animated:YES];
    _isZoomed = YES;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    if(scale == _minZoomScale){
        _zoomStatus = kMinScaleState;
    }
    else if(scale == _maxFitZoomScale){
        _zoomStatus = kFitMaxScaleState;
    }
    else if(scale == _maxZoomScale){
        _zoomStatus = kMaxScaleState;
    }
    else{
        _zoomStatus = kOtherScaleState;
    }
}

//- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
//    self.widthConstraint.constant = self.frame.size.width;
//    self.heightConstraint.constant = scrollView.contentSize.height * (self.frame.size.width / scrollView.contentSize.width);
//    if(scrollView.contentSize.height <= self.frame.size.height){
//        self.topConstraint.constant = (self.frame.size.height - scrollView.contentSize.height * (self.imageView.frame.size.width / scrollView.contentSize.width)) / 2;
//    }else{
//        self.topConstraint.constant = 0;
//    }
//    [self layoutIfNeeded];
//}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}




@end
