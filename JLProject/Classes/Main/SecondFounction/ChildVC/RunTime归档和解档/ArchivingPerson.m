//
//  ArchivingPerson.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/12.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "ArchivingPerson.h"
#import <objc/runtime.h>

@interface ArchivingPerson (){
    NSString *mFileName;
    NSString *mFileAge;
}
@property (nonatomic, copy) NSString *interfaceName;
@property (nonatomic, copy) NSString *interfaceAge;
@end

@implementation ArchivingPerson

#pragma mark ---------------------------方法一手动操作---------------------------
//- (void)encodeWithCoder:(NSCoder *)coder
//{
//    {
//        [coder encodeObject:_name forKey:@"name"];
//        [coder encodeObject:_age forKey:@"age"];
//    }
//
//}
//- (instancetype)initWithCoder:(NSCoder *)coder
//{
//    self = [super init];
//    if (self) {
//        {
//            _name = [coder decodeObjectForKey:@"name"];
//            _age = [coder decodeObjectForKey:@"age"];
//        }
//    }
//    return self;
//}


#pragma mark ---------------------------方法二使用runTime初级版---------------------------
////编码
//- (void)encodeWithCoder:(NSCoder *)coder
//{
//    unsigned int varCount = 0;
//    Ivar *ivarList = class_copyIvarList([self class], &varCount);
//    for (NSInteger i = 0; i < varCount; i++) {
//        Ivar var = *(ivarList + i);
//        const char *varName = ivar_getName(var);
//        NSString *key = [NSString stringWithUTF8String:varName];
//        id varValue = [self valueForKey:key];
//        if (varValue) {
//            [coder encodeObject:varValue forKey:key];
//        }
//    }
//    free(ivarList);
//}
//
////解码
//- (instancetype)initWithCoder:(NSCoder *)coder
//{
//    self = [super init];
//    if (self) {
//
//        unsigned int ivarCount = 0;
//        //取得变量列表
//        Ivar *ivarList = class_copyIvarList([self class], &ivarCount);
////        Ivar *ivarList = class_copyIvarList(NSClassFromString(@"ArchivingPerson"), &ivarCount);
//        /*
//         在获取变量时都是指定当前类，也就是[self class]。当你的Model对象并不是直接继承自NSObject时容易遗漏掉父类的属性。请牢记3.1节我们提到的：
//         编解码的范围不能仅仅是自身类的变量，还应当把除NSObject类外的所有层级父类的属性变量也进行编解码！
//         而runtime在遍历变量这件事情上能为我们提供什么帮助呢？我们可以通过runtime在运行时获取自身类的所有变量进行编解码；然后对父类进行递归，获取除NSObject外每个层级父类的属性(非私有变量)，进行编解码。
//         */
//        for (int i = 0; i < ivarCount; i++) {
//            Ivar var = *(ivarList + i);
////            Ivar var = ivarList[i];//*(ivarList + i);
//            //取得变量名字，将作为key
//            const char *varName = ivar_getName(var);
//            NSString *key = [NSString stringWithUTF8String:varName];
//            //解码
//            id value = [coder decodeObjectForKey:key];
//            if (value) {
//                //使用KVC强制写入到对象中
//                [self setValue:value forKey:key];
//            }
//        }
//        free(ivarList);
//    }
//    return self;
//}

#pragma mark ---------------------------方法二使用runTime高级版---------------------------
- (void)encodeWithCoder:(NSCoder *)aCoder{
    Class cls = [self class];
    //对NSObject的变量不做处理
    while (cls != [NSObject class]) {
        /*判断是自身类还是父类*/
        BOOL isSelfClass = (cls == [self class]) ? YES : NO;
        unsigned int iVarCount = 0;
        unsigned int propVarCount = 0;
        unsigned int shareCount = 0;
        /*
         class_copyPropertyList返回的仅仅是对象类的属性(@property申明的属性)---用于获取父类
         class_copyIvarList返回类的所有属性和变量(包括在@interface大括号中声明的变量)---用于获取当前类
        */
        /*获取自身--获取变量列表，含属性以及私有变量*/
        Ivar *ivarList = isSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;
        /*获取父类--获取变量列表，只有属性*/
        objc_property_t *propList = isSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);
        /*获取个数*/
        shareCount = isSelfClass ? iVarCount : propVarCount;
        for (int i = 0; i < shareCount; i++) {
            const char *varName = isSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList+i));
            NSString *key = [NSString stringWithUTF8String:varName];
             /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量*/
            id varValue = [self valueForKey:key];
