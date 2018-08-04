//
//  Dog.h
//  JLProject
//
//  Created by jiangliangwang on 2018/7/28.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject{
    @public
    NSString *address;
}

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger age;

/*
 @property声明的属性默认会生成一个_类型的成员变量，同时也会生成setter/getter方法。
 苹果将默认编译器从GCC转换为LLVM(low level virtual machine)，从此不再需要为属性声明实例变量了。如果LLVM发现一个没有匹配实例变量的属性，它将自动创建一个以下划线开头的实例变量
 
 */


/*
 @synthesize的作用：
 (1)让编译器为你自动生成setter与getter方法。
 (2)可以指定与属性对应的实例变量，例如@synthesize myButton = xxx；那么self.myButton其实是操作的实例变量xxx，而不是_myButton了。
 (3)现在：如果.m文件中写了@synthesize myButton，那么生成的实例变量就是myButton；如果没写@synthesize myButton，那么生成的实例变量就是_myButton。所以跟以前的用法还是有点细微的区别。
 */

/*
 成员变量的作用范围:
 @public:在任何地方都能直接访问对象的成员变量
 @private:只能在当前类的对象方法中直接访问,如果子类要访问需要调用父类的get/set方法
 @protected:可以在当前类及其子类对象方法中直接访问(系统默认下是用它来修饰的)
 @package:在同一个包下就可以直接访问，比如说在同一个框架
 
 注意：
 无论父类是在@interface还是@implementation声明的成员变量子类都能拥有；但是子类能不能直接通过变量名来访问父类中定义的成员变量是需要看父类中定义的成员变量是由什么修饰符来修饰的。
 
 默认：在@implementation中成员变量的修饰符为@private,
 在@interface中成员变量的修饰符@protected
 */




@end


