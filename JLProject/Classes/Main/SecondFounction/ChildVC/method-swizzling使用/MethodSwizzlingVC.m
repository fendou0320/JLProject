//
//  MethodSwizzlingVC.m
//  JLProject
//
//  Created by UCS on 2018/7/10.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MethodSwizzlingVC.h"
#import "MethodSwizzlingSonVC.h"

#import <objc/runtime.h>
#import <objc/message.h>

@interface MethodSwizzlingVC ()

@end

//    //判断类中是否包含某个方法的实现
//    BOOL class_respondsToSelector(Class cls, SEL sel)
//    //获取类中的方法列表
//    Method *class_copyMethodList(Class cls, unsigned int *outCount)
//    //为类添加新的方法,如果方法该方法已存在则返回NO
//    BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
//    //替换类中已有方法的实现,如果该方法不存在添加该方法
//    IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
//    //获取类中的某个实例方法(减号方法)
//    Method class_getInstanceMethod(Class cls, SEL name)
//    //获取类中的某个类方法(加号方法)
//    Method class_getClassMethod(Class cls, SEL name)
//    //获取类中的方法实现
//    IMP class_getMethodImplementation(Class cls, SEL name)
//    //获取类中的方法的实现,该方法的返回值类型为struct
//    IMP class_getMethodImplementation_stret(Class cls, SEL name)
//
//    //获取Method中的SEL
//    SEL method_getName(Method m)
//    //获取Method中的IMP
//    IMP method_getImplementation(Method m)
//    //获取方法的Type字符串(包含参数类型和返回值类型)
//    const char *method_getTypeEncoding(Method m)
//    //获取参数个数
//    unsigned int method_getNumberOfArguments(Method m)
//    //获取返回值类型字符串
//    char *method_copyReturnType(Method m)
//    //获取方法中第n个参数的Type
//    char *method_copyArgumentType(Method m, unsigned int index)
//    //获取Method的描述
//    struct objc_method_description *method_getDescription(Method m)
//    //设置Method的IMP
//    IMP method_setImplementation(Method m, IMP imp)
//    //替换Method
//    void method_exchangeImplementations(Method m1, Method m2)
//
//    //获取SEL的名称
//    const char *sel_getName(SEL sel)
//    //注册一个SEL
//    SEL sel_registerName(const char *str)
//    //判断两个SEL对象是否相同
//    BOOL sel_isEqual(SEL lhs, SEL rhs)
//
//    //通过块创建函数指针,block的形式为^ReturnType(id self,参数,...)
//    IMP imp_implementationWithBlock(id block)
//    //获取IMP中的block
//    id imp_getBlock(IMP anImp)
//    //移出IMP中的block
//    BOOL imp_removeBlock(IMP anImp)
//
//    //调用target对象的sel方法
//    id objc_msgSend(id target, SEL sel, 参数列表...)


@implementation MethodSwizzlingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MethodSwizzling的使用和情景";
    
}

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //本类的方法替换
        [self swizzWithClass:[self class] originSel:NSSelectorFromString(@"dealloc") newSel:NSSelectorFromString(@"swizzDealloc")];
        //其他类的方法替换
        [self swizzWithClass:[MethodSwizzlingSonVC class] originSel:NSSelectorFromString(@"dealloc") newSel:NSSelectorFromString(@"swizzDealloc")];
    });
    
}

+ (void)swizzWithClass: (Class)class originSel: (SEL)originSel newSel: (SEL)newSel
{
    
//    class_getInstanceMethod     得到类的实例方法
//    class_getClassMethod          得到类的类方法
    Method originM = class_getInstanceMethod(class, originSel);
    Method newM = class_getInstanceMethod(class, newSel);
    
    IMP newImp = method_getImplementation(newM);
    
//    BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
//    参数说明：
//    cls：被添加方法的类
//    name：可以理解为方法名，这个貌似随便起名，比如我们这里叫sayHello2
//    imp：实现这个方法的函数
//    types：一个定义该函数返回值类型和参数类型的字符串，这个具体会在后面讲
    BOOL addMethodSuccess = class_addMethod(class, newSel, newImp, method_getTypeEncoding(newM));
    
    if (addMethodSuccess) {
        class_replaceMethod(class, originSel, newImp, method_getTypeEncoding(newM));
    }else{
        method_exchangeImplementations(originM, newM);
    }
    
    
}

- (void)dealloc{
    DLog(@"原来的dealloc销毁");
}

- (void)swizzDealloc{
    DLog(@"新的swizzDealloc销毁");
}




@end
