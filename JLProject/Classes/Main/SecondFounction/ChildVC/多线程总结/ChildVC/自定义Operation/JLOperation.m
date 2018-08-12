//
//  JLOperation.m
//  JLProject
//
//  Created by jiangliangwang on 2018/8/11.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "JLOperation.h"

@interface JLOperation()
@property (nonatomic,strong)id data;//作为该操作的参数。
@end

@implementation JLOperation

- (instancetype)initWithData:(id)data
{
    if (self = [super init]) {
        self.data = data;
    }
    return self;
}

- (void)main//只重写了这个方法的话，如果单独手动执行该自定义操作的话，操作时同步执行的，如果操作队列联合起来使用的话，也会并发执行操作。
{
    NSString *order = (NSString *)self.data;
    for (NSInteger i = 0; i < 3; i++) {
        NSLog(@"自定义操作%@----:%@",order,[NSThread currentThread]);
    }
}


/*---NSOperation的一些常用属性和方法。
 
 //操作是否取消
 @property (readonly, getter=isCancelled) BOOL cancelled;
 - (void)cancel;//取消操作
 @property (readonly, getter=isExecuting) BOOL executing;//是否执行
 @property (readonly, getter=isFinished) BOOL finished;//是否执行结束
 @property (readonly, getter=isAsynchronous) BOOL asynchronous //是否异步
 @property (readonly, getter=isReady) BOOL ready;//是否处于就绪状态
 - (void)addDependency:(NSOperation *)op;//添加依赖
 - (void)removeDependency:(NSOperation *)op;//去除依赖
 @property (readonly, copy) NSArray<NSOperation *> *dependencies;//所有相关依赖
 - (void)waitUntilFinished;//执行该操作的时候阻塞当前线程，直到该操作执行
 结束。
 - (void)addOperationsInCustom
 {
 NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"wait1"];
 NSInvocationOperation *op2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"wait2"];
 NSInvocationOperation *op3 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"wait3"];
 NSInvocationOperation *op4 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(task:) object:@"wait4"];
 NSOperationQueue *customQueue = [[NSOperationQueue alloc]init];
 //    [customQueue addOperation:op1];
 //    [op1 waitUntilFinished];//waitUntilFinished是阻塞当前线程的作用，在这里会阻塞主线程，阻塞主线程中继续往队列中加任务，直到该op1操作执行结束，这样就能实现操作的串行了。
 [customQueue addOperation:op2];
 [op2 waitUntilFinished];
 [customQueue addOperation:op3];
 [op3 waitUntilFinished];
 [customQueue addOperation:op4];
 }
 
 */

/*---NSOperationQueue的相关属性和方法
 
 - (void)addOperation:(NSOperation *)op;
 - (void)addOperations:(NSArray<NSOperation *> *)ops waitUntilFinished:(BOOL)wait ;//可以根据wait参数设置队列中操作的执行方式是串行还是并发。
 - (void)addOperationWithBlock:(void (^)(void))block;
 @property (readonly, copy) NSArray<__kindof NSOperation *> *operations;
 @property (readonly) NSUInteger operationCount ;//操作的个数
 @property NSInteger maxConcurrentOperationCount;//最大并发数
 @property (getter=isSuspended) BOOL suspended;//是否悬挂
 - (void)cancelAllOperations;//取消队列中的所有操作。
 @property (nullable, assign ) dispatch_queue_t underlyingQueue;//操作队列对应的GCD队列。

 */

@end
