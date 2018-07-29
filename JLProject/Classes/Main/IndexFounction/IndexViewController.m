//
//  IndexViewController.m
//  UcsProject
//
//  Created by UCS on 2017/5/3.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "IndexViewController.h"
#import "HistogramVC.h"
#import "LineChatVC.h"
#import "UIThirdVC.h"
#import "UIEncapsulationVC.h"
#import "UISystemVC.h"
#import "KeyBoardVC.h"
#import "RichTextVC.h"

#import "DongHuaViewController.h"
#import "WKWebDemoController.h"
#import "BoWenShuiQiuController.h"

@interface IndexViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;
    
//MARK:    method for handing memry managemrnt（方法）
//TODO:     通知更新需要做的事情
//FIXME:    你想要修改的bug
    
    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    NSLog(@"唯一标示符%@", identifierForVendor);
    
    //抛出异常
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:1];
    if (!array) {
        // 抛出异常方式一
        NSException *excp = [NSException exceptionWithName:@"UrlError" reason:@"传入的url有异常！" userInfo:@{@"":@""}];
        // 抛出异常
        [excp raise];
        // 抛出异常方式二
        @throw [NSException exceptionWithName:@"UrlError" reason:@"传入的url有异常！" userInfo:nil];
    }
 
    
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return k_TableCellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    cell.backgroundColor = RandomColor1;
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"柱状图";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"折线图";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"UI三方控件";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"UI封装";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"UI系统控件";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"键盘";
    }else if (indexPath.row == 6){
        cell.textLabel.text = @"富文本";
    }else if (indexPath.row == 7){
        
    }else if (indexPath.row == 8){
        
    }else if (indexPath.row == 9){

    }else if (indexPath.row == 10){
        cell.textLabel.text = @"各种动画";
    }else if (indexPath.row == 11){
        cell.textLabel.text = @"水波纹圆球";
    }else if (indexPath.row == 12){
        cell.textLabel.text = @"WKwebview";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        HistogramVC *vc = [[HistogramVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        LineChatVC *vc = [[LineChatVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        UIThirdVC *vc = [[UIThirdVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        UIEncapsulationVC *vc = [[UIEncapsulationVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        UISystemVC *vc = [[UISystemVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 5){
        KeyBoardVC *vc = [[KeyBoardVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 6){
        RichTextVC *vc = [[RichTextVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 7){
        
    }else if (indexPath.row == 8){
        
    }else if (indexPath.row == 9){
        
    }else  if (indexPath.row == 10){
        
        DongHuaViewController *donghua = [[DongHuaViewController alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 11){
        
        BoWenShuiQiuController *donghua = [[BoWenShuiQiuController alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 12){
        
        WKWebDemoController *donghua = [[WKWebDemoController alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }

}








/*
 
 - (void)creatSubView{
 
 UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
 btn.frame = CGRectMake(0, 150, kScreenWidth, SIZE_IPHONE6(50));
 [self.view addSubview:btn];
 btn.backgroundColor = RandomColor;
 [btn setTitle:@"1" forState:UIControlStateNormal];
 [btn addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
 
 UIButton *btntwo = [UIButton buttonWithType:UIButtonTypeCustom];
 btntwo.frame = CGRectMake(0, SIZE_IPHONE6(250), kScreenWidth, SIZE_IPHONE6(50));
 [self.view addSubview:btntwo];
 btntwo.backgroundColor = RandomColor;
 [btntwo setTitle:@"2" forState:UIControlStateNormal];
 [btntwo addTarget:self action:@selector(btnTwo:) forControlEvents:UIControlEventTouchUpInside];
 
 UIButton *btnthree = [UIButton buttonWithType:UIButtonTypeCustom];
 btnthree.frame = CGRectMake(0, SIZE_IPHONE6(350), kScreenWidth, SIZE_IPHONE6(50));
 [self.view addSubview:btnthree];
 btnthree.backgroundColor = RandomColor;
 [btnthree setTitle:@"3" forState:UIControlStateNormal];
 [btnthree addTarget:self action:@selector(demoShow:) forControlEvents:UIControlEventTouchUpInside];
 
 UIButton *btnFour = [UIButton buttonWithType:UIButtonTypeCustom];
 btnFour.frame = CGRectMake(0, SIZE_IPHONE6(450), kScreenWidth, SIZE_IPHONE6(50));
 [self.view addSubview:btnFour];
 btnFour.backgroundColor = RandomColor;
 [btnFour setTitle:@"4" forState:UIControlStateNormal];
 [btnFour addTarget:self action:@selector(btnFour:) forControlEvents:UIControlEventTouchUpInside];
 
 }
 
 - (void)btnOne: (UIButton *)sender{
 
 }
 
 
 - (void)btnTwo: (UIButton *)sender{
 
 
 }
 
 - (void)demoShow: (UIButton *)sender{
 
 }
 
 - (void)btnFour: (UIButton *)sender{
 
 }

 */







@end
