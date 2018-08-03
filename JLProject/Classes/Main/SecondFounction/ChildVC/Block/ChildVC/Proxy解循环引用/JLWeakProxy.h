//
//  JLWeakProxy.h
//  JLProject
//
//  Created by UCS on 2018/7/30.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLWeakProxy : NSObject

@property (nonatomic, weak, readonly) id target;

- (instancetype)initWithTarget:(id)target;

+ (instancetype)proxyWithTarget:(id)target;

@end
