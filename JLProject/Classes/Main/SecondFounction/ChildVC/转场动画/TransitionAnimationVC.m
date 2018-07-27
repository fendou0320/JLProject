//
//  TransitionAnimationVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/25.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "TransitionAnimationVC.h"

@interface TransitionAnimationVC ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, assign) NSInteger index;
@end

@implementation TransitionAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _array= @[@"view0", @"view1", @"view2"];
    _index = 0;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, 500)];
    [self.view addSubview:_imageView];

    //毛玻璃
//    UIBlurEffectStyleExtraLight
//    UIBlurEffectStyleLight
//    UIBlurEffectStyleDark
    
//    UIBlurEffect * blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView * effe = [[UIVisualEffectView alloc]initWithEffect:blur];
//    effe.frame = CGRectMake(0, 100, kScreenWidth, 200);
//    [_imageView addSubview:effe];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    _index++;
    if (_index == 3) {
        _index = 0;
    }
    NSString *imgName = _array[_index];
    self.imageView.image = [UIImage imageNamed:imgName];
    
    CATransition *anim = [CATransition animation];
    anim.type = @"reveal";//@"moveIn";// @"fade";// @"pageCurl";
    anim.duration = 1.0;
//    anim.startProgress = 0.1;
//    anim.endProgress = 0.1;
    [_imageView.layer addAnimation:anim forKey:nil];
    
}


@end
