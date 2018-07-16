//
//  ZuoYouViewController.m
//  JLProject
//
//  Created by UCS on 2017/6/13.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "ZuoYouViewController.h"

#import "TableOne.h"
#import "TableTwo.h"

@interface ZuoYouViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak)UITableView *one;
@property (nonatomic, weak)UITableView *two;
@end

@implementation ZuoYouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor redColor];
    
    //创建一个分组样式的UITableView
    UITableView *one = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, 150, 300) style:UITableViewStylePlain];
    one.dataSource=self;
    one.delegate = self;
    [self.view addSubview:one];
    self.one = one;
    
    UITableView *two = [[UITableView alloc]initWithFrame:CGRectMake(155, 100, 150, 300) style:UITableViewStylePlain];
    two.dataSource=self;
    two.delegate = self;
    [self.view addSubview:two];
    self.two = two;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 13;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"简单折线图";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"复杂折线图";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"简单圆环";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"复杂动态圆环";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"简单柱状图";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"复杂柱状图";
    }else if (indexPath.row == 6){
        cell.textLabel.text = @"折线图01";
    }else if (indexPath.row == 7){
        cell.textLabel.text = @"封装视图one";
    }else if (indexPath.row == 8){
        cell.textLabel.text = @"信息列表视图";
    }else if (indexPath.row == 9){
        cell.textLabel.text = @"topview";
    }else if (indexPath.row == 10){
        cell.textLabel.text = @"webview";
    }else if (indexPath.row == 11){
        cell.textLabel.text = @"散点";
    }else if (indexPath.row == 12){
        cell.textLabel.text = @"折线图不从圆点开始";
    }else if (indexPath.row == 13){
        cell.textLabel.text = @"左右联动";
    }
    
    
    return cell;
}



//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    
//    NSLog(@"%@", scrollView);
//    
//    if (scrollView == self.one){
//        
//        [self.two setContentOffset:CGPointMake(0, scrollView.contentOffset.y) animated:YES];
//    }
//    
//}


//- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
//{
//    if (tableView == self.one) {
//        
//        [self.two selectRowAtIndexPath:[NSIndexPath indexPathForItem:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
//       
//    }
//}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView == self.one) {
        
        [self.two setContentOffset:self.one.contentOffset];
        
    }else{
        
        [self.one setContentOffset:self.two.contentOffset];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
