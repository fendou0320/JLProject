//
//  DongHuaViewController.m
//  JLVideoPlayer
//
//  Created by UCS on 2017/4/24.
//  Copyright © 2017年 WangJiangliang. All rights reserved.
//

#import "DongHuaViewController.h"
#import "DropViewController.h"
#import "GiftEffectViewController.h"
#import "DazViewController.h"
#import "SprayViewController.h"
#import "SnowViewController.h"
#import "JRAccountLoadingVC.h"
#import "JLlayerVC.h"
#import "LottieVC.h"

@interface DongHuaViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSArray *titles;
@end

static NSString *reuseIdentifier = @"reuserCell";


@implementation DongHuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.tabBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"效果集合";
    [self _initTabelView];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void) _initTabelView{
    _titles = @[@"粒子掉落",@"直播礼物冒泡效果",@"烟花效果",@"喷射效果",@"雪花飘落",@"新浪金融账户动画效果",@"layer", @"Lottie 动画"];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.tableFooterView = [[UIView alloc] init];
    [tableView setExclusiveTouch:YES];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = _titles[indexPath.row];
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:{
            [self.navigationController pushViewController:[[DropViewController alloc] init] animated:YES];
            break;
        }
        case 1:{
            [self.navigationController pushViewController:[[GiftEffectViewController alloc] init] animated:YES];
            break;
        }
        case 2:{
            [self.navigationController pushViewController:[[DazViewController alloc] init] animated:YES];
            break;
        }
        case 3:{
            [self.navigationController pushViewController:[[SprayViewController alloc] init] animated:YES];
            break;
        }
        case 4:{
            [self.navigationController pushViewController:[[SnowViewController alloc] init] animated:YES];
            break;
        }
        case 5:{
            [self.navigationController pushViewController:[[JRAccountLoadingVC alloc] init] animated:YES];
            break;
        }
        case 6:{
            [self.navigationController pushViewController:[[JLlayerVC alloc] init] animated:YES];
            break;
        }
        case 7:{
            [self.navigationController pushViewController:[[LottieVC alloc] init] animated:YES];
            break;
        }
        default:
            break;
    }
    
    
}

@end
