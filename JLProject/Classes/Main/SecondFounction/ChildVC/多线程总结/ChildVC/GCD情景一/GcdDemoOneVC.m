//
//  GcdDemoOneVC.m
//  JLProject
//
//  Created by UCS on 2018/8/4.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "GcdDemoOneVC.h"

@interface GcdDemoOneVC ()

//串行队列
@property (nonatomic, strong) dispatch_queue_t serialQueue;
//并行队列
@property (nonatomic, strong) dispatch_queue_t concurrentQueue;

@end

@implementation GcdDemoOneVC

/*
 GCD 分为异步和同步
  异步:
  dispatch_async (  参数1  , {
 }
 同步:
 dispatch_sync( 参数1   , {
}
 
 参数1 :队列 不管是串行还是并行，队列都是按照FIFO的原则依次触发任务
 队列分为两种:
 
 全局队列 dispatch_get_globle_queue(0,0)
 全局队列 : 系统为程序员提供的队列---系统为我们创建好的一个并行队列，使用起来与我们自己创建的并行队列无本质差别。
 执行时机 : 在系统主线程空闲时才会执行
 全局队列和异步配合使用

 主队列 dispatch_get_main_queue()
 主队列: 系统在执行主线程时执行---系统为我们创建好的一个串行队列，牛逼之处在于它管理必须在主线程中执行的任务，属于有劳保的。
 执行时机 :一般从分线程跳转到主线程需要使用 主队列
 主队列和同步配合使用

 补充:其中队列还包含自己创建的 dispatch_queue_creat ( 参数1 , 参数2 )出来的
 其中
 参数1是 队列的名字标识
 参数2 有两个选择
 a.   DISPATCH_QUEUE_SERIAL  //是该队列是一个串行队列 即有序执行
 b.  DISPATCH_QUEUE_CONCURRENT  //该队列是一个并发队列,在执行第一个的同时会不等前一个队列执行完,就会在其他线程中执行后一个队列或者其中的其他队列 (无次序之分)
 
 */
/*
 GCD给出了两种执行方式——同步执行（sync）和异步执行（async）。
 同步执行：在当前线程执行任务，不会开辟新的线程。必须等到Block函数执行完毕后，dispatch函数才会返回。
 异步执行：可以在新的线程中执行任务，但不一定会开辟新的线程。dispatch函数会立即返回, 然后Block在后台异步执行。
 
 如果当前在主线程，只要是同步执行，不管是还是并行队列还是串行队列，都是串行执行。
 如果在子线程，才会按照对应的同步、异步执行。
 */



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //判断当前线程
    
    
    /*
    //-----------------主队列+串行----------------------默认为主线程
    //死锁原因
    //1、dispatch_sync首先作为一个任务加入到执行队列中，等内部的block任务执行完成后才往下执行，
    //2、block作为第二个任务加入到执行队列中，串行要求第一个任务执行完成之后再执行第二个。
    //3、第一个任务等第二个执行完成，第二个从顺序上不能先执行，只能等待第一个。--死锁
    NSLog(@"11---%@", [NSThread currentThread]);
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"12---%@", [NSThread currentThread]);
    });
    NSLog(@"13---%@", [NSThread currentThread]);
    */
    
    
    /*
    //-----------------全局队列+串行----------------------默认为主线程
    //async 在主线程中 创建了一个异步线程 加入 全局并发队列，async 不会等待block 执行完成，立即返回
    NSLog(@"20---%@", [NSThread currentThread]);
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"21---%@", [NSThread currentThread]);
    });
    NSLog(@"22---%@", [NSThread currentThread]);
     */
    
    
    /*
    //-----------------主队列+并行----------------------默认为主线程
    //当任务dispatch_async在执行时，任务block加入到了主队列，注意哦，是异步执行，
    //所以dispatch_async函数不会等到Block执行完成才返回，dispatch_async函数返回后，那下面的任务可以继续执行，
    //Block任务我们可以认为在下一帧顺序加入队列，并且默认无限下一帧执行。
    NSLog(@"11---%@", [NSThread currentThread]);
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"12---%@", [NSThread currentThread]);
    });
    NSLog(@"13---%@", [NSThread currentThread]);
    */
    
    
    //串行队列
    self.serialQueue = dispatch_queue_create("serialQueue.ys.com", DISPATCH_QUEUE_SERIAL);
    //并行队列
    self.concurrentQueue = dispatch_queue_create("concurrentQueue.ys.com", DISPATCH_QUEUE_CONCURRENT);
    
