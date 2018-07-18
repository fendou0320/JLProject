//
//  SecondFounctionVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/13.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "SecondFounctionVC.h"
#import "CopyTypeVC.h"
#import "AutoreleasePoolVC.h"
#import "RunTimeUseCaseVC.h"
#import "MessageForwardingVC.h"
#import "MethodSwizzlingVC.h"
#import "AssociatedObjectsVC.h"
#import "ArchivingVC.h"
#import "RunLoopVC.h"

@interface SecondFounctionVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SecondFounctionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //创建一个分组样式的UITableView
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
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
    
    if (indexPath.row == 0){
        cell.textLabel.text = @"深浅拷贝";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"自动释放池";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"后台播放和锁屏播放";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"RunTime使用情景";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"消息的转发和实现";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"MethodSwizzling 黑魔法";
    }else if (indexPath.row == 6){
        cell.textLabel.text = @"AssociatedObjectsVC关联对象";
    }else if (indexPath.row == 7){
        cell.textLabel.text = @"归档、解档和序列化、反序列化";
    }else if (indexPath.row == 8){
        cell.textLabel.text = @"RunLoop";
    }else if (indexPath.row == 9){
        cell.textLabel.text = @"下载功能";
    }else if (indexPath.row == 10){
        cell.textLabel.text = @"后台播放和锁屏播放";
    }else if (indexPath.row == 11){
        cell.textLabel.text = @"";
    }
    
 
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0){
        
        CopyTypeVC *jd = [[CopyTypeVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 1){
        
        AutoreleasePoolVC *jd = [[AutoreleasePoolVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 2){
        
     
    }else if (indexPath.row == 3){
        
        RunTimeUseCaseVC *jd = [[RunTimeUseCaseVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 4){
        
        MessageForwardingVC *jd = [[MessageForwardingVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 5){
        
        MethodSwizzlingVC *jd = [[MethodSwizzlingVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 6){
        
        AssociatedObjectsVC *jd = [[AssociatedObjectsVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 7){
        
        ArchivingVC *jd = [[ArchivingVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 8){
        
        RunLoopVC *jd = [[RunLoopVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }
    
    
    
    
    
}



@end