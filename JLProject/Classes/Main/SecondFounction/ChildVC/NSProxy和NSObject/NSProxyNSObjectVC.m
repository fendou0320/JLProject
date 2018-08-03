//
//  NSProxyNSObjectVC.m
//  JLProject
//
//  Created by UCS on 2018/8/2.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "NSProxyNSObjectVC.h"
#import "JLProxyA.h"
#import "JLProxyB.h"

@interface NSProxyNSObjectVC ()

@end

@implementation NSProxyNSObjectVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"NSProxy和NSObject";
    
    NSString *string = @"string";
    
    JLProxyA *proxyA = [[JLProxyA alloc] initWithObject:string];
    JLProxyB *proxyB = [[JLProxyB alloc] initWithObject:string];
    
    NSLog(@"%d", [proxyA respondsToSelector:@selector(length)]);
    NSLog(@"%d", [proxyB respondsToSelector:@selector(length)]);
    
    NSLog(@"%d", [proxyA isKindOfClass:[NSString class]]);
    NSLog(@"%d", [proxyB isKindOfClass:[NSString class]]);
    
    //举一个很常见的例子, valueForKey:是定义在NSKeyValueCoding这个NSObject的Category中的方法, 尝试二者执行的表现.
//    NSLog(@"%@",[proxyA valueForKey:@"length"]);
    NSLog(@"%@",[proxyB valueForKey:@"length"]);
    
    /*
     这段代码第一句能正确运行,
     但第二行却会抛出异常, 分析最终原因其实很简单, 因为valueForKey:是NSObject的Category中定义的方法, 让NSObject具备了这样的接口, 而消息转发是只有当接收者无法处理时才会通过forwardInvocation:来寻求能够处理的对象.
     */
    
    /*
     结论: 如此看来NSProxy确实更适合实现做为消息转发的代理类, 因为作为一个抽象类, NSProxy自身能够处理的方法极小(仅<NSObject>接口中定义的部分方法), 所以其它方法都能够按照设计的预期被转发到被代理的对象中.
     */
    
    
    
    
}


/*
 也就是说通过继承自NSObject的代理类是不会自动转发respondsToSelector:和isKindOfClass:这两个方法的,
 而继承自NSProxy的代理类却是可以的. 测试<NSObject>中定义的其它接口二者表现都是一致的.
 */











@end
