//
//  TableOne.m
//  JLProject
//
//  Created by UCS on 2017/6/13.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "TableOne.h"

//@interface TableOne ()<UITableViewDelegate,UITableViewDataSource>
//@property (nonatomic, strong) UITableView *tableView;
//@end


@implementation TableOne




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


@end
