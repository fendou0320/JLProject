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
//#import "JLGifPlayerTool.h"
//#import "UITabBarItem+JLTabBarItem.h"
//#import "UIBarItem+JLBarItem.h"
//#import "UITabBar+JLTabbar.h"

@interface MainViewController ()<UITabBarControllerDelegate>
//{
//    JLGifPlayerTool *addGifView;//加载gif名
//}
@property (nonatomic, strong) UIButton *lastBtn;
@property(nonatomic,strong) NSArray *stocks;
@property(nonatomic,strong) UITableView *stockTable;

@property (nonatomic,assign) NSInteger index;

@end

@implementation MainViewController

- (void)datachanged {
    
}

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
    
    self.delegate = self;
    
    [self setUpAllChildVc];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
                                                        
                                                        NSForegroundColorAttributeName : [UIColor redColor]
                                                        
                                                        } forState:UIControlStateSelected];
    
    //设置tabbar  未选中文字的颜色
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:10.0f],
                                                        
                                                        NSForegroundColorAttributeName : [UIColor colorWithRed:145/255.0 green:158/255.0 blue:180/255.0 alpha:1]
                                                        
                                                        } forState:UIControlStateNormal];
    
}


- (void)setUpAllChildVc{
    
    IndexViewController *HomeVC = [[IndexViewController alloc] init];
    [self setUpOneChildVcWithVc:HomeVC Image:@"home_normal" selectedImage:@"home_highlight" title:@"UI部分"];
    
    SecondFounctionVC *FishVC = [[SecondFounctionVC alloc] init];
    [self setUpOneChildVcWithVc:FishVC Image:@"fish_normal" selectedImage:@"fish_highlight" title:@"底层部分"];
    
    ThirdFounctionVC *thirdVC = [[ThirdFounctionVC alloc] init];
    [self setUpOneChildVcWithVc:thirdVC Image:@"post_normal" selectedImage:@"post_normal" title:@"功能部分"];
    
    FourFounctionVC *MessageVC = [[FourFounctionVC alloc] init];
    [self setUpOneChildVcWithVc:MessageVC Image:@"message_normal" selectedImage:@"message_highlight" title:@"算法部分"];
    
    FiveFounctionVC *MineVC = [[FiveFounctionVC alloc] init];
    [self setUpOneChildVcWithVc:MineVC Image:@"account_normal" selectedImage:@"account_highlight" title:@"超级牛逼"];
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
    
    
    Vc.tabBarItem.selectedImage = mySelectedImage;//[UIImage sd_animatedGIFNamed:@"jr_tab_1_1_1"];
    
    Vc.tabBarItem.title = title;
    Vc.navigationItem.title = title;
    [self addChildViewController:nav];
    
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
//    NSString *gifName = @"";
//    if (self.selectedIndex == 0) {
//        gifName = @"home";
//    }
//    else if (self.selectedIndex == 1) {
//        gifName = @"epluse";
//    }
//    else if (self.selectedIndex == 4) {
//        gifName = @"Mine";
//    }
//    if (gifName.length>0) {
//        JLGifPlayerTool *addGif =  [[JLGifPlayerTool alloc]init];
//        if (addGifView) {
//            [addGifView remove];
//        }
//        [addGif startAnimateGifMethod:gifName toView:viewController.tabBarItem.gs_imageView];
//        addGifView = addGif;
//    }
}

// 点击tabbarItem自动调用
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
//    NSInteger index = [self.tabBar.items indexOfObject:item];
////
//    if (index != _index) {
////        [self animationWithIndex:index];
//        [self tabBarImageAnimation:index];
//        _index = index;
//    }
    
}

