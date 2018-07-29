//
//  Father.m
//  JLProject
//
//  Created by UCS on 2018/7/10.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "Father.h"
#import <objc/message.h>

@implementation Father

//InstanceMethod  实例方法

/*
 class_addMethod(Class cls, SEL name, IMP imp, const char *types)
 第一个
 Class cls
 cls ：你要添加新方法的那个类
 第二个
 SEL name
 name ：要添加的方法  可以理解为方法名，这个貌似随便起名
  第三个
 IMP imp
 imp：实现这个方法的函数,指向实现方法的指针   就是要添加的方法的实现部分
  第四个
 const char *types
 *types：我们要添加的方法的返回值和参数
 */

/*
  id objc, SEL _cmd   默认参数
  id obj
 */
void eat (id objc, SEL _cmd, id obj){
    DLog(@"%@---%@---%@", objc, NSStringFromSelector(_cmd), obj);
}

//调用一个没有实现的方法
+ (BOOL)resolveInstanceMethod:(SEL)sel{

//    NSLog(@"%@", NSStringFromSelector(sel));
    if (sel == @selector(drinkMilk:)) {
        //IMP 方法实现，就是函数指针
        class_addMethod([Father class], @selector(drinkMilk:), (IMP)eat, "v");
    }
    return [super resolveClassMethod:sel];
}


- (void)drinkMilk: (NSString *)food{
    
}



@end
