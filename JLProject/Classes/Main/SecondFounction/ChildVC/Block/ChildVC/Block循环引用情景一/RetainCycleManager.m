//
//  RetainCycleManager.m
//  JLProject
//
//  Created by UCS on 2018/7/29.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "RetainCycleManager.h"

@implementation RetainCycleManager


- (void)beginToEat{
    if (self.eatBlock) {
        self.eatBlock(100, 200);
    }
}


@end