////第一种方法：通过接收点击事件对每个tabbar item的点击都执行动画
//- (void)animationWithIndex:(NSInteger) index {
//    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
//    for (UIView *tabBarButton in self.tabBar.subviews) {
//        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            [tabbarbuttonArray addObject:tabBarButton];
//        }
//    }
//    /**
//     CABasicAnimation类的使用方式就是基本的关键帧动画。
//     所谓关键帧动画，就是将Layer的属性作为KeyPath来注册，指定动画的起始帧和结束帧，然后自动计算和实现中间的过渡动画的一种动画方式。
//     */
//    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    pulse.duration = 0.2;
//    pulse.repeatCount= 1;
//    pulse.autoreverses= YES;
//    pulse.fromValue= [NSNumber numberWithFloat:0.7];
//    pulse.toValue= [NSNumber numberWithFloat:1.3];
//    [[tabbarbuttonArray[index] layer]
//     addAnimation:pulse forKey:nil];
//}
//
////第二种方法：只想对某一个item的点击执行动画，且只有图片动，文字不动。并且其余图标的点击不带动画
//- (void)tabBarImageAnimation:(NSInteger) index{
//
//    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
//    for (UIView *tabBarButton in self.tabBar.subviews) {
//        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            [tabbarbuttonArray addObject:tabBarButton];
//        }
//    }
//    UIView *tabBarButton = tabbarbuttonArray[index];
//    for (UIControl *tabBarButtonItem in tabBarButton.subviews) {
////        if ([tabBarButtonItem isKindOfClass:NSClassFromString(@"UITabBarButtonLabel")]) {
////            UILabel *label = (UILabel *)tabBarButtonItem;
////        }
////        if ([tabBarButtonItem isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
////            //---将下面的动画代码块拷贝到此并修改最后一行addAnimation的layer对象即可---
////            UIImageView *imageView = (UIImageView *)tabBarButtonItem;
////            //添加动画
////            [UIView animateWithDuration:0.5 animations:^{
////                imageView.image = [UIImage imageNamed:@"1"];
////                imageView.image = [UIImage imageNamed:@"2"];
////                imageView.image = [UIImage imageNamed:@"3"];
////                imageView.image = [UIImage imageNamed:@"4"];
////                imageView.image = [UIImage imageNamed:@"5"];
////                imageView.image = [UIImage imageNamed:@"6"];
////            } completion:^(BOOL finished) {
////
////            }];
////        }
//    }
//}


/*
 
 1、带重力效果的弹跳
 CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
 //通过初中物理重力公式计算出的位移y值数组
 animation.values = @[@0.0, @-4.15, @-7.26, @-9.34, @-10.37, @-9.34, @-7.26, @-4.15, @0.0, @2.0, @-2.9, @-4.94, @-6.11, @-6.42, @-5.86, @-4.44, @-2.16, @0.0];
 animation.duration = 0.8;
 animation.beginTime = CACurrentMediaTime() + 1;
 [imageView.layer addAnimation:animation forKey:nil];
 
 2、先放大，再缩小
 //放大效果，并回到原位
 CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
 //速度控制函数，控制动画运行的节奏
 animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
 animation.duration = 0.2;       //执行时间
 animation.repeatCount = 1;      //执行次数
 animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
 animation.fromValue = [NSNumber numberWithFloat:0.7];   //初始伸缩倍数
 animation.toValue = [NSNumber numberWithFloat:1.3];     //结束伸缩倍数
 [[arry[index] layer] addAnimation:animation forKey:nil];
 
 3、Z轴旋转
 //z轴旋转180度
 CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
 //速度控制函数，控制动画运行的节奏
 animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
 animation.duration = 0.2;       //执行时间
 animation.repeatCount = 1;      //执行次数
 animation.removedOnCompletion = YES;
 animation.fromValue = [NSNumber numberWithFloat:0];   //初始伸缩倍数
 animation.toValue = [NSNumber numberWithFloat:M_PI];     //结束伸缩倍数
 [[arry[index] layer] addAnimation:animation forKey:nil];
 
 4、Y轴位移
 //向上移动
 CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
 //速度控制函数，控制动画运行的节奏
 animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
 animation.duration = 0.2;       //执行时间
 animation.repeatCount = 1;      //执行次数
 animation.removedOnCompletion = YES;
 animation.fromValue = [NSNumber numberWithFloat:0];   //初始伸缩倍数
 animation.toValue = [NSNumber numberWithFloat:-10];     //结束伸缩倍数
 [[arry[index] layer] addAnimation:animation forKey:nil];
 
 5、放大并保持
 //放大效果
 CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
 //速度控制函数，控制动画运行的节奏
 animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
 animation.duration = 0.2;       //执行时间
 animation.repeatCount = 1;      //执行次数
 animation.removedOnCompletion = NO;
 animation.fillMode = kCAFillModeForwards;           //保证动画效果延续
 animation.fromValue = [NSNumber numberWithFloat:1.0];   //初始伸缩倍数
 animation.toValue = [NSNumber numberWithFloat:1.15];     //结束伸缩倍数
 [[arry[index] layer] addAnimation:animation forKey:nil];
 //移除其他tabbar的动画
 for (int i = 0; i<arry.count; i++) {
 if (i != index) {
 [[arry[i] layer] removeAllAnimations];
 }
 }
 
 */


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
