//
//  MainViewController.m
//  UcsProject
//
//  Created by UCS on 2017/5/3.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "MainViewController.h"
#import "IndexViewController.h"
#import "JianboViewController.h"
#import "OtherViewController.h"
#import "BaseNavigationController.h"

@interface MainViewController ()
@property (nonatomic, strong) UIButton *lastBtn;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatSubViewCtr];
    [self removeTabbar];
    [self creatTabbar];
}

- (void)creatSubViewCtr{
    
    //创建第三级控制器
    IndexViewController *index = [[IndexViewController alloc] init];
    index.navigationItem.title = @"Index";
    
    //创建第三级控制器
    JianboViewController *jianbo = [[JianboViewController  alloc] init];
    jianbo.navigationItem.title = @"Second";
    
    //创建第三级控制器
    OtherViewController *other = [[OtherViewController alloc] init];
    other.navigationItem.title = @"Three";
    
    
    NSArray *ctrls =@[index,jianbo,other];
    
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
    
    NSArray *titles = @[@"Index",@"Second",@"Three"];
    //按钮宽度
    CGFloat width = kScreenWidth / titles.count;
    
    for (NSInteger i = 0; i < titles.count; i++) {
        
        //取出标题
        NSString *title =  titles[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(i * width, 0, width, kTabBarHeight);
        btn.backgroundColor = RandomColor;
        btn.tag = i;
        
        //调整标题的位置
        btn.titleLabel.font = [UIFont systemFontOfSize:11];
        //调整图片的位置
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 20, 0);
        
        btn.titleEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 30);
        [self.tabBar addSubview:btn];
        
        if (i == 0) {
            [btn setTitleColor:[UIColor redColor]forState:UIControlStateNormal];
            self.lastBtn = btn;
        }
        
        [self.tabBar addSubview:btn];
    }
}

//按钮点击事件
- (void)clickAction:(UIButton *)btn{
    
    //移动选中视图
    [UIView animateWithDuration:.3 animations:^{
        
        [self.lastBtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor]forState:UIControlStateNormal];
        self.lastBtn = btn;
    }];
    //切换子控制器
    self.selectedIndex = btn.tag;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
