//
//  GCDGroupCaseVC.m
//  JLProject
//
//  Created by UCS on 2018/8/5.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "GCDGroupCaseVC.h"

@interface GCDGroupCaseVC ()
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIImage *imageOne;
@property (nonatomic, strong) UIImage *imageTwo;
@end

@implementation GCDGroupCaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"下载两张图片然后合并图片显示";
    
//    [self operation1];
    
    /*一个队列组内，两个队列并行，队列内串行*/
//    [self demoOne];
    /*一个队列组内，两个队列串行，队列内并行*/
//    [self demoTwo];
    
    /*dispatch_group_enter 和 dispatch_group_level*/
    //demoThree和demoThree对比才能看到效果
//    [self demoThree];
    [self demoFour];
    
    
}


- (void)operation1
{
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 450, 0, 0)];
    textLabel.text = @"正在下载图片";
    [textLabel sizeToFit];
    [self.view addSubview:textLabel];
    self.textLabel = textLabel;
    [self group];
    NSLog(@"在下载图片的时候，主线程貌似还可以干点什么");
}

- (void)group
{
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("cn.gcd-group.www", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"正在下载第一张图片");
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://images2015.cnblogs.com/blog/471463/201509/471463-20150912213125372-589808688.png"]];
        NSLog(@"第一张图片下载完毕");
        self.imageOne = [UIImage imageWithData:data];
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"正在下载第二张图片");
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://images2015.cnblogs.com/blog/471463/201509/471463-20150912212457684-585830854.png"]];
        NSLog(@"第二张图片下载完毕");
        self.imageTwo = [UIImage imageWithData:data];
    });
    
    dispatch_group_notify(group, queue, ^{
        
        UIGraphicsBeginImageContext(CGSizeMake(300, 400));
        [self.imageOne drawInRect:CGRectMake(0, 0, 150, 400)];
        [self.imageTwo drawInRect:CGRectMake(150, 0, 150, 400)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
            [self.view addSubview:imageView];
            self.textLabel.text = @"图片合并完毕";
        });
    });
    
    
}

- (void)demoOne{
    
    /*
     DISPATCH_QUQUE_SERIAL:串行队列
     DISPATCH_QUEUE_CONCURRENT：并行队列
     */
    
    /*创建队列组*/
    dispatch_group_t groupOne = dispatch_group_create();
    
    /*创建队列queueOne*/
    dispatch_queue_t queueOne = dispatch_queue_create("queueOne", DISPATCH_QUEUE_SERIAL);
    dispatch_group_async(groupOne, queueOne, ^{
        NSLog(@"11---%@", [NSThread currentThread]);
    });
    dispatch_group_async(groupOne, queueOne, ^{
        NSLog(@"12---%@", [NSThread currentThread]);
    });
    dispatch_group_async(groupOne, queueOne, ^{
        NSLog(@"13---%@", [NSThread currentThread]);
    });
    
    /*创建队列queueTwo*/
    dispatch_queue_t queueTwo = dispatch_queue_create("queueTwo", DISPATCH_QUEUE_SERIAL);
    dispatch_group_async(groupOne, queueTwo, ^{
        NSLog(@"21---%@", [NSThread currentThread]);
    });
    dispatch_group_async(groupOne, queueTwo, ^{
        NSLog(@"22---%@", [NSThread currentThread]);
    });
    dispatch_group_async(groupOne, queueTwo, ^{
        NSLog(@"23---%@", [NSThread currentThread]);
    });
    
    //栅栏函数
    dispatch_barrier_sync(queueOne, ^{
        NSLog(@"14---%@", [NSThread currentThread]);
    });
    
    dispatch_barrier_sync(queueTwo, ^{
        NSLog(@"24---%@", [NSThread currentThread]);
    });
    
    dispatch_group_notify(groupOne, dispatch_get_main_queue(), ^{
        NSLog(@"31-(最终)--%@", [NSThread currentThread]);
    });
    
}

- (void)demoTwo{
    
    /*创建队列组*/
//    dispatch_group_t groupOne = dispatch_group_create();
    
    //并行队列
    dispatch_queue_t queueOne = dispatch_queue_create("wwwqueueOne", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queueOne, ^{
        NSLog(@"11---%@", [NSThread currentThread]);
    });
    dispatch_async(queueOne, ^{
        NSLog(@"12---%@", [NSThread currentThread]);
    });
    dispatch_async(queueOne, ^{
        NSLog(@"13---%@", [NSThread currentThread]);
    });
    
    dispatch_barrier_sync(queueOne, ^{
        
        NSLog(@"14---%@", [NSThread currentThread]);
        //再次建一个队列
        dispatch_queue_t queueTwo = dispatch_queue_create("wwwqueueTwo", DISPATCH_QUEUE_CONCURRENT);
        dispatch_async(queueTwo, ^{
            NSLog(@"21---%@", [NSThread currentThread]);
        });
        dispatch_async(queueTwo, ^{
            NSLog(@"22---%@", [NSThread currentThread]);
        });
        dispatch_async(queueTwo, ^{
            NSLog(@"23---%@", [NSThread currentThread]);
        });
        dispatch_barrier_sync(queueTwo, ^{
            NSLog(@"24---%@", [NSThread currentThread]);
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"32(回到主线程刷新UI)---%@", [NSThread currentThread]);
            });
        });
        NSLog(@"31---%@", [NSThread currentThread]);
    });
}


- (void)demoThree{
    
    dispatch_group_t group = dispatch_group_create();
    
    //串行队列--DISPATCH_QUEUE_SERIAL_INACTIVE
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    //并发队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("wewewewe", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, concurrentQueue, ^{
        NSLog(@"21---%@", [NSThread currentThread]);
        dispatch_async(globalQueue, ^{
            NSLog(@"10---%@", [NSThread currentThread]);
            sleep(5);
            NSLog(@"11---%@", [NSThread currentThread]);
        });
    });
    
    dispatch_group_async(group, concurrentQueue, ^{
        NSLog(@"22---%@", [NSThread currentThread]);
        dispatch_async(globalQueue, ^{
            NSLog(@"12---%@", [NSThread currentThread]);
            sleep(5);
            NSLog(@"13---%@", [NSThread currentThread]);
        });
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"30---终结---%@", [NSThread currentThread]);
    });
    
}

- (void)demoFour{
    
    dispatch_group_t group = dispatch_group_create();
    
    //串行队列--DISPATCH_QUEUE_SERIAL_INACTIVE
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    //并发队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("wewewewe", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_enter(group);
    dispatch_group_async(group, concurrentQueue, ^{
        NSLog(@"21---%@", [NSThread currentThread]);
        dispatch_async(globalQueue, ^{
            NSLog(@"10---%@", [NSThread currentThread]);
            sleep(5);
            NSLog(@"11---%@", [NSThread currentThread]);
            dispatch_group_leave(group);
        });
    });
    
    dispatch_group_enter(group);
    dispatch_group_async(group, concurrentQueue, ^{
        NSLog(@"22---%@", [NSThread currentThread]);
        dispatch_async(globalQueue, ^{
            NSLog(@"12---%@", [NSThread currentThread]);
            sleep(5);
            NSLog(@"13---%@", [NSThread currentThread]);
            dispatch_group_leave(group);
        });
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"30---终结---%@", [NSThread currentThread]);
    });
    
}







@end
