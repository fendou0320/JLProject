//
//  StatisticalStepsVC.m
//  JLProject
//
//  Created by jiangliang on 2019/8/21.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "StatisticalStepsVC.h"
#import <HealthKit/HealthKit.h>


@interface StatisticalStepsVC ()

@property (nonatomic, strong) HKHealthStore *healthStore;
@property (nonatomic, strong) UILabel *showLabel;

@end

@implementation StatisticalStepsVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.showLabel = [[UILabel alloc] init];
    self.showLabel.frame = CGRectMake(0, SIZE_IPHONE6(0), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:self.showLabel];
    self.showLabel.backgroundColor = RandomColor;
    
    if ([HKHealthStore isHealthDataAvailable]) {
        
        NSLog(@"不支持计步功能");
        
        self.showLabel.text = @"不支持计步功能";
        
    }else{
        
        self.showLabel.text = @"支持计步功能";
        
        //创建healthStore实例对象
        self.healthStore = [[HKHealthStore alloc] init];
        
        //设置需要获取的权限这里仅设置了步数
        HKObjectType *stepCount = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
        
        NSSet *healthSet = [NSSet setWithObjects:stepCount, nil];
        
        //从健康应用中获取权限
        [self.healthStore requestAuthorizationToShareTypes:nil readTypes:healthSet completion:^(BOOL success, NSError * _Nullable error) {
            if (success)
            {
                NSLog(@"获取步数权限成功");
                //获取步数后我们调用获取步数的方法
                [self readStepCount];
            }
            else
            {
                NSLog(@"获取步数权限失败");
            }
        }];
        
    }
    
}


//查询数据
- (void)readStepCount
{
    //查询采样信息
    HKSampleType *sampleType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    
    //NSSortDescriptors用来告诉healthStore怎么样将结果排序。
    NSSortDescriptor *start = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierStartDate ascending:NO];
    NSSortDescriptor *end = [NSSortDescriptor sortDescriptorWithKey:HKSampleSortIdentifierEndDate ascending:NO];
    
    /*查询的基类是HKQuery，这是一个抽象类，能够实现每一种查询目标，这里我们需要查询的步数是一个
     HKSample类所以对应的查询类就是HKSampleQuery。
     下面的limit参数传1表示查询最近一条数据,查询多条数据只要设置limit的参数值就可以了
     */
    HKSampleQuery *sampleQuery = [[HKSampleQuery alloc] initWithSampleType:sampleType predicate:nil limit:1 sortDescriptors:@[start,end] resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        //打印查询结果
        NSLog(@"resultCount = %ld result = %@",results.count,results);
        //把结果装换成字符串类型
        HKQuantitySample *result = results[0];
        HKQuantity *quantity = result.quantity;
        NSString *stepStr = (NSString *)quantity;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            //查询是在多线程中进行的，如果要对UI进行刷新，要回到主线程中
            NSLog(@"最新步数：%@",stepStr);
            
            self.showLabel.text = [NSString stringWithFormat:@"最新步数：%@", stepStr];

        }];
        
    }];
    //执行查询
    [self.healthStore executeQuery:sampleQuery];
}








@end
