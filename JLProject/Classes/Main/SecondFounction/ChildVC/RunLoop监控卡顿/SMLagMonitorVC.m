//
//  SMLagMonitorVC.m
//  JLProject
//
//  Created by jiangliang on 2019/11/4.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "SMLagMonitorVC.h"
#import "SMLagMonitor.h"

@interface SMLagMonitorVC ()

@end

@implementation SMLagMonitorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"runloop 监控卡顿";
    
    [[SMLagMonitor shareIntance] beginMonitor];
    
}




@end
