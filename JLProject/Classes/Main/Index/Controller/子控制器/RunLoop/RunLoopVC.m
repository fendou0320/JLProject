//
//  RunLoopVC.m
//  JLProject


//RunLoop-死循环
//1、主线程默认开启
//目的：
//--保证程序不退出
//--负责监听事件（时钟事件、网络事件、触摸事件）（和设备紧密相连）

//2、RunLoop无法创建，只能拿到当前RunLoop

//3、RunLoop mode官方文档5种模式
//(1)NSDefaultRunLoopMode：默认模式
//(2)UITrackingRunLoopMode ：UI模式
//(3)NSRunLoopCommonModes：占位模式，包含以上两种模式
//(4)NSConnectionReplyMode：用来监控NSConnection对象的回复的---用不到
//(5)NSModalPanelRunLoopMode：用于标明和Mode Panel相关的事件---用不到
// RunLoop会优先处理UI模式的事件,UI模式优先级最高，UI模式只能被UI事件所唤醒。
//
//4、线程如果没有了任务会回收，进行销毁。线程内的RunLoop也会随之销毁。
//
//5、想保住线程的生命，只有一个办法，让线程有执行不完的任务。
//
//6、主线程对于系统来说，就是一条子线程，也会销毁掉（[NSThread exit];//退出当前线程）
//
//7、UIKit框架线程不安全
//（1）、nonatomic，没有锁，线程不安全，多条线程可以抢夺资源
//（2）、atomic，有锁，线程安全，
//
//8、UI的操作，只允许主线程操作（苹果的设计原则）
//
//9、viewDidLoad先执行主线程、后面才执行子线程
//
//10、线程只有有NSRunLoop才能处理事件
//
//11、线程的通讯是添加了一个事件，必然是有NSRunLoop才能处理事件
//
//12、Source 事件源：按照 分为两种
//（1）、Source0：非Source1
//（2）、Source1：系统内核和其他线程通信
//
//
//
//
//


#import "RunLoopVC.h"

@interface RunLoopVC ()
@property (nonatomic, assign) BOOL finish;
@end

@implementation RunLoopVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _finish = NO;
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, 100)];
    [self.view addSubview:textView];
    textView.text = @"NSDefaultRunLoopMode：默认的运行模式，用于大部分操作，除了NSConnection对象事件。NSConnectionReplyMode：用来监控NSConnection对象的回复的，很少能够用到。NSModalPanelRunLoopMode：用于标明和Mode Panel相关的事件。NSEventTrackingRunLoopMode：用于跟踪触摸事件触发的模式（例如UIScrollView上下滚动）。NSRunLoopCommonModes：是一个模式集合，当绑定一个事件源到这个模式集合的时候就相当于绑定到了集合内的每一个模式。";
    
//    [self demoOne];
//    [self demoTwo];
    
    //线程间的通信
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"viewDidLoad---%@", [NSThread currentThread]);
        while (!_finish) {
            [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.0001]];
        }
    }];
    
    [thread start];
    
    [NSThread sleepForTimeInterval:1.0];
    DLog(@"main thread睡醒了");
    
    [self performSelector:@selector(otherMethod) onThread:thread withObject:nil waitUntilDone:NO];
 
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _finish = YES;
}


- (void)timeMethod{
    
    if (_finish) {
        [NSThread exit];//退出当前线程
    }
    
    NSLog(@"进入2");
    [NSThread sleepForTimeInterval:1.0];
    
    static int a = 0;
    a++;
    DLog(@"计时---%d", a);
    
}

- (void)otherMethod{
    
    DLog(@"otherMethod --- %@", [NSThread currentThread]);
}

- (void)demoOne{
    
    //主线程RunLoop
    [NSRunLoop mainRunLoop];
    //当前线程RunLoop
    [NSRunLoop currentRunLoop];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timeMethod) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];//NSDefaultRunLoopMode//UITrackingRunLoopMode
    
}

- (void)demoTwo{
    
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timeMethod) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        //开启子线程的RunLoop循环--死循环
        //        [[NSRunLoop currentRunLoop] run];//--到这里不会再往下执行
        while (!_finish) {
            [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.001]];
        }
        NSLog(@"进入1");
    }];
    [thread start];
}


@end
