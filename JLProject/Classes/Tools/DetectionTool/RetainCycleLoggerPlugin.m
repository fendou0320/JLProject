//
//  RetainCycleLoggerPlugin.m
//  JLProject
//
//  Created by UCS on 2018/7/29.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "RetainCycleLoggerPlugin.h"

@implementation RetainCycleLoggerPlugin

- (void)memoryProfilerDidFindRetainCycles:(NSSet *)retainCycles
{
    if (retainCycles.count > 0)
    {
        NSLog(@"\nretainCycles = \n%@", retainCycles);
    }
}

@end
