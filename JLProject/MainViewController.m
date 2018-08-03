//
//  MainViewController.m
//  UcsProject
//
//  Created by UCS on 2017/5/3.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "MainViewController.h"
#import "MainTabbar.h"

#import "IndexViewController.h"
#import "SecondFounctionVC.h"
#import "ThirdFounctionVC.h"
#import "FourFounctionVC.h"
#import "FiveFounctionVC.h"
#import "BaseNavigationController.h"
//监控DebugToolTypeMemory | DebugToolTypeCPU | DebugToolTypeFPS
#import "WHDebugToolManager.h"


@interface MainViewController ()<MainTabbarDelegate>
@property (nonatomic, strong) UIButton *lastBtn;
@end

@implementation MainViewController

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize
{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[WHDebugToolManager sharedInstance] toggleWith:DebugToolTypeMemory | DebugToolTypeCPU | DebugToolTypeFPS];
    
//    [self creatSubViewCtr];
//
//    [self removeTabbar];
//
//    [self creatTabbar];
    
    [self setUpAllChildVc];
    
    //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
    MainTabbar *tabbar = [[MainTabbar alloc] init];
    tabbar.myDelegate = self;
    //kvc实质是修改了系统的_tabBar
    [self setValue:tabbar forKeyPath:@"tabBar"];
    
    
}


- (void)setUpAllChildVc{
    
    IndexViewController *HomeVC = [[IndexViewController alloc] init];
    [self setUpOneChildVcWithVc:HomeVC Image:@"home_normal" selectedImage:@"home_highlight" title:@"基础部分"];
    
    SecondFounctionVC *FishVC = [[SecondFounctionVC alloc] init];
    [self setUpOneChildVcWithVc:FishVC Image:@"fish_normal" selectedImage:@"fish_highlight" title:@"鱼塘"];
    
    FourFounctionVC *MessageVC = [[FourFounctionVC alloc] init];
    [self setUpOneChildVcWithVc:MessageVC Image:@"message_normal" selectedImage:@"message_highlight" title:@"消息"];
    
    FiveFounctionVC *MineVC = [[FiveFounctionVC alloc] init];
    [self setUpOneChildVcWithVc:MineVC Image:@"account_normal" selectedImage:@"account_highlight" title:@"我的"];
}

