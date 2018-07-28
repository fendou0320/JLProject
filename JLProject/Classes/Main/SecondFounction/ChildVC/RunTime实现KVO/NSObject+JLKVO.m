//
//  NSObject+JLKVO.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/28.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "NSObject+JLKVO.h"
#import <objc/message.h>

@implementation NSObject (JLKVO)

void setAge(id self, SEL _cmd, int age){
    
//    DLog(@"data comming");
    //    objc_msgSendSuper(self, @selector(setName:), name)
    //调用父类的方法--通过父类的方法来赋值
    id class = [self class];
    //让自己指向父类
    object_setClass(self, class_getSuperclass([self class]));
    id superClass = [self class];
    //给父类发送消息
    objc_msgSend(superClass, @selector(setName:), age);
    //再将指针指向自己
    object_setClass(self, class);
}

- (void)JLAddObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    
    /*
     1、动态添加一个类
     */
    
    NSString *oldClassName = NSStringFromClass([self class]);
    NSString *newClassName = [@"JL" stringByAppendingString:oldClassName];
    //C语言需要转换
    const char * newName = [newClassName UTF8String];
    
    /*
     定义一个类---返回一个class类型
     myClass内部没有任何父类[self class]的任何属性
     */
    Class myClass = objc_allocateClassPair([self class], newName, 0);
    //重写setage方法
    class_addMethod(myClass, @selector(setName:), (IMP)setAge, "");
    
    //注册一个类
    objc_registerClassPair(myClass);
    
    //改变isa指针
    object_setClass(self, myClass);
    
}







@end
