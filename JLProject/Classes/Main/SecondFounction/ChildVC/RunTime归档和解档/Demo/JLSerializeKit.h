//
//  JLSerializeKit.h
//  JLProject
//
//  Created by UCS on 2018/7/18.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#ifndef JLSerializeKit_h
#define JLSerializeKit_h

#import <objc/runtime.h>

#define JLSERIALIZE_CODER_DECODER()     \
\
- (void)encodeWithCoder:(NSCoder *)aCoder{  \
    Class cls = [self class];   \
    /*对NSObject的变量不做处理*/     \
    while (cls != [NSObject class]) {   \
        /*判断是自身类还是父类*/  \
        BOOL isSelfClass = (cls == [self class]) ? YES : NO; \
        unsigned int iVarCount = 0; \
        unsigned int propVarCount = 0; \
        unsigned int shareCount = 0;\
    /*class_copyPropertyList返回的仅仅是对象类的属性(@property申明的属性)---用于获取父类;
      class_copyIvarList返回类的所有属性和变量(包括在@interface大括号中声明的变量)---用于获取当前类*/ \
        /*获取自身--获取变量列表，含属性以及私有变量*/ \
        Ivar *ivarList = isSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL; \
        /*获取父类--获取变量列表，只有属性*/ \
        objc_property_t *propList = isSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount); \
        /*获取个数*/ \
        shareCount = isSelfClass ? iVarCount : propVarCount; \
        for (int i = 0; i < shareCount; i++) { \
            const char *varName = isSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList+i)); \
            NSString *key = [NSString stringWithUTF8String:varName]; \
            /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量*/ \
            id varValue = [self valueForKey:key]; \
            if (varValue) { \
                [aCoder encodeObject:varValue forKey:key]; \
            } \
        } \
        free(ivarList); \
        /*指针指向当前类的父类*/ \
        cls = class_getSuperclass(cls); \
    } \
} \
\
- (instancetype)initWithCoder:(NSCoder *)aDecoder{   \
    self = [super init];    \
    if (self) { \
        Class cls = [self class];   \
        while (cls != [NSObject class]) {   \
            /*判断是自身类还是父类*/  \
            BOOL isSelfClass = (cls == [self class])?YES:NO;    \
            unsigned int iVarCount = 0; \
            unsigned int propVarCount = 0;  \
            unsigned int shareVarCount = 0; \
            /*获取自身--获取变量列表，含属性以及私有变量*/  \
            Ivar *ivarList = isSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;  \
            /*获取父类--获取变量列表，只有属性*/   \
            objc_property_t *propList = isSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);    \
            /*获取个数*/    \
            shareVarCount = isSelfClass ? iVarCount : propVarCount; \
            for (int i = 0; i < shareVarCount; i++) {   \
                const char *varName = isSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));  \
                NSString *key = [NSString stringWithUTF8String:varName];    \
                id varValue = [aDecoder decodeObjectForKey:key];    \
                NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"];  \
                if (varValue && ([filters containsObject:key]==NO)) {   \
                    [self setValue:varValue forKey:key];    \
                }   \
            }   \
            free(ivarList); \
            free(propList); \
            cls = class_getSuperclass(cls); \
        }   \
    }   \
    return self;    \
}   \

#define JLSERIALIZE_COPY_WITH_ZONE()  \
\
/*如果不实现copyWithZone:方法，则[Object copy]时会崩溃*/ \
- (id)copyWithZone:(NSZone *)zone{  \
    id copyClass = [[[self class] allocWithZone:zone] init];    \
    Class cls = [self class];   \
    while (cls != [NSObject class]) {   \
        /*判断是自身类还是父类*/  \
        BOOL isSelfClass = (cls == [self class])?YES:NO;    \
        unsigned int iVarCount = 0; \
        unsigned int propVarCount = 0;  \
        unsigned int shareVarCount = 0; \
        /*获取自身--获取变量列表，含属性以及私有变量*/  \
        Ivar *ivarList = isSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;  \
        /*获取父类--获取变量列表，只有属性*/   \
        objc_property_t *propList = isSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);    \
        /*获取个数*/    \
        shareVarCount = isSelfClass ? iVarCount : propVarCount; \
        for (int i = 0; i < shareVarCount; i++) {   \
            const char *varName = isSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));  \
            NSString *key = [NSString stringWithUTF8String:varName];    \
            /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量*/   \
            id varValue = [self valueForKey:key];   \
            NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"];  \
            if (varValue && ([filters containsObject:key]==NO)) {   \
                [self setValue:varValue forKey:key];    \
            }   \
        }   \
        free(ivarList); \
        free(propList); \
        cls = class_getSuperclass(cls); \
    }   \
    return copyClass;   \
}   \

#define JLSERIALIZE_DESCRIPTION() \
\
/* 用来打印本类的所有变量(成员变量+属性变量)，所有层级父类的属性变量及其对应的值 */  \
- (NSString *)shareDescription  \
{   \
    NSString  *descriptionStr = @"";    \
    Class cls = [self class];   \
    while (cls != [NSObject class]) {   \
        /*判断是自身类还是父类*/  \
        BOOL isSelfClass = (cls == [self class])?YES:NO;    \
        unsigned int iVarCount = 0; \
        unsigned int propVarCount = 0;  \
        unsigned int shareVarCount = 0; \
        /*获取自身--获取变量列表，含属性以及私有变量*/  \
        Ivar *ivarList = isSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;  \
        /*获取父类--获取变量列表，只有属性*/   \
        objc_property_t *propList = isSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);    \
        /*获取个数*/    \
        shareVarCount = isSelfClass ? iVarCount : propVarCount; \
        for (int i = 0; i < shareVarCount; i++) {   \
            const char *varName = isSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));  \
            NSString *key = [NSString stringWithUTF8String:varName];    \
            /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量*/   \
            id varValue = [self valueForKey:key];   \
            NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"];  \
            if (varValue && ([filters containsObject:key]==NO)) {   \
                descriptionStr = [descriptionStr stringByAppendingString:[NSString stringWithFormat:@"%@: %@,\n", key, varValue]];  \
            }   \
        }   \
        free(ivarList); \
        free(propList); \
        cls = class_getSuperclass(cls); \
    }   \
    return descriptionStr;  \
}   \

#endif /* JLSerializeKit_h */
