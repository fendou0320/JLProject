//
//  MainViewController.m
//  UcsProject
//
//  Created by UCS on 2017/5/3.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "MainViewController.h"
#import "IndexViewController.h"
#import "SecondFounctionVC.h"
#import "ThirdFounctionVC.h"
#import "FourFounctionVC.h"
#import "FiveFounctionVC.h"
#import "BaseNavigationController.h"
//监控DebugToolTypeMemory | DebugToolTypeCPU | DebugToolTypeFPS
#import "WHDebugToolManager.h"


@interface MainViewController ()
@property (nonatomic, strong) UIButton *lastBtn;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[WHDebugToolManager sharedInstance] toggleWith:DebugToolTypeMemory | DebugToolTypeCPU | DebugToolTypeFPS];
    
    [self creatSubViewCtr];
    [self removeTabbar];
    [self creatTabbar];
}

- (void)creatSubViewCtr{
    
    //创建第三级控制器
    IndexViewController *index = [[IndexViewController alloc] init];
    index.navigationItem.title = @"基础部分";
    
    //创建第三级控制器
    SecondFounctionVC *secondVC = [[SecondFounctionVC  alloc] init];
    secondVC.navigationItem.title = @"底层部分";
    
    //创建第三级控制器
    ThirdFounctionVC *thirdVC = [[ThirdFounctionVC alloc] init];
    thirdVC.navigationItem.title = @"功能部分";
    
    FourFounctionVC *fourVC = [[FourFounctionVC alloc] init];
    fourVC.navigationItem.title = @"三方部分";
    
    FiveFounctionVC *fiveVC = [[FiveFounctionVC alloc] init];
    fiveVC.navigationItem.title = @"牛逼部分";
    
    NSArray *ctrls =@[index,secondVC,thirdVC,fourVC,fiveVC];
    
    //存储导航控制器
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    
    for (UIViewController *ctrl in ctrls) {
        
        //1.创建导航控制器(子类化导航控制器)
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:ctrl];
        //2.把导航控制器加入到数组中
        [array addObject:nav];
    }
    //把导航控制器交给标签控制器管理
    self.viewControllers = array;
}


- (void)removeTabbar{
    
    for (UIView *view in self.tabBar.subviews) {
        Class c = NSClassFromString(@"UITabBarButton");
        //判断view是不是由UITabBarButton类创建
        if ([view isKindOfClass:c]) {
            [view removeFromSuperview];
        }
    }
}

- (void)creatTabbar{
    
    NSArray *titles = @[@"基础",@"底层",@"功能",@"三方",@"牛逼"];
    //按钮宽度
    CGFloat width = kScreenWidth / titles.count;
    
    for (NSInteger i = 0; i < titles.count; i++) {
        
        //取出标题
        NSString *title =  titles[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(i * width, 0, width, kTabBarHeight);
//        btn.backgroundColor = RandomColor;
        btn.tag = i;
        
        //调整标题的位置
        btn.titleLabel.font = [UIFont systemFontOfSize:11];
        //调整图片的位置
//        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 20, 0);
//        btn.titleEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 30);
        
        [self.tabBar addSubview:btn];
        
        if (i == 0) {
            btn.selected = YES;
            self.lastBtn = btn;
        }
        
        [self.tabBar addSubview:btn];
    }
}

//按钮点击事件
- (void)clickAction:(UIButton *)btn{
    
    if (self.lastBtn == btn) {
        return;
    }
    //移动选中视图
    [UIView animateWithDuration:.3 animations:^{
        [self.lastBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }];
    self.lastBtn.selected = NO;
    self.lastBtn = btn;
    //切换子控制器
    self.selectedIndex = btn.tag;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
