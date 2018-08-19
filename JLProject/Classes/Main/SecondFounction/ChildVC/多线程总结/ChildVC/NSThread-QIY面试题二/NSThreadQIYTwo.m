//
//  NSThreadQIYTwo.m
//  JLProject
//
//  Created by UCS on 2018/8/19.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "NSThreadQIYTwo.h"

@interface NSThreadQIYTwo ()
@property (nonatomic, strong) NSThread *threadOne;
@end

@implementation NSThreadQIYTwo
/*
 NSThread
 父类是NSObject
 （1）NSThread的创建
 
 //第一种创建线程的方式：alloc initWithTarget.
 //特点：需要手动开启线程，可以拿到线程对象进行详细设置
 //创建线程
 第一个参数：目标对象
 第二个参数：选择器，线程启动要调用哪个方法
 第三个参数：前面方法要接收的参数（最多只能接收一个参数，没有则传nil）
 NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"wendingding"];
 //启动线程
 [thread start];
 
 //第二种创建线程的方式：分离出一条子线程
 //特点：自动启动线程，无法对线程进行更详细的设置
 第一个参数：线程启动调用的方法
 第二个参数：目标对象
 第三个参数：传递给调用方法的参数
 [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"我是分离出来的子线程"];
 
 //第三种创建线程的方式：后台线程
 //特点：自动启动线程，无法对线程进行更详细设置
 [self performSelectorInBackground:@selector(run:) withObject:@"我是后台线程"];
 
 //第四种创建线程的方式：alloc init
 //特点：任务封装在自定义对象的main方法中，不暴露
 NSThread *thread = [[NSThread alloc]init];
 
 //启动任务
 [thread start];
 
 //常用的控制线程状态的方法
 [thread start];//进入就绪状态，等待运行
 [NSThread sleepForTimeInterval:2.0];//阻塞线程
 [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:2.0]];//阻塞线程
 [NSThread exit];//强制退出当前线程
 
 //注意：线程死了不能复生，线程死了与线程对象是否释放无关（可用成员属性强指针指向某线程，线程对象存在，但线程任务完成时依然会“死”）
 //通过break,return提前结束任务，是正常死亡而非强制让线程死亡
 
 */

/*
 01 前提：多个线程访问同一块资源会发生数据安全问题，“同一块资源”：比如同一个对象、同一个变量、同一个文件
 
 02 解决方案：加互斥锁
 2.1 实质：通过线程同步，使同一块资源在同一时间只能被一个线程访问，其余线程等待访问
 2.2 优点：能有效防止因多线程抢夺资源造成的数据安全问题
 2.3 缺点：需要消耗大量的CPU资源
 
 03 相关代码：@synchronized(self){}
 3.1 锁定1份代码只用1把锁，用多把锁是无效的
 3.2 锁对象一般使用self
 @synchronized(锁对象) { // 需要锁定的代码  }
 
 04 专业术语-线程同步
 4.1 线程同步即多条线程在同一条线上执行（按顺序地执行任务）
 4.2 互斥锁使用了线程同步技术
 
 05 原子和非原子属性（主要是对setter方法加锁）
 5.1 OC在定义属性时有nonatomic和atomic两种选择
 5.1-1 atomic：原子属性，为setter方法加锁（默认就是atomic）；线程安全，需要消耗大量的资源
 5.1-2 nonatomic：非原子属性，不会为setter方法加锁；非线程安全，适合内存小的移动设备
 5.2 iOS开发的建议
 5.2-1 所有属性都声明为nonatomic
 5.2-2 尽量避免多线程抢夺同一块资源
 5.2-3 尽量将加锁、资源抢夺的业务逻辑交给服务器端处理，减小移动客户端的压力
 */

/*
 线程间通信
 
 01 在1个进程中，线程往往不是孤立存在的，多个线程之间需要经常进行通信
 02 线程间通信的体现
 2-1 1个线程传递数据给另1个线程
 2-2 在1个线程中执行完特定任务后，转到另1个线程继续执行任务
 03 线程间通信方式 – 利用NSPort（没有讲，知道即可，暂不用深究）
*/

/*
 关于exit的结论
 使当前线程退出.
 不能在主线程中调用该方法.会使主线程退出.
 当当前线程死亡之后,这个线程中的代码都不会被执行.
 在调用此方法之前一定要注意释放之前由C语言框架创建的对象.
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"主线程栈区空间大小 => %tu",[NSThread currentThread].stackSize/1024);

    self.threadOne = [[NSThread alloc] initWithTarget:self selector:@selector(myPlay) object:@"MYPLAY"];
    /*
     线程属性
     属性
     name - 线程名称
     给线程起名字,可以方便运行调试,定位BUG
     在大型的商业软件中,都会设计专门的线程做特定的事情,当程序崩溃时可以快速准确的定位BUG
     
     threadPriority - 线程优先级
     为浮点数整形,范围在0~1之间,1最高,默认0.5,不建议修改线程优先级
     线程的"优先级"不是决定线程调用顺序的,他是决定线程备CPU调用的频率的
     在开发的时候,不要修改优先级
     多线程开发的原则是越简单越好
     
     stackSize - 栈区大小
     默认情况下,无论是主线程还是子线程,栈区大小都是512KB
     栈区大小可以设置,最小16KB,但是必须是4KB的整数倍
     */
    //设置线程的名称
    self.threadOne.name = @"threadA";
    //设置线程的优先级,注意线程优先级的取值范围为0.0~1.0之间，1.0表示线程的优先级最高,如果不设置该值，那么理想状态下默认为0.5
    self.threadOne.threadPriority = 1.0;
//    self.threadOne.stackSize
    [self.threadOne start];
    
}

- (void)myPlay{
    
    NSLog(@"myPlay-线程栈区空间大小 => %tu",[NSThread currentThread].stackSize/1024);
    // 添加下边两句代码，就可以开启RunLoop，之后self.thread就变成了常驻线程，可随时添加任务，并交于RunLoop处理
    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
    // 测试是否开启了RunLoop，如果开启RunLoop，则来不了这里，因为RunLoop开启了循环。
    NSLog(@"未开启RunLoop");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    DLog(@"点击了");
    [self performSelector:@selector(tesk) onThread:self.threadOne withObject:nil waitUntilDone:NO];
}


- (void)tesk{
    
    DLog(@"执行任务");
    NSLog(@"当前线程:%@",[NSThread currentThread]);

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.threadOne cancel];
//    [self.threadOne e]
}

- (void)dealloc{
    DLog(@"销毁了--%@", self.threadOne);
}


@end
