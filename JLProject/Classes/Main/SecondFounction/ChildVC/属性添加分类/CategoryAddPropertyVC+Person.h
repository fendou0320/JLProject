//
//  CategoryAddPropertyVC+Person.h
//  JLProject
//
//  Created by UCS on 2018/7/23.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "CategoryAddPropertyVC.h"

@interface CategoryAddPropertyVC (Person)

@property (nonatomic, strong) NSString *age;

/*
 * 基本数据类型
 */
@property (nonatomic,assign) CGFloat offset;

/*
 * 对象类型
 */
@property (nonatomic,copy)   NSString *name;

/*
 * 结构体(CGPoint)
 */
@property (nonatomic,assign) CGPoint point;


@end
