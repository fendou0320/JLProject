//
//  RetainCycleOneVC.m
//  JLProject
//
//  Created by UCS on 2018/7/29.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "RetainCycleOneVC.h"
#import "RetainCycleManager.h"

#if DEBUG
#import "FBRetainCycleDetector.h"
#endif

@interface RetainCycleOneVC ()
@property (nonatomic, strong) RetainCycleManager *manager;
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation RetainCycleOneVC

/*
 解决办法有两个：
 a.GCD完成NSTimer的功能
 https://github.com/mindsnacks/MSWeakTimer
 b.用一个中间对象处理
 YYWeakProxy
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.array = [NSMutableArray arrayWithCapacity:3];

    [self creatSubView];
}


- (void)creatSubView{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 150, kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btn];
    btn.backgroundColor = RandomColor;
    [btn setTitle:@"普通循环引用" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btntwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btntwo.frame = CGRectMake(0, SIZE_IPHONE6(250), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btntwo];
    btntwo.backgroundColor = RandomColor;
    [btntwo setTitle:@"系统的block api 不会产生循环引用" forState:UIControlStateNormal];
    [btntwo addTarget:self action:@selector(btnTwo:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnthree = [UIButton buttonWithType:UIButtonTypeCustom];
    btnthree.frame = CGRectMake(0, SIZE_IPHONE6(350), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btnthree];
    btnthree.backgroundColor = RandomColor;
    [btnthree setTitle:@"GCD" forState:UIControlStateNormal];
    [btnthree addTarget:self action:@selector(demoShow:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnFour = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFour.frame = CGRectMake(0, SIZE_IPHONE6(450), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btnFour];
    btnFour.backgroundColor = RandomColor;
    [btnFour setTitle:@"Proxy" forState:UIControlStateNormal];
    [btnFour addTarget:self action:@selector(btnFour:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)btnOne: (UIButton *)sender{
   
    _manager = [[RetainCycleManager alloc] init];
    _manager.eatBlock = ^(int a, int b) {
        [_array addObject:@"001"];
    };
    [_manager beginToEat];
    
    FBRetainCycleDetector *detector = [FBRetainCycleDetector new];
    [detector addCandidate:self];
    NSSet *retainCycles = [detector findRetainCycles];
    NSLog(@"循环引用了%@", retainCycles);
}


- (void)btnTwo: (UIButton *)sender{
    
    /*
     系统的某些block api中，UIView的block版本写动画时不需要考虑，但也有一些api需要考虑。所谓“引用循环”是指双向的强引用，
     所以那些“单向的强引用”（block 强引用 self ）没有问题，比如这些：
     */
    
    [UIView animateWithDuration:1.0 animations:^{
        self.view.backgroundColor = [UIColor greenColor];
        [self.array addObject:@"02"];
    }];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.view.backgroundColor = [UIColor yellowColor];
        [self.array addObject:@"03"];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"someNotification"
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification * notification) {
                                                      [self.array addObject:@"03"];
                                                  }];
  
    FBRetainCycleDetector *detector = [FBRetainCycleDetector new];
    [detector addCandidate:self];
    NSSet *retainCycles = [detector findRetainCycles];
    NSLog(@"循环引用了%@", retainCycles);
    
}


- (void)demoShow: (UIButton *)sender{
   
    /*
     但如果你使用一些参数中可能含有成员变量的系统api，如GCD、NSNotificationCenter就要小心一点。比如GCD内部如果引用了 self，而且GCD的其他参数是成员变量，则要考虑到循环引用
     */
    dispatch_queue_t disqueue = dispatch_queue_create("com.baidu", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t disgroup = dispatch_group_create();
    dispatch_group_async(disgroup, disqueue, ^{
        [self.array addObject:@"04"];
    });
    dispatch_group_async(disgroup, disqueue, ^{
        [self.array addObject:@"05"];
    });
    dispatch_group_async(disgroup, disqueue, ^{
        [self.array addObject:@"06"];
    });
    dispatch_group_notify(disgroup, disqueue, ^{
        NSLog(@"dispatch_group_notify 执行");
        DLog(@"%@", self.array);
    });
    
    FBRetainCycleDetector *detector = [FBRetainCycleDetector new];
    [detector addCandidate:self];
    NSSet *retainCycles = [detector findRetainCycles];
    NSLog(@"循环引用了%@", retainCycles);
}


- (void)btnFour: (UIButton *)sender{
    
    
    FBRetainCycleDetector *detector = [FBRetainCycleDetector new];
    [detector addCandidate:self];
    NSSet *retainCycles = [detector findRetainCycles];
    NSLog(@"循环引用了%@", retainCycles);
}





@end
