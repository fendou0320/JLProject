//
//  SMLagMonitor.h
//  JLProject
//
//  Created by jiangliang on 2019/11/4.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 
 */
@interface SMLagMonitor : NSObject

+ (instancetype)shareIntance;

- (void)beginMonitor;

@end

NS_ASSUME_NONNULL_END
