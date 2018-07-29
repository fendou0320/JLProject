//
//  CacheCleanerPlugin.m
//  JLProject
//
//  Created by UCS on 2018/7/29.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "CacheCleanerPlugin.h"

@implementation CacheCleanerPlugin

- (void)memoryProfilerDidMarkNewGeneration {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

@end
