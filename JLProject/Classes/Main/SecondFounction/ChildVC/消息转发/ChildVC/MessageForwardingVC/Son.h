//
//  Son.h
//  JLProject
//
//  Created by UCS on 2018/7/10.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Son : NSObject

+ (void)sonRun;

- (void)run;

- (void)eat;

- (void)sing: (NSString *)name;

- (void)sing: (NSString *)name withEat: (NSString *)eat;

@end
