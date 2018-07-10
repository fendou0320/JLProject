//
//  Son.m
//  JLProject
//
//  Created by UCS on 2018/7/10.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "Son.h"

@implementation Son

+ (void)sonRun
{
    NSLog(@"类方法sonRun");
}

- (void)run
{
    NSLog(@"run--跑步");
}

- (void)eat
{
    NSLog(@"eat--吃饭");
}

- (void)sing: (NSString *)name
{
    NSLog(@"sing--唱歌歌名为：%@", name);
}

- (void)sing: (NSString *)name withEat: (NSString *)eat
{
    NSLog(@"sing--唱歌歌名为：%@ 吃饭：%@", name, eat);
}


-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
//        signature = [self.displayLabel methodSignatureForSelector:aSelector];
        DLog(@"123456");
    }
    return signature;
}

-(void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL selector = [anInvocation selector];
    
    DLog(@"123456");
    DLog(@"%@", selector);

//    if ([self.displayLabel respondsToSelector:selector]) {
//        [anInvocation invokeWithTarget:self.displayLabel];
//    }
    
}




@end
