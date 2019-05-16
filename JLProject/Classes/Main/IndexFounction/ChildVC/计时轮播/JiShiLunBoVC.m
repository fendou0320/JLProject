//
//  JiShiLunBoVC.m
//  JLProject
//
//  Created by jiangliang on 2018/10/4.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "JiShiLunBoVC.h"
#import "UIImageView+WebCache.h"

@interface JiShiLunBoVC ()

@end

@implementation JiShiLunBoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    [self.view addSubview:image1];
    image1.backgroundColor = [UIColor yellowColor];
    [image1 sd_setImageWithURL:@"http://xiaodai-static.oss-cn-beijing.aliyuncs.com/95909a7e-55e3-409b-a512-f2b62488099c.png"];

    
}





@end
