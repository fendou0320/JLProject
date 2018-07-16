//
//  LineChatVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/15.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "LineChatVC.h"

#import "JDzhexianController.h"
#import "FZzhexianController.h"
#import "JDyuanhuanController.h"
#import "FZyuanhuanController.h"
#import "JDzhuzhuangController.h"
#import "FZzhuzhuangController.h"
#import "ZXTUViewController.h"
#import "TemplateOneViewController.h"

#import "TemplateListViewController.h"

#import "TopViewController.h"
#import "SandianViewController.h"
#import "NotYUANDIANViewController.h"

#import "ZuoYouViewController.h"
#import "IndexLineChatTypeOneController.h"

#import "TableViewOpenController.h"
#import "PictureViewController.h"
#import "PictureTwoController.h"
#import "PictureThreeController.h"

#import "PictureFourViewController.h"

@interface LineChatVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LineChatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;
    
    //MARK    method for handing memry managemrnt（方法）
    //TODO    通知更新需要做的事情
    //FIXME   你想要修改的bug
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
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
    
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    //    cell.backgroundColor = RandomColor1;
    
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
    }else if (indexPath.row == 14){
        cell.textLabel.text = @"等比例折线图";
    }else if (indexPath.row == 15){
        cell.textLabel.text = @"三段比例折线图";
    }else if (indexPath.row == 16){
        cell.textLabel.text = @"数值确定折线图";
    }else if (indexPath.row == 17){
        cell.textLabel.text = @"tableview的展开和关闭";
    }else if (indexPath.row == 18){
        cell.textLabel.text = @"图片当大";
    }else if (indexPath.row == 19){
        cell.textLabel.text = @"图片当大123";
    }else if (indexPath.row == 20){
        cell.textLabel.text = @"图片当大123456";
    }else if (indexPath.row == 21){
        cell.textLabel.text = @"图片当大1234568494";
    }else if (indexPath.row == 22){
        cell.textLabel.text = @"webviewone";
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        JDzhexianController *jd = [[JDzhexianController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
    }else if (indexPath.row == 1){
        FZzhexianController *jd = [[FZzhexianController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
    }else if (indexPath.row == 2){
        JDyuanhuanController *jd = [[JDyuanhuanController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
    }else if (indexPath.row == 3){
        FZyuanhuanController *jd = [[FZyuanhuanController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
    }else if (indexPath.row == 4){
        JDzhuzhuangController *jd = [[JDzhuzhuangController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
    }else if (indexPath.row == 5){
        FZzhuzhuangController *jd = [[FZzhuzhuangController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
    }else if (indexPath.row == 6){
        ZXTUViewController *zxtu = [[ZXTUViewController alloc] init];
        [self.navigationController pushViewController:zxtu animated:YES];
    }else if (indexPath.row == 7){
        TemplateOneViewController *tempone = [[TemplateOneViewController alloc] init];
        [self.navigationController pushViewController:tempone animated:YES];
    }else if (indexPath.row == 8){
        
        TemplateListViewController *tempone = [[TemplateListViewController alloc] init];
        [self.navigationController pushViewController:tempone animated:YES];
    }else if (indexPath.row == 9){
        
        TopViewController *top = [[TopViewController alloc] init];
        [self.navigationController pushViewController:top animated:YES];
    }else if (indexPath.row == 10){
        
        //        WebViewController *top = [[WebViewController alloc] init];
        //        [self.navigationController pushViewController:top animated:YES];
    }else if (indexPath.row == 11){
        
        SandianViewController *top = [[SandianViewController alloc] init];
        [self.navigationController pushViewController:top animated:YES];
    }else if (indexPath.row == 12){
        
        NotYUANDIANViewController *top = [[NotYUANDIANViewController alloc] init];
        [self.navigationController pushViewController:top animated:YES];
    }else if (indexPath.row == 13){
        
        ZuoYouViewController *zuoyou = [[ZuoYouViewController alloc] init];
        [self.navigationController pushViewController:zuoyou animated:YES];
    }else if (indexPath.row == 14){
        
        IndexLineChatTypeOneController *zuoyou = [[IndexLineChatTypeOneController alloc] init];
        [self.navigationController pushViewController:zuoyou animated:YES];
    }else if (indexPath.row == 15){
        
        IndexLineChatTypeOneController *zuoyou = [[IndexLineChatTypeOneController alloc] init];
        [self.navigationController pushViewController:zuoyou animated:YES];
    }else if (indexPath.row == 16){
        
        IndexLineChatTypeOneController *zuoyou = [[IndexLineChatTypeOneController alloc] init];
        [self.navigationController pushViewController:zuoyou animated:YES];
    }else if (indexPath.row == 17){
        
        TableViewOpenController *zuoyou = [[TableViewOpenController alloc] init];
        [self.navigationController pushViewController:zuoyou animated:YES];
    }else if (indexPath.row == 18){
        
        PictureViewController *pic = [[PictureViewController alloc] init];
        [self.navigationController pushViewController:pic animated:YES];
    }else if (indexPath.row == 19){
        
        PictureTwoController *pic = [[PictureTwoController alloc] init];
        [self.navigationController pushViewController:pic animated:YES];
    }else if (indexPath.row == 20){
        
        PictureThreeController *pic = [[PictureThreeController alloc] init];
        [self.navigationController pushViewController:pic animated:YES];
    }else if (indexPath.row == 21){
        
        PictureFourViewController *pic = [[PictureFourViewController alloc] init];
        [self.navigationController pushViewController:pic animated:YES];
        
    }else if (indexPath.row == 22){
        
        
        
    }
    
}

@end
