//
//  ArchivingPerson.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/12.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "ArchivingPerson.h"

@implementation ArchivingPerson

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:_name forKey:@"name"];
    [coder encodeObject:_age forKey:@"age"];

}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _name = [coder decodeObjectForKey:@"name"];
        _age = [coder decodeObjectForKey:@"age"];
    }
    return self;
}

@end
