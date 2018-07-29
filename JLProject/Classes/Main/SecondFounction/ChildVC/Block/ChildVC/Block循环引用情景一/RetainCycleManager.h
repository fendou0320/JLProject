//
//  RetainCycleManager.h
//  JLProject
//
//  Created by UCS on 2018/7/29.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^EatBlock) (int a, int b);

@interface RetainCycleManager : NSObject

@property (nonatomic, copy) EatBlock eatBlock;




@end
