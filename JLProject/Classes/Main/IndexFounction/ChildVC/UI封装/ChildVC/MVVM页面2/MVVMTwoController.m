//
//  MVVMTwoController.m
//  JLProject
//
//  Created by UCS on 2017/8/23.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "MVVMTwoController.h"
#import "SDCycleScrollView.h"
#import "TemplateOneItemView.h"

@interface MVVMTwoController ()<SDCycleScrollViewDelegate>

@end

@implementation MVVMTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
    
    
//    // 情景二：采用网络图片实现
//    NSArray *imagesURLStrings = @[
//                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
//                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
//                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
//                                  ];
//    // 情景三：图片配文字
//    NSArray *titles = @[@"123456",
//                        @"234567",
//                        @"345678",
//                        @"345689"
//                        ];
//    CGFloat w = self.view.bounds.size.width;
//    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, w, SIZE_IPHONE6PX(500)) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
//    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
//    cycleScrollView2.titlesGroup = titles;
//    cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
//    [self.view addSubview:cycleScrollView2];
//    //         --- 模拟加载延迟
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
//    });
    
    
    
    TemplateOneItemView *template = [[TemplateOneItemView alloc] initWithFrame:CGRectMake(0, 0, 100, 150)];
    [self.view addSubview:template];
    
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









@end
