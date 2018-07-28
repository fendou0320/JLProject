//
//  NSObject+JLKVO.h
//  JLProject
//
//  Created by jiangliangwang on 2018/7/28.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JLKVO)

- (void)JLAddObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
