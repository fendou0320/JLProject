//
//  RetainCycleOneVC.m
//  JLProject
//
//  Created by UCS on 2018/7/29.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "RetainCycleOneVC.h"
#import "RetainCycleManager.h"

@interface RetainCycleOneVC ()
@property (nonatomic, strong) RetainCycleManager *manager;
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation RetainCycleOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.array = [NSMutableArray arrayWithCapacity:3];
    
    _manager = [[RetainCycleManager alloc] init];
    _manager.eatBlock = ^(int a, int b) {
        [_array addObject:@"001"];
    };
    [_manager beginToEat];
    
}



@end
