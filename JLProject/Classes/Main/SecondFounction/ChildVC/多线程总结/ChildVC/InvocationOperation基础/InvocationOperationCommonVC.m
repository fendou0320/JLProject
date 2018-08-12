//
//  InvocationOperationCommonVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/8/11.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "InvocationOperationCommonVC.h"

@interface InvocationOperationCommonVC ()
@property (nonatomic, strong) NSOperationQueue *mainQueue;
@end

@implementation InvocationOperationCommonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //在主线程中执行
    //    [self executeInMainThread];
    
    //在子线程中执行
    //    [self executeInNewThread];
    
    //将操作添加到主操作队列
    //    [self addMainOperationQueue];
    
    //将操作添加到自定义操作队列
    //    [self addCustomOperationQueue];
    
    //主线程添加依赖
    //    [self addDependenceInMain];
    
    //设置依赖--自定义队列
    //    [self addDependenceInCustom];
    
}

/**
 在主线程中执行
 */
- (void)executeInMainThread{
    
    /*
     2、 NSInvocationOperation的使用
     2.1、手动执行操作。
     */
    NSLog(@"创建操作:%@",[NSThread currentThread]);
    
    NSInvocationOperation *vocationOperation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(taskOne) object:nil];
    [vocationOperation start];
    
}

/**
 在子线程中执行
 */
- (void)executeInNewThread
{
    NSLog(@"创建操作:%@",[NSThread currentThread]);
    [NSThread detachNewThreadSelector:@selector(executeInMainThread) toTarget:self withObject:nil];
}


- (void)taskOne{
    
    NSLog(@"执行操作:%@",[NSThread currentThread]);
    for (NSInteger i = 0; i < 3; i++) {
        NSLog(@"----%@",[NSThread currentThread]);
    }
}

//将操作添加到主操作队列
- (void)addMainOperationQueue{
    
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    self.mainQueue = mainQueue;
    NSLog(@"创建添加任务%@", [NSThread currentThread]);
    
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"1"];
    [mainQueue addOperation:op1];
    [mainQueue cancelAllOperations];
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"2"];
    [mainQueue addOperation:op2];
    
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"3"];
    [mainQueue addOperation:op3];
    [op3 cancel];
    
    NSInvocationOperation *op4 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"4"];
    [mainQueue addOperation:op4];
    
}


- (void)task: (NSString *)order{
    for (NSInteger i = 0; i < 3; i++) {
        NSLog(@"任务:%@----%@", order, [NSThread currentThread]);
    }
}

//将操作添加到自定义操作队列
- (void)addCustomOperationQueue{
    
    NSLog(@"创建添加任务%@",[NSThread currentThread]);
    NSOperationQueue *customQueue = [[NSOperationQueue alloc] init];
    customQueue.maxConcurrentOperationCount = 5;
    //这个属性的设置需在队列中添加任务之前。任务添加到队列后，如果该任务没有依赖关系的话，任务添加到队列后，会直接开始执行。
    //加入到自定义队列里的任务，可以通过设置操作队列的 maxConcurrentOperationCount的值来控制操作的串行执行还是并发执行。
    //当maxConcurrentOperationCount = 1的时候，是串行执行。 maxConcurrentOperationCount > 1的时候是并发执行，但是这个线程开启的数量最终还是由系统决定的，不是maxConcurrentOperationCount设置为多少，就开多少条线程。默认情况下，自定义队列的maxConcurrentOperationCount值为-1，表示并发执行。
    
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"1"];
    [customQueue addOperation:op1];
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"2"];
    
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"3"];
    
    NSInvocationOperation *op4 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"4"];
    
    //打断点在op1加入队列前后的状态值。
    
    [customQueue addOperation:op2];
    [customQueue addOperation:op3];
    [customQueue addOperation:op4];
    
}

