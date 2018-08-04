//
//  ArchivingPerson.h
//  JLProject
//
//  Created by jiangliangwang on 2018/7/12.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArchivingFather.h"

@interface ArchivingPerson : ArchivingFather<NSCoding,NSCopying>{
    
    NSString *hFileName;
    NSString *hFileAge;
}

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *age;

@property (nonatomic, assign) SupportedLanguage age1;
@property (nonatomic, assign) NSInteger age2;
@property (nonatomic, strong) NSMutableArray *age3;

/* 用来打印本类的所有变量(成员变量+属性变量)，所有层级父类的属性变量及其对应的值 */
- (NSString *)shareDescription;


@end
