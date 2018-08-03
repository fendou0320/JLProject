//
//  JLProxyB.m
//  JLProject
//
//  Created by UCS on 2018/8/2.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "JLProxyB.h"

@implementation JLProxyB

- (id)initWithObject: (id)object{
    
    self = [super init];
    if (self) {
        self.target = object;
    }
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    return [self.target methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    [anInvocation invokeWithTarget:self.target];
}







@end
