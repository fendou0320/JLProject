//
//  AppDelegate.m
//  JLProject
//
//  Created by UCS on 2017/6/2.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "LoginViewController.h"

#if DEBUG
#import <FBMemoryProfiler.h>
#import "CacheCleanerPlugin.h"
#import "RetainCycleLoggerPlugin.h"
#endif

//个推统计集成
#import <GTCountSDK.h>
//APP id
#define kGcAppId @"8QcsHZdv9c8iS0U3oPU6l3"
//渠道名称 如果为 nil,默认为 'appstore'
#define channelId @"appstore"


@interface AppDelegate ()
{
    FBMemoryProfiler *memoryProfiler;
    dispatch_source_t _timer;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //检测系统
    {
#if DEBUG
        memoryProfiler = [[FBMemoryProfiler alloc] initWithPlugins:@[[CacheCleanerPlugin new],
                                                                     [RetainCycleLoggerPlugin new]]
                                  retainCycleDetectorConfiguration:nil];
        [memoryProfiler enable];
#endif
    }
    // 启动个数 SDK
    [GTCountSDK startSDKWithAppId:kGcAppId withChannelId:@"appstore"];
    // 使用 SDK 实例的 reportStrategy 属性设置上报策略。
    [[GTCountSDK sharedInstance] setReportStrategy:GESHU_STRATEGY_WIFI_ONLY];
    // 使用 SDK 实例的 sessionTime 属性获取 sessionTime 的值。
    NSLog(@"sessionTime %ld",[[GTCountSDK sharedInstance]sessionTime]);
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[MainViewController alloc] init];
    //启动网络监听
    AFNetworkReachabilityStatus status = [MonitoringNetwork monitoringNetworkState];
    //登录页
//    [LoginViewController showInview: self.window.rootViewController.view];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    //允许后台播放音乐
    [application beginBackgroundTaskWithExpirationHandler:nil];
    //杀进程之前打印堆栈信息
    [self beforeCrash];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    if (self.isForceLandscape) {
        return UIInterfaceOrientationMaskLandscape;
    }else{
        return UIInterfaceOrientationMaskPortrait;
    }
    return UIInterfaceOrientationMaskPortrait;
}

- (void)beforeCrash{
    
    __block n = 0;
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0);
    // 计时器的触发block
    dispatch_source_set_event_handler(_timer, ^{
        ++n;
        if (n > 180) {
            dispatch_source_cancel(_timer);
        }
    });
    dispatch_source_set_cancel_handler(_timer, ^{
        //打印当前的进程
        NSLog(@"退到后台－－－%@",[NSThread callStackSymbols]);
        NSLog(@"退到后台－－－%@",[NSThread callStackReturnAddresses]);
    });
    dispatch_resume(_timer);
    
}

@end
