//
//  TemplateListView.m
//  JLProject
//
//  Created by UCS on 2017/6/2.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "TemplateListView.h"

@interface TemplateListView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end


@implementation TemplateListView

+ (instancetype)templateListViewWithFrame: (CGRect)frame{

    TemplateListView *listView = [[TemplateListView alloc] initWithFrame:frame];
    return listView;
}

- (id) initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        //创建UITableView
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        //设置数据源，注意必须实现对应的UITableViewDataSource协议
        _tableView.dataSource=self;
        _tableView.delegate = self;
        [self addSubview:_tableView];
        _tableView.backgroundColor = [UIColor greenColor];
        
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //创建label
    UILabel *leftLabel = [[UILabel alloc] init];
    leftLabel.textColor = [UIColor blackColor];
    leftLabel.textAlignment = NSTextAlignmentCenter;
    leftLabel.numberOfLines = 0;
    leftLabel.font = [UIFont systemFontOfSize:12.0f];
    [leftLabel sizeToFit];
    [cell.contentView addSubview:leftLabel];
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell);
        make.left.equalTo(cell.mas_left).with.offset(40/2);
        make.height.mas_equalTo(12.0f);
        //        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    leftLabel.text = @"进气管温度：";
    
    UILabel *rightLabel = [[UILabel alloc] init];
    rightLabel.textColor = [UIColor blackColor];
    rightLabel.textAlignment = NSTextAlignmentCenter;
    rightLabel.numberOfLines = 0;
    rightLabel.font = [UIFont systemFontOfSize:12.0f];
    [rightLabel sizeToFit];
    [cell.contentView addSubview:rightLabel];
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell);
        make.left.equalTo(leftLabel.mas_right).with.offset(10/2);
        make.height.mas_equalTo(12.0f);
        //        make.size.mas_equalTo(CGSizeMake(TemplateOneViewTitleWidth, TemplateOneViewTitleFont));
    }];
    rightLabel.text = @"正常";
    //判断奇偶
    if (indexPath.row % 2 == 0) {
        cell.contentView.backgroundColor = [UIColor grayColor];
    }else{
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 0.001f;
//}


@end
