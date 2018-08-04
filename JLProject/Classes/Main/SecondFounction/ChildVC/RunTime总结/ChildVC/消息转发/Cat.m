//
//  Cat.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/29.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "Cat.h"

@implementation Cat

//- (void)run
//{
//    NSLog(@"run--跑步");
//}
//
//- (void)eat
//{
//    NSLog(@"eat--吃饭");
//}
//
//- (void)sing: (NSString *)name
//{
//    NSLog(@"sing--唱歌歌名为：%@", name);
//}


/*
 Q:说一下你理解的消息转发机制？
 
 A:
 
 先会调用objc_msgSend方法，首先在Class中的缓存查找IMP，没有缓存则初始化缓存。如果没有找到，则向父类的Class查找。如果一直查找到根类仍旧没有实现，则执行消息转发。
 
 1、调用resolveInstanceMethod：方法。允许用户在此时为该Class动态添加实现。如果有实现了，则调用并返回YES，重新开始objc_msgSend流程。这次对象会响应这个选择器，一般是因为它已经调用过了class_addMethod。如果仍没有实现，继续下面的动作。
 
 2、调用forwardingTargetForSelector:方法，尝试找到一个能响应该消息的对象。如果获取到，则直接把消息转发给它，返回非nil对象。否则返回nil，继续下面的动作。注意这里不要返回self，否则会形成死循环。
 
 3、调用methodSignatureForSelector:方法，尝试获得一个方法签名。如果获取不到，则直接调用doesNotRecognizeSelector抛出异常。如果能获取，则返回非nil;传给一个NSInvocation并传给forwardInvocation：。
 
 4、调用forwardInvocation:方法，将第三步获取到的方法签名包装成Invocation传入，如何处理就在这里面了，并返回非nil。
 
 5、调用doesNotRecognizeSelector：，默认的实现是抛出异常。如果第三步没能获得一个方法签名，执行该步骤 。
 
 
 */


+ (BOOL)resolveInstanceMethod:(SEL)sel{

    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
    
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    
    [super forwardInvocation:anInvocation];
}

- (void)doesNotRecognizeSelector:(SEL)aSelector{
    NSLog(@"%@", NSStringFromSelector(aSelector));
}



@end
