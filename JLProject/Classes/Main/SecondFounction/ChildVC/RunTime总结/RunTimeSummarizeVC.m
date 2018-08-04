//
//  RunTimeSummarizeVC.m
//  JLProject
//
//  Created by UCS on 2018/8/4.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "RunTimeSummarizeVC.h"
#import "RunTimeUseCaseVC.h"
#import "MessageForwardingVC.h"
#import "MethodSwizzlingVC.h"
#import "AssociatedObjectsVC.h"
#import "ArchivingVC.h"

#import "CategoryAddPropertyVC.h"
#import "CategoryAddPropertyVC+Person.h"

#import "RunTimeKVOVC.h"

@interface RunTimeSummarizeVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RunTimeSummarizeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建一个分组样式的UITableView
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
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
    
    return k_TableCellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    //    cell.backgroundColor = RandomColor1;
    
    if (indexPath.row == 0){
        cell.textLabel.text = @"分类添加属性";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"用RunTime实现KVO";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"归档、解档和序列化、反序列化";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"RunTime使用情景";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"消息转发";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"MethodSwizzling的使用";
    }else if (indexPath.row == 6){
        cell.textLabel.text = @"associated objects--关联对象";
    }else if (indexPath.row == 7){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 8){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 9){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 10){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 11){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 12){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 13){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 14){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 15){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 16){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 17){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 18){
        cell.textLabel.text = @"";
    }else if (indexPath.row == 19){
        
    }
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0){
        
        CategoryAddPropertyVC *jd = [[CategoryAddPropertyVC alloc] init];
        jd.age = @"100岁";
        jd.name = @"gancao";
        jd.offset = 50.10;
        jd.point = CGPointMake(100, 200);
        NSLog(@"---%@---", jd.age);
        NSLog(@"name---%@---", jd.name);
        NSLog(@"name---%f---", jd.offset);
        NSLog(@"name---%@---", NSStringFromCGPoint(jd.point));
        [self.navigationController pushViewController:jd animated:YES];
        
      
    }else if (indexPath.row == 1){
        
        RunTimeKVOVC *jd = [[RunTimeKVOVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 2){
        
        ArchivingVC *jd = [[ArchivingVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
        
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
        
 
    }else if (indexPath.row == 8){
        
        
    }else if (indexPath.row == 9){
        
        
        
    }else if (indexPath.row == 10){
        
        
        
    }else if (indexPath.row == 11){
        
      
        
    }else if (indexPath.row == 12){
        
       
        
    }else if (indexPath.row == 13){
        
      
    }else if (indexPath.row == 14){
        
       
        
    }else if (indexPath.row == 15){
        
       
    }else if (indexPath.row == 16){
        
     
    }else if (indexPath.row == 17){
        
      
    }else if (indexPath.row == 18){
        

    }
    
    
}


@end
