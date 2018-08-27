//
//  main.m
//  JLProject
//
//  Created by UCS on 2017/6/2.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#if DEBUG
#import <FBAllocationTracker.h>
#import <FBAssociationManager.h>
#endif

/*
 int sum (int a, int b){
 int x = 100;
 return a+b+x;
 }
 */
int sum (int a, int b);

int main(int argc, char * argv[]) {
    @autoreleasepool {
      
        NSLog(@"%d", sum(10, 30));
        
//        NSString * (^myBlcok)(int, NSString *) = ^NSString *(int a, NSString *b){
//            return [NSString stringWithFormat:@"传入的参数分别为：%d,%@", a , b];
//        };
//        NSLog(@"%@", myBlcok(100, @"200"));
        
        
#if DEBUG
        [FBAssociationManager hook];
        [[FBAllocationTrackerManager sharedManager] startTrackingAllocations];
        [[FBAllocationTrackerManager sharedManager] enableGenerations];
#endif
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

/*
 这套内存泄漏检测类库大概包含了以下三个文件：
(1) FBMemoryProfiler
 FBMemoryProfiler 是几个组件的结合。其中包括 FBAllocationTracker 和 FBRetainCycleDetector。
 可视化工具，直接嵌入到 App 中，可以起到在 App 中直接查看内存使用情况，并筛选潜在泄漏对象的作用
 
(2) FBAllocationTracker
 主要用于快速检测潜在的内存泄漏对象，并提供给 FBRetainCycleDetector 进行检测
 这是一个用来主动追踪所有 NSObject 的子类的内存分配和释放操作的工具。
 FBAllocationTracker 用于检测应用在运行时所有实例的分配。它的原理其实就是用 method swizzling 替换原本的 alloc 方法。这样就可以记录下所有的实例分配了。
 在需要的时候调用 currentAllocationSummary 方法，就可以得到当前整体的实例分配情况（前提是在 main 中初始化过，下面有介绍）：
 NSArray<FBAllocationTrackerSummary *> *summaries =
 [[FBAllocationTrackerManager sharedManager] currentAllocationSummary];
 
 (3)FBRetainCycleDetector
 FBRetainCycleDetector 接受一个运行时的实例，然后从这个实例开始遍历它所有的属性，逐级递归。 如果发现遍历到重复的实例，就说明存在循环引用，并给出报告。
 FBRetainCycleDetector *detector = [FBRetainCycleDetector new];
 [detector addCandidate:myObject];
 NSSet *retainCycles = [detector findRetainCycles];
 NSLog(@"%@", retainCycles);
 */

/*
 逆向-看汇编
 
 
 */


