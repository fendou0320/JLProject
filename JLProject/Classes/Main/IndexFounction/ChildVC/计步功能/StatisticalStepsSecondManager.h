//
//  StatisticalStepsSecondManager.h
//  JLProject
//
//  Created by jiangliang on 2019/10/25.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StatisticalStepsSecondManager : NSObject

+ (instancetype)shareInstance;

+ (BOOL)isHealthDataAvailable;

- (NSString *)getCurrentSteps;

@end

NS_ASSUME_NONNULL_END