//            NSLog(@"%@--%@", key ,varValue);
            if (varValue) {
                [aCoder encodeObject:varValue forKey:key];
            }
        }
        free(ivarList);
        //指针指向当前类的父类
        cls = class_getSuperclass(cls);
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        Class cls = [self class];
        while (cls != [NSObject class]) {
            /*判断是自身类还是父类*/
            BOOL isSelfClass = (cls == [self class])?YES:NO;
            unsigned int iVarCount = 0;
            unsigned int propVarCount = 0;
            unsigned int shareVarCount = 0;
            /*获取自身--获取变量列表，含属性以及私有变量*/
            Ivar *ivarList = isSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;
            /*获取父类--获取变量列表，只有属性*/
            objc_property_t *propList = isSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);
            /*获取个数*/
            shareVarCount = isSelfClass ? iVarCount : propVarCount;
            for (int i = 0; i < shareVarCount; i++) {
                const char *varName = isSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
                NSString *key = [NSString stringWithUTF8String:varName];
                id varValue = [aDecoder decodeObjectForKey:key];
                NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"];
//                NSLog(@"%@--%@", key ,varValue);
                if (varValue && ([filters containsObject:key]==NO)) {
                    [self setValue:varValue forKey:key];
                }
            }
            free(ivarList);
            free(propList);
            cls = class_getSuperclass(cls);
        }
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    id copyClass = [[[self class] allocWithZone:zone] init];
    Class cls = [self class];
    while (cls != [NSObject class]) {
        /*判断是自身类还是父类*/
        BOOL isSelfClass = (cls == [self class])?YES:NO;
        unsigned int iVarCount = 0;
        unsigned int propVarCount = 0;
        unsigned int shareVarCount = 0;
        /*获取自身--获取变量列表，含属性以及私有变量*/
        Ivar *ivarList = isSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;
        /*获取父类--获取变量列表，只有属性*/
        objc_property_t *propList = isSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);
        /*获取个数*/
        shareVarCount = isSelfClass ? iVarCount : propVarCount;
        for (int i = 0; i < shareVarCount; i++) {
            const char *varName = isSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
            NSString *key = [NSString stringWithUTF8String:varName];
            /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量*/
            id varValue = [self valueForKey:key];
            NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"];
            if (varValue && ([filters containsObject:key]==NO)) {
                [copyClass setValue:varValue forKey:key];
            }
        }
        free(ivarList);
        free(propList);
        cls = class_getSuperclass(cls);
    }
    return copyClass;
}

/* 用来打印本类的所有变量(成员变量+属性变量)，所有层级父类的属性变量及其对应的值 */
- (NSString *)shareDescription
{
    NSString  *descriptionStr = @"";
    Class cls = [self class];
    while (cls != [NSObject class]) {
        /*判断是自身类还是父类*/
        BOOL isSelfClass = (cls == [self class])?YES:NO;
        unsigned int iVarCount = 0;
        unsigned int propVarCount = 0;
        unsigned int shareVarCount = 0;
        /*获取自身--获取变量列表，含属性以及私有变量*/
        Ivar *ivarList = isSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;
        /*获取父类--获取变量列表，只有属性*/
        objc_property_t *propList = isSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);
        /*获取个数*/
        shareVarCount = isSelfClass ? iVarCount : propVarCount;
        for (int i = 0; i < shareVarCount; i++) {
            const char *varName = isSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i));
            NSString *key = [NSString stringWithUTF8String:varName];
            /*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量*/
            id varValue = [self valueForKey:key];
            NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"];
            if (varValue && ([filters containsObject:key]==NO)) {
                descriptionStr = [descriptionStr stringByAppendingString:[NSString stringWithFormat:@"%@: %@,\n", key, varValue]];
            }
        }
        free(ivarList);
        free(propList);
        cls = class_getSuperclass(cls);
    }
    return descriptionStr;
}

//#define WZLSERIALIZE_DESCRIPTION() \
//\
///* 用来打印本类的所有变量(成员变量+属性变量)，所有层级父类的属性变量及其对应的值 */  \
//- (NSString *)description   \
//{   \
//NSString  *despStr = @"";   \
//Class cls = [self class];   \
//while (cls != [NSObject class]) {   \
///*判断是自身类还是父类*/  \
//BOOL bIsSelfClass = (cls == [self class]);  \
//unsigned int iVarCount = 0; \
//unsigned int propVarCount = 0;  \
//unsigned int sharedVarCount = 0;    \
//Ivar *ivarList = bIsSelfClass ? class_copyIvarList([cls class], &iVarCount) : NULL;/*变量列表，含属性以及私有变量*/   \
//objc_property_t *propList = bIsSelfClass ? NULL : class_copyPropertyList(cls, &propVarCount);/*属性列表*/   \
//sharedVarCount = bIsSelfClass ? iVarCount : propVarCount;   \
//\
//for (int i = 0; i < sharedVarCount; i++) {  \
//const char *varName = bIsSelfClass ? ivar_getName(*(ivarList + i)) : property_getName(*(propList + i)); \
//NSString *key = [NSString stringWithUTF8String:varName];    \
///*valueForKey只能获取本类所有变量以及所有层级父类的属性，不包含任何父类的私有变量(会崩溃)*/  \
//id varValue = [self valueForKey:key];   \
//NSArray *filters = @[@"superclass", @"description", @"debugDescription", @"hash"]; \
//if (varValue && [filters containsObject:key] == NO) { \
//despStr = [despStr stringByAppendingString:[NSString stringWithFormat:@"%@: %@\n", key, varValue]]; \
//}   \
//}   \
//free(ivarList); \
//free(propList); \
//cls = class_getSuperclass(cls); \
//}   \
//return despStr; \
//}
@end
