//
//  StatisticalStepsManager.m
//  JLProject
//
//  Created by jiangliang on 2019/9/12.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "StatisticalStepsManager.h"
#import <HealthKit/HealthKit.h>

static StatisticalStepsManager *instance;

@interface StatisticalStepsManager()
@property (nonatomic, strong) HKHealthStore *healthStore;
@property (nonatomic, copy) NSString *currentSteps;
@end

@implementation StatisticalStepsManager

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[StatisticalStepsManager alloc] init];
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
    if ([HKHealthStore isHealthDataAvailable]) {
        if (!self.healthStore) {
            self.healthStore = [[HKHealthStore alloc] init];
            HKObjectType *stepCount = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
            NSSet *healthSet = [NSSet setWithObjects:stepCount, nil];
            [self.healthStore requestAuthorizationToShareTypes:nil readTypes:healthSet completion:^(BOOL success, NSError * _Nullable error) {
                if (success){
                    //获取步数权限成功,获取步数后我们调用获取步数的方法
                    [self readStepCount];
                }else{
                    //获取步数权限失败
                }
            }];
        }
    }else{
        //不支持计步功能
    }
}

//查询数据
- (void)readStepCount{
    HKSampleType *sampleType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    NSSortDescriptor *start = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:NO];
    NSSortDescriptor *end = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierEndDate ascending:NO];
    HKSampleQuery *sampleQuery = [[HKSampleQuery alloc] initWithSampleType:sampleType predicate:nil limit:1 sortDescriptors:@[start,end] resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        //把结果装换成字符串类型
        HKQuantitySample *result = results[0];
        HKQuantity *quantity = result.quantity;
        NSString *stepStr = (NSString *)quantity;
        self.currentSteps = stepStr;
//        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//            //查询是在多线程中进行的，如果要对UI进行刷新，要回到主线程中
////            self.showLabel.text = [NSString stringWithFormat:@"最新步数：%@", stepStr];
//        }];
    }];
    //执行查询
    [self.healthStore executeQuery:sampleQuery];
}

+ (BOOL)isHealthDataAvailable{
    if ([HKHealthStore isHealthDataAvailable]) {//支持计步功能
        return YES;
    }
    return NO;
}

- (NSString *)getCurrentSteps{
    return self.currentSteps;
}



@end
