//
//  Animation1.m
//  JLProject
//
//  Created by jiangliang on 2020/4/16.
//  Copyright © 2020 wangjiangliang. All rights reserved.
//

#import "Animation1.h"

@interface Animation1 ()

@property (nonatomic, strong) UIView *topView;

@end

@implementation Animation1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    self.topView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.topView];
    
    
    
    //去swift项目中实现
    
    
    /*
    iOS中的动画有四种：
    （1）UIView动画
    （2）Block动画
    （3）UIImageView的帧动画
    （4）核心动画Core Animation
    */
    
    //（2）Block动画
    
    /*
     1.获取一个原始CGAffineTransform

     获取一个原始的transform值[ 1 0 0 1 0 0 ]。就是没有做任何的转换。
     CGAffineTransformIdentity

     2.创建CGAffineTransform,返回 transform = [ a b c d tx ty ].

     CGAffineTransformMake(CGFloat a, CGFloat b, CGFloat c, CGFloat d, CGFloat tx, CGFloat ty)

     3.单一转换(在原始CGAffineTransformIdentity的转换)

     //平移 t' = [ 1 0 0 1 tx ty ]
     CGAffineTransformMakeTranslation(CGFloat tx, CGFloat ty)；

     //缩放 t' = [ sx 0 0 sy 0 0 ]
     CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)；

     //旋转 t' = [ cos(angle) sin(angle) -sin(angle) cos(angle) 0 0 ]
     CGAffineTransformMakeRotation(CGFloat angle)；
     */
    
    
    [UIView animateWithDuration:2 delay:2 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.topView.frame = CGRectMake(50, 50, 60, 50);
        self.topView.transform = CGAffineTransformMakeRotation(M_PI/2);
    } completion:^(BOOL finished) {
        self.topView.frame = CGRectMake(50, 50, 100, 100);
    }];
    
    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, 100, 100)];
//    imageView.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:imageView];
//    NSMutableArray *array = [NSMutableArray array];
////    UIImage *homeImage1 = [UIImage imageNamed:[NSString stringWithFormat:@"timg.jpeg"]];
//    UIImage *homeImage2 = [UIImage imageNamed:@"8logo-iconiPhoneApp_60pt@3x.png"];
////    [array addObject:homeImage1];
//    [array addObject:homeImage2];
//    imageView.animationDuration = 2;
//    imageView.animationRepeatCount = 100;
//    [imageView startAnimating];
    
    
    
    
    
    
    
}



@end
