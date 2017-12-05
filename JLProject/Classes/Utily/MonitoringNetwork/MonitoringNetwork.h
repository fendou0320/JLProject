//
//  MonitoringNetwork.h
//  JLVideoPlayer
//
//  Created by 王江亮 on 16/12/8.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface MonitoringNetwork : NSObject
/**
 获取当前网络状态

 @return 网络状态
 */
+ (AFNetworkReachabilityStatus)monitoringNetworkState;

@end
