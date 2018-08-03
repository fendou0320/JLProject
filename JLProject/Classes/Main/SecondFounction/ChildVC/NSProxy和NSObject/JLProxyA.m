//
//  JLProxyA.m
//  JLProject
//
//  Created by UCS on 2018/8/2.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "JLProxyA.h"

@implementation JLProxyA

- (id)initWithObject:(id)object{
    self.target = object;
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    return [self.target methodSignatureForSelector:selector];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}




@end
