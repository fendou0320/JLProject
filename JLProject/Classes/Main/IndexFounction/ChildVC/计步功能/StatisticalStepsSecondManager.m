//
//  StatisticalStepsSecondManager.m
//  JLProject
//
//  Created by jiangliang on 2019/10/25.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "StatisticalStepsSecondManager.h"
#import <CoreMotion/CoreMotion.h>

static StatisticalStepsSecondManager *instance;

@interface StatisticalStepsSecondManager()
@property(nonatomic,strong)CMPedometer *pedometer;
@property (nonatomic, copy) NSString *currentSteps;
@end

@implementation StatisticalStepsSecondManager

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[StatisticalStepsSecondManager alloc] init];
    });
    return instance;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setUpHealthStore];
    }
    return self;
}

- (void)setUpHealthStore{
    //初始化
    self.pedometer = [[CMPedometer alloc]init];
    //判断记步功能
    if ([CMPedometer isStepCountingAvailable]) {
        [_pedometer queryPedometerDataFromDate:[NSDate dateWithTimeIntervalSinceNow:-60*60*24*2] toDate:[NSDate dateWithTimeIntervalSinceNow:-60*60*24*1] withHandler:^(CMPedometerData * _Nullable pedometerData, NSError * _Nullable error) {
            if (error) {
                NSLog(@"error====%@",error);
            }else {
                NSLog(@"步数====%@",pedometerData.numberOfSteps);
                NSLog(@"距离====%@",pedometerData.distance);
            }
        }];
    }else{
        NSLog(@"记步功能不可用");
    }
}

//查询数据
- (void)readStepCount{
 
}

+ (BOOL)isHealthDataAvailable{
   
    return NO;
}

- (NSString *)getCurrentSteps{
    return self.currentSteps;
}

@end
