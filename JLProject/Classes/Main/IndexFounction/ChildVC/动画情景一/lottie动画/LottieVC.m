//
//  LottieVC.m
//  JLProject
//
//  Created by jiangliang on 2019/7/16.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "LottieVC.h"
#import <Lottie/Lottie.h>

@interface LottieVC ()

@end

@implementation LottieVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    LOTAnimationView *lotAnimationView = [LOTAnimationView animationNamed:@"servishero_loading.json"];
    
    lotAnimationView.frame = CGRectMake(0, 0, kScreenWidth, 200);
    
    [self.view addSubview:lotAnimationView];
    
    [lotAnimationView play];
    
}



@end