#pragma mark - 添加依赖。
//主队列
- (void)addDependenceInMain{
    
    
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    NSLog(@"创建添加任务%@",[NSThread currentThread]);
    
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"1"];
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"2"];
    
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"3"];
    
    NSInvocationOperation *op4 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"4"];
    
    //由此更可以看出，如果添加了依赖关系，在主队列串行执行任务，也不是先进先出的规则。而是按照依赖关系的属性执行。  应该把操作的所有配置都配置好后，再加入队列，因为加入队列后，操作就开始执行了，再进行配置就晚了。
    [op4 addDependency:op3];
    [op3 addDependency:op2];
    [op2 addDependency:op1];
    //    [op1 addDependency:op2];
    
    
    //这里的操作队列就和GCD中的队列不一样了，GCD队列是遵守FIFO规则，而这里的队列里的操作则是根据依赖关系等决定。这种依赖关系是单向的，op1依赖于op2，op2的执行与op1没有任何关系。不能设置双向依赖，如果op1依赖op2,op2又反过来依赖op1，则会出现互相等待的死锁情况。
    
    //注意:关于操作队列与操作的相关配置都要在操作加入到队列前配置完全，因为操作加入到队列后，就开始执行操作了。此时，再进行操作或队列的设置很有可能达不到预期的效果。
    
    [mainQueue addOperation:op1];
    [mainQueue addOperation:op2];
    [mainQueue addOperation:op3];
    [mainQueue addOperation:op4];
    
}

//设置依赖--自定义队列
- (void)addDependenceInCustom{
    
    NSLog(@"创建添加任务%@",[NSThread currentThread]);
    NSOperationQueue *customQueue = [[NSOperationQueue alloc] init];
    customQueue.maxConcurrentOperationCount = 3;
    
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"1"];
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"2"];
    
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"3"];
    
    NSInvocationOperation *op4 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task:) object:@"4"];
    
    
    //isReady属性如果为YES的时候，该任务处于就绪状态，就等待系统调度执行。如果任务有依赖关系的话，该任务的isReady属性需要在其所属的依赖任务执行完成后，才为YES。
    
    
    
    //设置优先级
    [op1 addDependency:op2];
    [op2 addDependency:op3];
    /*注意:两个任务不能相互依赖，如果相互依赖，则会出现死锁，都执行不了
     [op1 addDependency:op2];
     [op2 addDependency:op1];
     这种相互依赖是错误的。
     */
    
    //默认情况下，操作的queuePriority(队列优先级)为0 NSOperationQueuePriorityNormal 正常优先级。
    
    //都处于就绪状态下的操作，才开始按照优先级顺序来执行。 优先级高的是说系统调度的概率会大一些，但是也不能确保完全会按照优先级来，如果要设置操作的执行顺序，最有效也最安全的做法还是设置依赖关系。
    //    op1.queuePriority = NSOperationQueuePriorityNormal;
    //    op2.queuePriority = NSOperationQueuePriorityLow;
    op3.queuePriority = NSOperationQueuePriorityVeryLow;
    op4.queuePriority = NSOperationQueuePriorityVeryHigh;
    
    [customQueue addOperation:op1];
    [customQueue addOperation:op2];
    [customQueue addOperation:op3];
    [customQueue addOperation:op4];
    
    
    /*
     依赖 VS 队列优先级(queuePriority)
     操作有个isReady属性，该属性表示操作时否处于就绪状态，处于就绪状态的操作，只要等待系统调度，就会执行。而操作的就绪状态取决于依赖关系，当op1依赖于op2的时候，如果op2还没执行完，op1的isReady = NO，即op1还处于未就绪状态。同处于就绪状态的操作，此时再比较它们的队列优先级(queuePriority)，这样才有意义。
     队列中会先执行处于就绪状态的操作，即便处于就绪状态的操作的队列优先级低于未就绪的操作。所以，要控制操作之间的执行顺序，需要使用依赖关系。
     */
}




@end
