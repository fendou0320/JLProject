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

@interface AppDelegate ()
{
    FBMemoryProfiler *memoryProfiler;
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




@end
