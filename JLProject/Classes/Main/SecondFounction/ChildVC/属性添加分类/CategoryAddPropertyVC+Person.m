//
//  CategoryAddPropertyVC+Person.m
//  JLProject
//
//  Created by UCS on 2018/7/23.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "CategoryAddPropertyVC+Person.h"

static NSString *offsetKey = @"offset";
static NSString *nameKey   = @"name";
static NSString *pointKey  = @"pointKey";


#import <objc/runtime.h>

@implementation CategoryAddPropertyVC (Person)

- (void)setAge:(NSString *)age{
    //关联设置
    objc_setAssociatedObject(self, @"age", age, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)age{
    //设置关联
    return objc_getAssociatedObject(self, @"age");
}


/*
 1 void objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
 2 id objc_getAssociatedObject(id object, const void *key);
 */
/*
 key 值
 关于前两个函数中的 key 值是我们需要重点关注的一个点，这个 key 值必须保证是一个对象级别（为什么是对象级别？看完下面的章节你就会明白了）的唯一常量。一般来说，有以下三种推荐的 key 值：
 一、
 声明 static char kAssociatedObjectKey; ，使用 &kAssociatedObjectKey 作为 key 值;
 声明 static void *kAssociatedObjectKey = &kAssociatedObjectKey; ，使用 kAssociatedObjectKey 作为 key 值；
 静态变量&btnKey
 二、
 用 selector ，使用 getter 方法的名称作为 key 值。
 @selector(methodName)
 三、
 _cmd
 */
/*
 policy：关联策略。有五种关联策略。
 OBJC_ASSOCIATION_ASSIGN 等价于 @property(assign)或@property()。
 OBJC_ASSOCIATION_RETAIN_NONATOMIC等价于 @property(strong, nonatomic)。
 OBJC_ASSOCIATION_COPY_NONATOMIC等价于@property(copy, nonatomic)。
 OBJC_ASSOCIATION_RETAIN等价于@property(strong,atomic)。
 OBJC_ASSOCIATION_COPY等价于@property(copy, atomic)。
 */


//三种类型设置
/*
 * 添加基本数据类型需要转化为NSNumber类型
 */

- (void)setOffset:(CGFloat)offset{
    NSNumber *numberValue = [NSNumber numberWithFloat:offset];
    objc_setAssociatedObject(self, &offsetKey, numberValue, OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)offset{
    NSNumber *numberValue = objc_getAssociatedObject(self, &offsetKey);
    return [numberValue doubleValue];
}

/*
 * 对象类型
 */
- (void)setName:(NSString *)name{
    objc_setAssociatedObject(self, &nameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name{
    return objc_getAssociatedObject(self, &nameKey);
}

/*
 * 添加结构体属性
 * 需要包装成NSValue
 */
- (void)setPoint:(CGPoint)point{
    
    NSValue *value = [NSValue value:&point withObjCType:@encode(CGPoint)];
    objc_setAssociatedObject(self, &pointKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGPoint)point{
    
    NSValue *value = objc_getAssociatedObject(self, &pointKey);
    if (value) {
        CGPoint point;
        [value getValue:&point];
        return point;
    }else{
        return CGPointZero;
    }
}




@end
