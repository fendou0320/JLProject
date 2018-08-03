//
//  ProxyVC.m
//  JLProject
//
//  Created by UCS on 2018/7/30.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "ProxyVC.h"
#import "JLWeakProxy.h"

#if DEBUG
#import "FBRetainCycleDetector.h"
#endif

@interface ProxyVC ()
@property (nonatomic, strong) CADisplayLink *timerInC;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIImageView *imgV;
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation ProxyVC

/*
 OC中的三种定时器：CADisplayLink、NSTimer、GCD
 */

/*
 runloop的几种mode：

 Default模式
 定义：NSDefaultRunLoopMode (Cocoa) kCFRunLoopDefaultMode (Core Foundation)
 描述：默认模式中几乎包含了所有输入源(NSConnection除外),一般情况下应使用此模式。
 
 Connection模式
 定义：NSConnectionReplyMode(Cocoa)
 描述：处理NSConnection对象相关事件，系统内部使用，用户基本不会使用。
 
 Modal模式
 定义：NSModalPanelRunLoopMode(Cocoa)
 描述：处理modal panels事件。
 
 Event tracking模式
 定义：UITrackingRunLoopMode(iOS)
 NSEventTrackingRunLoopMode(cocoa)
 描述：在拖动loop或其他user interface tracking loops时处于此种模式下，在此模式下会限制输入事件的处理。例如，当手指按住UITableView拖动时就会处于此模式。
 
 Common模式
 定义：NSRunLoopCommonModes (Cocoa) kCFRunLoopCommonModes (Core Foundation)
 描述：这是一个伪模式，其为一组run loop mode的集合，将输入源加入此模式意味着在Common Modes中包含的所有模式下都可以处理。在Cocoa应用程序中，默认情况下Common Modes包含default modes,modal modes,event Tracking modes.可使用CFRunLoopAddCommonMode方法想Common Modes中添加自定义modes。
 */

/*
 iOS中
 NSDefaultRunLoopMode
 UITrackingRunLoopMode
 NSRunLoopCommonModes
 全局仅有一条主线程，用来刷新UI。需要不断重绘的scrollView及其子类，享有一个专用的runloopMode，UITrackingRunLoopMode。
 当scrollView发生滚动时，当前runloop会切换为UITrackingRunLoopMode。如果你的定时器加到NSDefaultRunLoopMode中那么滚动的时候，计时器动作就停止了。这时，你需要将timer加载NSRunLoopCommonModes中，才能保证滚动与停止时你的timer都会触发事件。
 */

/*
 使用NSTimer时，timer会自动retain一次target和userInfo参数。由此而导致可能在使用NSTimer时，出现UIViewController不能释放的问题。
 循环应用链
 self-->timer-->self
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Proxy解循环引用";
    
    self.imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.imgV.contentMode = UIViewContentModeScaleAspectFill;
    self.imgV.backgroundColor = [UIColor greenColor];
    self.imgV.center = self.view.center;
    [self.view addSubview:self.imgV];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOne.frame = CGRectMake(0, SIZE_IPHONE6(0), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:btnOne];
    btnOne.backgroundColor = RandomColor;
    [btnOne setTitle:@"解除循环引用" forState:UIControlStateNormal];
    [btnOne addTarget:self action:@selector(btnFour:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTwo.frame = CGRectMake(0, SIZE_IPHONE6(40), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:btnTwo];
    btnTwo.backgroundColor = RandomColor;
    [btnTwo setTitle:@"添加NSTimer循环引用" forState:UIControlStateNormal];
    [btnTwo addTarget:self action:@selector(btnTwo:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnThree = [UIButton buttonWithType:UIButtonTypeCustom];
    btnThree.frame = CGRectMake(0, SIZE_IPHONE6(80), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:btnThree];
    btnThree.backgroundColor = RandomColor;
    [btnThree setTitle:@"添加NSTimer--NSProxy" forState:UIControlStateNormal];
    [btnThree addTarget:self action:@selector(btnThree:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnFour = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFour.frame = CGRectMake(0, SIZE_IPHONE6(120), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:btnFour];
    btnFour.backgroundColor = RandomColor;
    [btnFour setTitle:@"打印循环引用" forState:UIControlStateNormal];
    [btnFour addTarget:self action:@selector(btnFour:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)userCADisplayLink{
    
    ///target selector 模式初始化一个实例
    self.timerInC = [CADisplayLink displayLinkWithTarget:self selector:@selector(changeImg)];
    ///暂停
    self.timerInC.paused = YES;
    ///selector触发间隔
    self.timerInC.frameInterval = 0.5;
    ///加入一个runLoop
    [self.timerInC addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)userTimer{
    
    //(1)使用self---循环引用
//    self.timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(changeImg) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    //(2)使用weakedSelf---循环引用
    weakedSelf
    self.timer = [NSTimer timerWithTimeInterval:2 target:weakSelf selector:@selector(changeImg) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    self.timerInC.paused = !self.timerInC.paused;

}

- (void)userProxyTimer{
    
    self.timer = [NSTimer timerWithTimeInterval:2 target:[JLWeakProxy proxyWithTarget:self] selector:@selector(changeImg) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    self.timerInC.paused = !self.timerInC.paused;

}


-(void)changeImg
{
    self.currentIndex ++;
    if (self.currentIndex > 75) {
        self.currentIndex = 1;
    }
    self.imgV.backgroundColor = RandomColor;
}

- (void)btnOne: (UIButton *)sender{
   
    if (self.timer) {
        [self.timer invalidate];
    }
}

- (void)btnTwo: (UIButton *)sender{
    
    //计时器方式一
    //    [self userCADisplayLink];
    
    //计时器方式二
    [self userTimer];
}

- (void)btnThree: (UIButton *)sender{
    
    [self userProxyTimer];
}

- (void)btnFour: (UIButton *)sender{
    
    FBRetainCycleDetector *detector = [FBRetainCycleDetector new];
    [detector addCandidate:self];
    NSSet *retainCycles = [detector findRetainCycles];
    NSLog(@"循环引用了%@", retainCycles);

}




@end
