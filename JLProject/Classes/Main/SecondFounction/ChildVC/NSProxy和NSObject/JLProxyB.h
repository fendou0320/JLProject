//
//  JLProxyB.h
//  JLProject
//
//  Created by UCS on 2018/8/2.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLProxyB : NSObject

@property (nonatomic, strong) id target;

- (id)initWithObject: (id)object;

@end