#pragma mark - 初始化设置tabBar上面单个按钮的方法
/**
 *
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:Vc];
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    Vc.navigationItem.title = title;
    [self addChildViewController:nav];
    
}

#pragma mark - LBTabBarDelegate
//点击中间按钮的代理方法
- (void)tabBarPlusBtnClick:(MainTabbar *)tabBar
{
    
    ThirdFounctionVC *plusVC = [[ThirdFounctionVC alloc] init];
    BaseNavigationController *navVc = [[BaseNavigationController alloc] initWithRootViewController:plusVC];
    [self presentViewController:navVc animated:YES completion:nil];
}

//- (void)creatSubViewCtr{
//
//    //创建第三级控制器
//    IndexViewController *index = [[IndexViewController alloc] init];
//    index.navigationItem.title = @"基础部分";
//
//    //创建第三级控制器
//    SecondFounctionVC *secondVC = [[SecondFounctionVC  alloc] init];
//    secondVC.navigationItem.title = @"底层部分";
//
//    //创建第三级控制器
//    ThirdFounctionVC *thirdVC = [[ThirdFounctionVC alloc] init];
//    thirdVC.navigationItem.title = @"功能部分";
//
//    FourFounctionVC *fourVC = [[FourFounctionVC alloc] init];
//    fourVC.navigationItem.title = @"三方部分";
//
//    FiveFounctionVC *fiveVC = [[FiveFounctionVC alloc] init];
//    fiveVC.navigationItem.title = @"牛逼部分";
//
//    NSArray *ctrls =@[index,secondVC,thirdVC,fourVC,fiveVC];
//
//    //存储导航控制器
//    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
//
//    for (UIViewController *ctrl in ctrls) {
//
//        //1.创建导航控制器(子类化导航控制器)
//        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:ctrl];
//        //2.把导航控制器加入到数组中
//        [array addObject:nav];
//    }
//    //把导航控制器交给标签控制器管理
//    self.viewControllers = array;
//}

//- (void)removeTabbar{
//
//    for (UIView *view in self.tabBar.subviews) {
//        Class c = NSClassFromString(@"UITabBarButton");
//        //判断view是不是由UITabBarButton类创建
//        if ([view isKindOfClass:c]) {
//            [view removeFromSuperview];
//        }
//    }
//}
//
//- (void)creatTabbar{
//
//    NSArray *titles = @[@"基础",@"底层",@"功能",@"三方",@"牛逼"];
//    //按钮宽度
//    CGFloat width = kScreenWidth / titles.count;
//
//    for (NSInteger i = 0; i < titles.count; i++) {
//
//        //取出标题
//        NSString *title =  titles[i];
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//
//        [btn setTitle:title forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
////        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
//        btn.frame = CGRectMake(i * width, 0, width, kTabBarHeight);
////        btn.backgroundColor = RandomColor;
//        btn.tag = i;
//
//        //调整标题的位置
//        btn.titleLabel.font = [UIFont systemFontOfSize:11];
//        //调整图片的位置
////        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 20, 0);
////        btn.titleEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 30);
//
//        [self.tabBar addSubview:btn];
//
//        if (i == 0) {
//            btn.selected = YES;
//            self.lastBtn = btn;
//        }
//
//        [self.tabBar addSubview:btn];
//    }
//}
//
////按钮点击事件
//- (void)clickAction:(UIButton *)btn{
//
//    if (self.lastBtn == btn) {
//        return;
//    }
//    //移动选中视图
//    [UIView animateWithDuration:.3 animations:^{
//        [self.lastBtn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    }];
//    self.lastBtn.selected = NO;
//    self.lastBtn = btn;
//    //切换子控制器
//    self.selectedIndex = btn.tag;
//}



/*
 -----------------tabbar中间凸起的思路-----------------
 
 tabbar的话也是遵循主流，自定义一个继承自系统UITabbar的LBTabbar，然后用KVC和系统的进行替换
 
 中间的凸起按钮和tabbar内部的子控件不是同一类型，是一个UIButton而已
 
 根据tabbar内部子控件的类型去调整内部子控件的位置，从而腾出一个中间位置给凸起按钮
 
 给tabbar弄一个代理，添加一个点击中间凸起按钮的代理方法，让LBTabBarController成为它的代理，实现对应代理方法即可实现按钮点击
 
 如果对以上步骤有不清楚的地方可以看代码或者随时咨询我哦，这篇文字主要讲的核心就是中间按钮点击
 1）要想监听整个发布按钮的点击，包括凸起部分点击也有反应，那么我是通过在自定义的LBTabbar内部重写- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)even方法来实现的
 2）我们都知道，凸起按钮是自定义的LBTabbar的子控件，默认情况下子控件尺寸如果超出父控件，那么超出的部分点击是没有反应的
 3）hitTest这个方法就是专门返回一个处理响应事件最合适view的，一般情况下我们不实现这个方法，默认就是让系统帮我们去判断处理事件响应最合适的view，一旦我们想要改变一下这种情况，我们就需要通过重写这个方法
 4）我们的需求是只要我们点击的point在凸起按钮的任何位置(无论是否超出tabbar)都可以有响应，那么我们首先需要判断这个point是否在凸起按钮自身上
 [self convertPoint:point toView:self.plusBtn]
 这句代码就是将当前tabbar的触摸点转换坐标系，转换到凸起按钮的身上，它会生成一个新的点，然后我们通过
 [self.plusBtn pointInside:newP withEvent:event]方法判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮，否则直接让系统帮我们处理点击事件就可以了
 5）对了，这里还有一步也是非常关键，因为我们重写了寻找最合适view的方法，那么我们还需要考虑什么情况下我们需要由我们自己选择最合适的view，什么情况下不需要，所以我们需要加一个判断if (self.isHidden == NO)，
 这句代码代表了当前页面是有tabbar的，那么肯定是在导航控制器的根控制器页面，这个时候就需要由我们自己选择最合适的view，其他的push页面直接让系统选择
 6）如果不做第五步判断，bug就是由导航控制器的根控制器页面push到其他页面后，点击该页面和tabbar凸起按钮同样的位置也会有反应
 
 */



@end
