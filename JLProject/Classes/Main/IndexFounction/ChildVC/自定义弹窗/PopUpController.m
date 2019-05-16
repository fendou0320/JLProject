//
//  PopUpController.m
//  JLProject
//
//  Created by jiangliang on 2018/9/12.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "PopUpController.h"
#import "YCMenuView.h"
#import "CustomPopUpView.h"

@interface PopUpController ()
@property (nonatomic, strong) NSArray *arr;
@end

@implementation PopUpController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"fish_highlight"];

    YCMenuAction *action = [YCMenuAction actionWithTitle:@"首页" image:image handler:^(YCMenuAction *action) {
        NSLog(@"点击了%@",action.title);
    }];
    YCMenuAction *action1 = [YCMenuAction actionWithTitle:@"个人" image:image handler:^(YCMenuAction *action) {
        NSLog(@"点击了%@",action.title);
    }];
    YCMenuAction *action2 = [YCMenuAction actionWithTitle:@"最新" image:image handler:^(YCMenuAction *action) {
        NSLog(@"点击了%@",action.title);
    }];
    YCMenuAction *action3 = [YCMenuAction actionWithTitle:@"搜索页" image:image handler:^(YCMenuAction *action) {
        NSLog(@"点击了%@",action.title);
    }];
    YCMenuAction *action4 = [YCMenuAction actionWithTitle:@"新闻页" image:image handler:^(YCMenuAction *action) {
        NSLog(@"点击了%@",action.title);
    }];
    
    self.arr = @[action,action1,action2,action3,action4,action,action1,action2];
    
    [self.btnOne setTitle:@"样式一" forState:UIControlStateNormal];
    
    [self.btnTwo setTitle:@"样式二" forState:UIControlStateNormal];

}

- (void)btnOne: (UIButton *)sender{
    
    NSString *titleString = @"最新鲜的自选股相关新闻-智能舆情、微博财经KOL独家牛眼解盘-大V点评、新浪模拟交易四星股神调仓信息及时捕捉-高手操作以及AI多空信号全把握-操盘K线，助您全方位盯盘，把握毫秒操作时机";
    CustomPopUpView *popUpView = [CustomPopUpView customPopUpViewWithWidth:kScreenWidth-24 titleString:titleString titleFont:[UIFont systemFontOfSize:12] relyonView:sender];
    [popUpView show];
}

- (void)btnTwo: (UIButton *)sender{
    
    YCMenuView *view = [YCMenuView menuWithActions:self.arr width:140 relyonView:sender];
    view.maxDisplayCount = 10;
    [view show];
}

- (void)btnThree: (UIButton *)sender{
   
   
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.navigationBar animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = NSLocalizedString(@"Message here!", @"HUD message title");
    hud.offset = CGPointMake(0.f, -kScreenHeight/2);//MBProgressMaxOffset
    [hud hideAnimated:YES afterDelay:3.f];

 
    
}

- (void)btnFour: (UIButton *)sender{
    
 
    
}










@end
