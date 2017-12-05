//
//  PictureTwoController.m
//  JLProject
//
//  Created by UCS on 2017/7/10.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "PictureTwoController.h"

@interface PictureTwoController (){
    
    CGFloat lastScale;
    CGRect oldFrame;    //保存图片原来的大小
    CGRect largeFrame;  //确定图片放大最大的程度
    UIImageView *showImgView;
}

@property (nonatomic, strong) UIScrollView *scroll;


@end

@implementation PictureTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 480)];
    self.scroll.backgroundColor = [UIColor redColor];
    [self.view addSubview: self.scroll];
    
    showImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,100, kScreenWidth, 200)];
    
    [showImgView setMultipleTouchEnabled:YES];
    
    [showImgView setUserInteractionEnabled:YES];
    
    [showImgView setImage:[UIImage imageNamed:@"123.jpg"]];
    
    oldFrame = showImgView.frame;
    
    largeFrame = CGRectMake(0 , 0 , 3 * oldFrame.size.width, 3 * oldFrame.size.height);
    
    [self addGestureRecognizerToView:showImgView];
    
//    [self.view addSubview:showImgView];
    
    [self.scroll addSubview:showImgView];
    
}

- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer

{
    
    UIView *view = pinchGestureRecognizer.view;
    
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged)
    {
        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
        
        self.scroll.contentSize = CGSizeMake(showImgView.width, showImgView.height);
        
        if (showImgView.frame.size.width < oldFrame.size.width)
        {
            showImgView.frame = oldFrame;
        }
        if (showImgView.frame.size.width > 3 * oldFrame.size.width)
            
        {              
            showImgView.frame = largeFrame;
        }
        pinchGestureRecognizer.scale = 1;
    }
}


- (void) addGestureRecognizerToView:(UIView *)view

{
    
//    // 旋转手势
//    
//    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateView:)];
//    
//    [view addGestureRecognizer:rotationGestureRecognizer];
    
    // 缩放手势
    
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
    [view addGestureRecognizer:pinchGestureRecognizer];
    
    // 移动手势
    
//    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
//    [view addGestureRecognizer:panGestureRecognizer];
    
//    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
//    [view addGestureRecognizer:panGestureRecognizer];

    
//    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(doMoveAction:)];
//    [view addGestureRecognizer:panGestureRecognizer];
    
    
    
}


//// 处理旋转手势
//- (void) rotateView:(UIRotationGestureRecognizer *)rotationGestureRecognizer  {
//    
//    UIView *view = rotationGestureRecognizer.view;
//    
//    if (rotationGestureRecognizer.state == UIGestureRecognizerStateBegan || rotationGestureRecognizer.state == UIGestureRecognizerStateChanged)
//        
//    {
//        
//        view.transform = CGAffineTransformRotate(view.transform, rotationGestureRecognizer.rotation);
//        
//        [rotationGestureRecognizer setRotation:0];
//        
//    }
//    
//}

//// 处理缩放手势
//- (void) pinchView:(UIPinchGestureRecognizer *)pinchGestureRecognizer
//
//{
//    
//    UIView *view = pinchGestureRecognizer.view;
//    
//    if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged)
//        
//    {
//        
//        view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);          pinchGestureRecognizer.scale = 1;
//        
//    }
//    
//}

// 处理拖拉手势

//- (void) panView:(UIPanGestureRecognizer *)panGestureRecognizer
//
//{
//    UIView *view = panGestureRecognizer.view;
//    if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged)
//    {
//        CGPoint translation = [panGestureRecognizer translationInView:view.superview];
//        
//        [view setCenter:(CGPoint){view.center.x + translation.x, view.center.y + translation.y}];
//        
//        [panGestureRecognizer setTranslation:CGPointMake(0, 0) inView:view.superview];
//    }
//    
//}

//-(void)handlePan:(UIPanGestureRecognizer *)rec{
//    
//    CGFloat KWidth = [UIScreen mainScreen].bounds.size.width;
//    CGFloat KHeight = [UIScreen mainScreen].bounds.size.height;
//    
//    //返回在横坐标上、纵坐标上拖动了多少像素
//    CGPoint point=[rec translationInView:self.view];
//    NSLog(@"%f,%f",point.x,point.y);
//    
//    CGFloat centerX = rec.view.center.x+point.x;
//    CGFloat centerY = rec.view.center.y+point.y;
//    
//    CGFloat viewHalfH = rec.view.frame.size.height/2;
//    CGFloat viewhalfW = rec.view.frame.size.width/2;
//    
//    //确定特殊的centerY
//    if (centerY - viewHalfH < 0 ) {
//        centerY = viewHalfH;
//    }
//    if (centerY + viewHalfH > KHeight ) {
//        centerY = KHeight - viewHalfH;
//    }
//    
//    //确定特殊的centerX
//    if (centerX - viewhalfW < 0){
//        centerX = viewhalfW;
//    }
//    if (centerX + viewhalfW > KWidth){
//        centerX = KWidth - viewhalfW;
//    }
//    
//    rec.view.center=CGPointMake(centerX, centerY);
//    
//    //拖动完之后，每次都要用setTranslation:方法制0这样才不至于不受控制般滑动出视图
//    [rec setTranslation:CGPointMake(0, 0) inView:self.view];
//    
//}

//-(void)doMoveAction:(UIPanGestureRecognizer *)recognizer{
//    
//    
//    // Figure out where the user is trying to drag the view.
//    
//    CGPoint translation = [recognizer translationInView:self.view];
//    CGPoint newCenter = CGPointMake(recognizer.view.center.x+ translation.x,
//                                    recognizer.view.center.y + translation.y);
//    //    限制屏幕范围：
//    newCenter.y = MAX(recognizer.view.frame.size.height/2, newCenter.y);
//    newCenter.y = MIN(self.view.frame.size.height - recognizer.view.frame.size.height/2, newCenter.y);
//    newCenter.x = MAX(recognizer.view.frame.size.width/2, newCenter.x);
//    newCenter.x = MIN(self.view.frame.size.width - recognizer.view.frame.size.width/2,newCenter.x);
//    recognizer.view.center = newCenter;
//    [recognizer setTranslation:CGPointZero inView:self.view];
//    
//}
//




@end
