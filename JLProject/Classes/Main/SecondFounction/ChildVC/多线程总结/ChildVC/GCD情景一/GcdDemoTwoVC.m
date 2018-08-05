//
//  GcdDemoTwoVC.m
//  JLProject
//
//  Created by UCS on 2018/8/5.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "GcdDemoTwoVC.h"

@interface GcdDemoTwoVC ()
//串行队列
@property (nonatomic, strong) dispatch_queue_t serialQueue;
//并行队列
@property (nonatomic, strong) dispatch_queue_t concurrentQueue;

@property (nonatomic, strong) UIImageView *imageView_1;
@property (nonatomic, strong) UIImageView *imageView_2;
@property (nonatomic, strong) UIImageView *imageView_3;

@end

@implementation GcdDemoTwoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //串行队列
    self.serialQueue = dispatch_queue_create("serialQueue.ys.com", DISPATCH_QUEUE_SERIAL);
    //并行队列
    self.concurrentQueue = dispatch_queue_create("concurrentQueue.ys.com", DISPATCH_QUEUE_CONCURRENT);
    
    //延时操作
//    [self cgdDelay];
    
    //队列组
//    [self GCDGroup];
    
    //栅栏函数
//    [self gcdBarrier];
    
    //重复
//    [self gcdApply];
    
    //信号量
    [self gdcSemaphore];
}


/*
 1. dispatch_after
 该函数用于任务延时执行，其中参数dispatch_time_t代表延时时长，dispatch_queue_t代表使用哪个队列。如果队列未主队列，那么任务在主线程执行，如果队列为全局队列或者自己创建的队列，那么任务在子线程执行
 */
- (void)cgdDelay{
    
    //主队列延时
    dispatch_time_t when_Main = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC));
    dispatch_after(when_Main, dispatch_get_main_queue(), ^{
        NSLog(@"延迟3秒---%@",[NSThread currentThread]);
    });

    //全局队列延时
    dispatch_time_t when_Global = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC));
    dispatch_after(when_Global, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"延迟6秒---%@",[NSThread currentThread]);
    });
    
    dispatch_time_t when_Custom = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(9.0 * NSEC_PER_SEC));
    dispatch_after(when_Custom, self.concurrentQueue, ^{
        NSLog(@"延迟12秒---%@",[NSThread currentThread]);
    });
}

/*
2、dispatch_once
保证函数在整个生命周期内只会执行一次，看代码。
*/



/*
 3、队列组，当加入到队列组中的所有任务执行完成之后，会调用dispatch_group_notify函数通知任务全部完成
 */
- (void)GCDGroup{
    
    dispatch_group_t group = dispatch_group_create();
    
    __block NSInteger numOne = 0;
    __block NSInteger numTwo = 0;
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i < 10000; i ++) {
            numOne += (100 +  (arc4random() % 101));
            NSLog(@"numOne---%ld---%ld", i, numOne);
        }
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i < 10000; i ++) {
            numTwo += (100 +  (arc4random() % 101));
            NSLog(@"numTwo---%ld---%ld", i, numTwo);
        }
    });
    //所有的计算结束
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"总数为%ld", numOne+numTwo);
    });
}

/*
 4. dispatch_barrier_async
 栅栏函数，使用此方法创建的任务，会查找当前队列中有没有其他任务要执行，如果有，则等待已有任务执行完毕后再执行，
 同时，在此任务之后进入队列的任务，需要等待此任务执行完成后，才能执行。
 
 dispatch_barrier_async函数的作用与barrier的意思相同,在进程管理中起到一个栅栏的作用,它等待所有位于barrier函数之前的操作执行完毕后执行,并且在barrier函数执行之后,barrier函数之后的操作才会得到执行,该函数需要同dispatch_queue_create函数生成的concurrent Dispatch Queue队列一起使用
 
 函数的作用
  1.实现高效率的数据库访问和文件访问
  2.避免数据竞争
 */

- (void)gcdBarrier{
    
    dispatch_async(self.concurrentQueue, ^{
//        NSLog(@"task1");
        NSLog(@"1---%@", [NSThread currentThread]);
    });
    dispatch_async(self.concurrentQueue, ^{
//        NSLog(@"task2");
        NSLog(@"2---%@", [NSThread currentThread]);
    });
    dispatch_async(self.concurrentQueue, ^{
//        NSLog(@"task3");
        NSLog(@"3---%@", [NSThread currentThread]);
    });
    
    //栅栏函数会回到主线程
    dispatch_barrier_sync(self.concurrentQueue, ^{
//        NSLog(@"task4");
        NSLog(@"4---%@", [NSThread currentThread]);
    });
    
    dispatch_async(self.concurrentQueue, ^{
//        NSLog(@"task5");
        NSLog(@"栅栏函数-5---%@", [NSThread currentThread]);
    });
    dispatch_async(self.concurrentQueue, ^{
//        NSLog(@"task6");
        NSLog(@"6---%@", [NSThread currentThread]);
    });
    dispatch_async(self.concurrentQueue, ^{
//        NSLog(@"task7");
        NSLog(@"7---%@", [NSThread currentThread]);
    });
    dispatch_async(self.concurrentQueue, ^{
        //        NSLog(@"task7");
        NSLog(@"8---%@", [NSThread currentThread]);
    });
    
}

/*
 5. dispatch_apply
 该函数用于重复执行某个任务，如果任务队列是并行队列，重复执行的任务会并发执行，如果任务队列为串行队列，则任务会顺序执行，需要注意的是，该函数为同步函数，要防止线程阻塞和死锁
 */
- (void)gcdApply{
    
    dispatch_apply(5, self.serialQueue, ^(size_t i) {
        NSLog(@"串行队列--%ld---%@", i, [NSThread currentThread]);
    });
    
    
    dispatch_apply(5, self.concurrentQueue, ^(size_t i) {
        NSLog(@"并行队列--%ld---%@", i, [NSThread currentThread]);
    });
    
    /*
    // 死锁
    dispatch_apply(5, dispatch_get_main_queue(), ^(size_t i) {
        NSLog(@"死锁队列--%ld---%@", i, [NSThread currentThread]);
    });
    */
}

/*
 6、dispatch_semaphore_create & dispatch_semaphore_signal & dispatch_semaphore_wait
 信号量只是控制任务执行的一个条件而已，相对于上面通过队列以及执行方式来控制线程的开辟和任务的执行，它更贴近对于任务直接的控制。类似于单个队列的最大并发数的控制机制，提高并行效率的同时，也防止太多线程的开辟对CPU早层负面的效率负担。
 
 dispatch_semaphore_create创建信号量，初始值不能小于0；
 dispatch_semaphore_wait等待降低信号量，也就是信号量-1；
 dispatch_semaphore_signal提高信号量，也就是信号量+1；
 dispatch_semaphore_wait和dispatch_semaphore_signal通常配对使用。
 
 */
- (void)gdcSemaphore{
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    dispatch_apply(5, self.concurrentQueue, ^(size_t i) {
        dispatch_wait(semaphore, DISPATCH_TIME_FOREVER);
        dispatch_async(self.concurrentQueue, ^{
            NSLog(@"第%ld次, %@", i, [NSThread currentThread]);
            dispatch_semaphore_signal(semaphore);
        });
    });
    /*信号量是控制任务执行的重要条件，当信号量为0时，所有任务等待，信号量越大，允许可并行执行的任务数量越多。*/
}




@end
