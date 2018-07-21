//
//  AsdkVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/21.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "AsdkVC.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface AsdkVC ()
@property (nonatomic, strong) ASTableNode *talbeNode;
@end

@implementation AsdkVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _talbeNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
