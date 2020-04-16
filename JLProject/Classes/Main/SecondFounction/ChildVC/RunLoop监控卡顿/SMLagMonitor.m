//
//  SMLagMonitor.m
//  JLProject
//
//  Created by jiangliang on 2019/11/4.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "SMLagMonitor.h"

@interface SMLagMonitor (){
    
    CFRunLoopObserverRef runLoopObserver;
    int timeoutCount;
    @public
    dispatch_semaphore_t dispatchSemaphore;
    CFRunLoopActivity runLoopActivity;
}
@property (nonatomic, strong) NSTimer *cpuMonitorTimer;
@end

@implementation SMLagMonitor

/*
 watchdog(看门狗)的机制
 
 为了防止一个应用占用过多的系统资源，苹果设计了一个“看门狗”(watchdog)的机制。在不同的场景下，“看门狗”会监测应用的性能。
 如果超出了该场景所规定的运行时间，“看门狗”就会强制终结这个应用的进程。
 开发者们在crashlog里面，会看到诸如0x8badf00d这样的错误代码。
 异常代码：“0x8badf00d”，即“ate bad food”。
 */

+ (instancetype)shareIntance{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)beginMonitor{
    //监测 CPU 消耗
    self.cpuMonitorTimer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(updateCPUInfo) userInfo:nil repeats:YES];
   //监测卡顿
        if (runLoopObserver) {
            return;
        }
        dispatchSemaphore = dispatch_semaphore_create(0); //Dispatch Semaphore保证同步
        //创建一个观察者
        CFRunLoopObserverContext context = {0,(__bridge void*)self,NULL,NULL};
        runLoopObserver = CFRunLoopObserverCreate(kCFAllocatorDefault,
                                                  kCFRunLoopAllActivities,
                                                  YES,
                                                  0,
                                                  &runLoopObserverCallBack,
                                                  &context);
        //将观察者添加到主线程runloop的common模式下的观察中
        CFRunLoopAddObserver(CFRunLoopGetMain(), runLoopObserver, kCFRunLoopCommonModes);
        
        //创建子线程监控
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            //子线程开启一个持续的loop用来进行监控
            while (YES) {
                long semaphoreWait = dispatch_semaphore_wait(dispatchSemaphore, dispatch_time(DISPATCH_TIME_NOW, 20*NSEC_PER_MSEC));
                if (semaphoreWait != 0) {
                    if (!runLoopObserver) {
                        timeoutCount = 0;
                        dispatchSemaphore = 0;
                        runLoopActivity = 0;
                        return;
                    }
                    //两个runloop的状态，BeforeSources和AfterWaiting这两个状态区间时间能够检测到是否卡顿
                    if (runLoopActivity == kCFRunLoopBeforeSources || runLoopActivity == kCFRunLoopAfterWaiting) {
                        //出现三次出结果
    //                    if (++timeoutCount < 3) {
    //                        continue;
    //                    }
                        NSLog(@"monitor trigger");
                        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
    //                        [SMCallStack callStackWithType:SMCallStackTypeAll];
                        });
                    } //end activity
                }// end semaphore wait
                timeoutCount = 0;
            }// end while
        });

}
- (void)endMonitor {
    [self.cpuMonitorTimer invalidate];
    if (!runLoopObserver) {
        return;
    }
    CFRunLoopRemoveObserver(CFRunLoopGetMain(), runLoopObserver, kCFRunLoopCommonModes);
    CFRelease(runLoopObserver);
    runLoopObserver = NULL;
}

#pragma mark - Private
- (void)updateCPUInfo {
//    [SMCPUMonitor updateCPU];
}

static void runLoopObserverCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    SMLagMonitor *lagMonitor = (__bridge SMLagMonitor*)info;
//    lagMonitor->runLoopActivity = activity;
    
    dispatch_semaphore_t semaphore = lagMonitor->dispatchSemaphore;
    dispatch_semaphore_signal(semaphore);
}


@end