//    [self queue_TaskTestOne];
//    [self queue_TaskTestTwo];
//    [self queue_TaskTestThree];
//    [self queue_TaskTestFour];
    
}

//1. 串行队列 + 同步执行
- (void)queue_TaskTestOne{
    
    NSLog(@"1111---%@", [NSThread currentThread]);
    dispatch_sync(self.serialQueue, ^{
        NSLog(@"1112---%@", [NSThread currentThread]);
    });
    dispatch_sync(self.serialQueue, ^{
        NSLog(@"1113---%@", [NSThread currentThread]);
    });
    dispatch_sync(self.serialQueue, ^{
        NSLog(@"1114---%@", [NSThread currentThread]);
    });
    NSLog(@"1115---%@", [NSThread currentThread]);
}

//2. 串行队列 + 异步执行
- (void)queue_TaskTestTwo{
    
    NSLog(@"2111---%@", [NSThread currentThread]);//---主线程
    dispatch_async(self.serialQueue, ^{
        NSLog(@"2112---%@", [NSThread currentThread]);//---子线程
    });
    dispatch_async(self.serialQueue, ^{
        NSLog(@"2113---%@", [NSThread currentThread]);//---子线程
    });
    dispatch_async(self.serialQueue, ^{
        NSLog(@"2114---%@", [NSThread currentThread]);//---子线程
    });
    NSLog(@"2115---%@", [NSThread currentThread]);//---主线程
}

//3. 并行队列 + 同步执行
- (void)queue_TaskTestThree{
    
    NSLog(@"3111---%@", [NSThread currentThread]);
    dispatch_sync(self.concurrentQueue, ^{
        NSLog(@"3112---%@", [NSThread currentThread]);
    });
    dispatch_sync(self.concurrentQueue, ^{
        NSLog(@"3113---%@", [NSThread currentThread]);
    });
    dispatch_sync(self.concurrentQueue, ^{
        NSLog(@"3114---%@", [NSThread currentThread]);
    });
    NSLog(@"3115---%@", [NSThread currentThread]);
}

//4. 并行队列 + 异步执行
- (void)queue_TaskTestFour{
    
    NSLog(@"4111---%@", [NSThread currentThread]);
    dispatch_async(self.concurrentQueue, ^{
        NSLog(@"4112---%@", [NSThread currentThread]);
    });
    dispatch_async(self.concurrentQueue, ^{
        NSLog(@"4113---%@", [NSThread currentThread]);
    });
    dispatch_async(self.concurrentQueue, ^{
        NSLog(@"4114---%@", [NSThread currentThread]);
    });
    NSLog(@"4115---%@", [NSThread currentThread]);
}

#pragma mark - 开子线程的方式
//- (void)kai





/*
 1. 对于单核CPU来说，不存在真正意义上的并行，所以，多线程执行任务，其实也只是一个人在干活，CPU的调度决定了非等待任务的执行速率，同时对于非等待任务，多线程并没有真正意义提高效率。
 
 2. 线程可以简单的认为就是一段代码+运行时数据。
 
 3. 同步执行会在当前线程执行任务，不具备开辟线程的能力或者说没有必要开辟新的线程。并且，同步执行必须等到Block函数执行完毕，dispatch函数才会返回，从而阻塞同一串行队列中外部方法的执行。
 
 4. 异步执行dispatch函数会直接返回，Block函数我们可以认为它会在下一帧加入队列，并根据所在队列目前的任务情况无限下一帧执行，从而不会阻塞当前外部任务的执行。同时，只有异步执行才有开辟新线程的必要，但是异步执行不一定会开辟新线程。
 
 5. 只要是队列，肯定是FIFO（先进先出），但是谁先执行完要看第1条。
 
 6. 只要是串行队列，肯定要等上一个任务执行完成，才能开始下一个任务。但是并行队列当上一个任务开始执行后，下一个任务就可以开始执行。
 
 7. 想要开辟新线程必须让任务在异步执行，想要开辟多个线程，只有让任务在并行队列中异步执行才可以。执行方式和队列类型多层组合在一定程度上能够实现对于代码执行顺序的调度。
 
 8. 同步+串行：未开辟新线程，串行执行任务；同步+并行：未开辟新线程，串行执行任务；异步+串行：新开辟一条线程，串行执行任务；异步+并行：开辟多条新线程，并行执行任务；在主线程中同步使用主队列执行任务，会造成死锁。
 
 8. 对于多核CPU来说，线程数量也不能无限开辟，线程的开辟同样会消耗资源，过多线程同时处理任务并不是你想像中的人多力量大。
 */



@end
