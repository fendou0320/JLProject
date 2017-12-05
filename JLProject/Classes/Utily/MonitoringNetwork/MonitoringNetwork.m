//
//  MonitoringNetwork.m
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/8.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "MonitoringNetwork.h"

@interface MonitoringNetwork()
@property (nonatomic, assign)AFNetworkReachabilityStatus reachabilityStatus;
@end

static MonitoringNetwork *netWork;

@implementation MonitoringNetwork

+ (instancetype)shareManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MonitoringNetwork *net = [[MonitoringNetwork alloc] init];
        [net MonitoringNetwork];
        netWork = net;
    });
    return netWork;
}


- (void)MonitoringNetwork{
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未识别的网络");
                netWork.reachabilityStatus = AFNetworkReachabilityStatusUnknown;
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"不可达的网络(未连接)");
                netWork.reachabilityStatus = AFNetworkReachabilityStatusNotReachable;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"2G,3G,4G...的网络");
                netWork.reachabilityStatus = AFNetworkReachabilityStatusReachableViaWWAN;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi的网络");
                netWork.reachabilityStatus = AFNetworkReachabilityStatusReachableViaWiFi;
                break;
            default:
                break;
        }
    }];
    [manager startMonitoring];
}

+ (AFNetworkReachabilityStatus)monitoringNetworkState{

    [MonitoringNetwork shareManager];
    return netWork.reachabilityStatus;
}



@end
