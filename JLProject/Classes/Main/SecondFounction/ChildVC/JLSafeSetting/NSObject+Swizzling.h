//
//  NSObject+Swizzling.h
//  JLProject
//
//  Created by jiangliang on 2019/3/3.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Swizzling)

+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector;


@end

NS_ASSUME_NONNULL_END
