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
#import "RunLoopVC.h"
#import "RootClassVC.h"
#import "BlockVarietySituationsVC.h"
#import "NSProxyNSObjectVC.h"
#import "RunTimeSummarizeVC.h"
#import "AnimationSummaryVC.h"
#import "PlaySummaryVC.h"
#import "MultithreadingVC.h"
#import "MessageSendVC.h"
#import "SMLagMonitorVC.h"
#import <GTCountSDK.h>
#import "RunloopVC2.h"

@interface SecondFounctionVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SecondFounctionVC

/* --爱奇艺新浪面试前总结
 1、block
 2、类方法、实例方法转发过程
 3、消息转发过程
 4、runtime
 5、runloop使用情景、写一个很多图片下载滑动不下载的demo
 6、gcd
 7、nsoperation、gcd和nsoperation区别
 8、实现kvo
 9、离屏渲染、优化过程
 10、属性、@synthesize
 11、ffmpeg
 */

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    eventId    自定义事件 Id，需要在个数后台配置才能生效
//    args    自定义属性，用于扩展统计需要
    [GTCountSDK trackCountEvent:@"002" withArgs:@{@"002":@"cvalue1"}];

}



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
        cell.textLabel.text = @"深浅拷贝";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"自动释放池";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"播放功能";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"RunTime总结";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"动画总结";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"Block";
    }else if (indexPath.row == 6){
        cell.textLabel.text = @"RunLoop";
    }else if (indexPath.row == 7){
        cell.textLabel.text = @"实例、类对象、元类";
    }else if (indexPath.row == 8){
        cell.textLabel.text = @"NSProxy和NSObject";
    }else if (indexPath.row == 9){
        cell.textLabel.text = @"多线程总结";
    }else if (indexPath.row == 10){
        cell.textLabel.text = @"消息转发";
    }else if (indexPath.row == 11){
        cell.textLabel.text = @"动态库和静态库";
    }else if (indexPath.row == 12){
        cell.textLabel.text = @"Runloop监控卡顿";
    }else if (indexPath.row == 13){
        cell.textLabel.text = @"Runloop创建常驻线程";
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
        
        CopyTypeVC *jd = [[CopyTypeVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 1){
        
        AutoreleasePoolVC *jd = [[AutoreleasePoolVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 2){
        
        PlaySummaryVC *jd = [[PlaySummaryVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 3){
        
        RunTimeSummarizeVC *jd = [[RunTimeSummarizeVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
        
    }else if (indexPath.row == 4){
        
        AnimationSummaryVC *jd = [[AnimationSummaryVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 5){
        
        BlockVarietySituationsVC *jd = [[BlockVarietySituationsVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 6){
        
        RunLoopVC *jd = [[RunLoopVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 7){
        
        RootClassVC *jd = [[RootClassVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
        
    }else if (indexPath.row == 8){
        
        NSProxyNSObjectVC *jd = [[NSProxyNSObjectVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 9){
        
        MultithreadingVC *jd = [[MultithreadingVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 10){
        
        MessageSendVC *jd = [[MessageSendVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 11){
        
        
    }else if (indexPath.row == 12){
        
        SMLagMonitorVC *jd = [[SMLagMonitorVC alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 13){
        
         RunloopVC2 *jd = [[RunloopVC2 alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 14){
        
        
    }else if (indexPath.row == 15){
        
        
    }else if (indexPath.row == 16){
        
        
    }else if (indexPath.row == 17){
        
        
    }else if (indexPath.row == 18){
        
        
    }
    
    
    
    
    
}



@end

