//
//  AssociatedObjectsVC.m
//  JLProject
//
//  Created by UCS on 2018/7/10.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "AssociatedObjectsVC.h"

@interface AssociatedObjectsVC ()

@end

@implementation AssociatedObjectsVC

//    关联对象是指某个OC对象通过一个唯一的key连接到一个类的实例上。
//    举个例子：xiaoming是Person类的一个实例，他的dog（一个OC对象）通过一根绳子（key）被他牵着散步，这可以说xiaoming和dog是关联起来的，当然xiaoming可以牵着多个dog。

//    怎样关联对象
//    runtime提供給我们的方法：
//    //关联对象
//    void objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)
//    //获取关联的对象
//    id objc_getAssociatedObject(id object, const void *key)
//    //移除关联的对象
//    void objc_removeAssociatedObjects(id object)

//    变量说明：
//    id object：被关联的对象（如xiaoming）
//    const void *key：关联的key，要求唯一
//    id value：关联的对象（如dog）
//    objc_AssociationPolicy policy：内存管理的策略
//    objc_AssociationPolicy policy的enum值有：

//    OBJC_ASSOCIATION_ASSIGN = 0,
//    OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1,
//    OBJC_ASSOCIATION_COPY_NONATOMIC = 3,
//    OBJC_ASSOCIATION_RETAIN = 01401,
//    OBJC_ASSOCIATION_COPY = 01403

//    当对象被释放时，会根据这个策略来决定是否释放关联的对象，当策略是RETAIN/COPY时，会释放（release）关联的对象，当是ASSIGN，将不会释放。
//    值得注意的是，我们不需要主动调用removeAssociated来接触关联的对象，如果需要解除指定的对象，可以使用setAssociatedObject置nil来实现。



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"associated objects关联对象";
    
    
    
    
}














@end
