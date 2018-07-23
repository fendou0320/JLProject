//
//  CategoryAddPropertyVC.m
//  JLProject
//
//  Created by UCS on 2018/7/23.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "CategoryAddPropertyVC.h"
#import "CategoryAddPropertyVC+Person.h"

@interface CategoryAddPropertyVC ()

@end

@implementation CategoryAddPropertyVC

/*
 相关函数
 
 与 Associated Objects 相关的函数主要有三个，我们可以在 runtime 源码的 runtime.h 文件中找到它们的声明：
 
 1 void objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
 2 id objc_getAssociatedObject(id object, const void *key);
 3 void objc_removeAssociatedObjects(id object);
 
 （1）相关参数
 key：要保证全局唯一，key与关联的对象是一一对应关系。必须全局唯一。通常用@selector(methodName)作为key。
 value：要关联的对象。
 policy：关联策略。有五种关联策略。
 OBJC_ASSOCIATION_ASSIGN 等价于 @property(assign)或@property()。
 OBJC_ASSOCIATION_RETAIN_NONATOMIC等价于 @property(strong, nonatomic)。
 OBJC_ASSOCIATION_COPY_NONATOMIC等价于@property(copy, nonatomic)。
 OBJC_ASSOCIATION_RETAIN等价于@property(strong,atomic)。
 OBJC_ASSOCIATION_COPY等价于@property(copy, atomic)。
 
 
 （2）这三个函数的命名对程序员非常友好，可以让我们一眼就看出函数的作用：
 objc_setAssociatedObject 用于给对象添加关联对象，传入 nil 则可以移除已有的关联对象；
 objc_getAssociatedObject 用于获取关联对象；
 objc_removeAssociatedObjects 用于移除一个对象的所有关联对象。
 注：objc_removeAssociatedObjects 函数我们一般是用不上的，因为这个函数会移除一个对象的所有关联对象，将该对象恢复成“原始”状态。这样做就很有可能把别人添加的关联对象也一并移除，这并不是我们所希望的。所以一般的做法是通过给 objc_setAssociatedObject 函数传入 nil 来移除某个已有的关联对象。
 
 （3）key 值
 关于前两个函数中的 key 值是我们需要重点关注的一个点，这个 key 值必须保证是一个对象级别（为什么是对象级别？看完下面的章节你就会明白了）的唯一常量。一般来说，有以下三种推荐的 key 值：
 声明 static char kAssociatedObjectKey; ，使用 &kAssociatedObjectKey 作为 key 值;
 声明 static void *kAssociatedObjectKey = &kAssociatedObjectKey; ，使用 kAssociatedObjectKey 作为 key 值；
 用 selector ，使用 getter 方法的名称作为 key 值。
 我个人最喜欢的（没有之一）是第 3 种方式，因为它省掉了一个变量名，非常优雅地解决了计算科学中的两大世界难题之一（命名）。
 
 （4）原理简介
 运行时通过map维系一张关联对象与被关联对象之间的关系。
 objc_setAssociatedObject的相关代码.
 void _object_set_associative_reference(id object, void *key, id value, uintptr_t policy) {
 // retain the new value (if any) outside the lock.
 ObjcAssociation old_association(0, nil);
 id new_value = value ? acquireValue(value, policy) : nil;
 {
 AssociationsManager manager;
 AssociationsHashMap &associations(manager.associations());
 disguised_ptr_t disguised_object = DISGUISE(object);
 if (new_value) {
 // break any existing association.
 AssociationsHashMap::iterator i = associations.find(disguised_object);
 if (i != associations.end()) {
 // secondary table exists
 ObjectAssociationMap *refs = i->second;
 ObjectAssociationMap::iterator j = refs->find(key);
 if (j != refs->end()) {
 old_association = j->second;
 j->second = ObjcAssociation(policy, new_value);
 } else {
 (*refs)[key] = ObjcAssociation(policy, new_value);
 }
 } else {
 // create the new association (first time).
 ObjectAssociationMap *refs = new ObjectAssociationMap;
 associations[disguised_object] = refs;
 (*refs)[key] = ObjcAssociation(policy, new_value);
 object->setHasAssociatedObjects();
 }
 } else {
 // setting the association to nil breaks the association.
 AssociationsHashMap::iterator i = associations.find(disguised_object);
 if (i !=  associations.end()) {
 ObjectAssociationMap *refs = i->second;
 ObjectAssociationMap::iterator j = refs->find(key);
 if (j != refs->end()) {
 old_association = j->second;
 refs->erase(j);
 }
 }
 }
 }
 // release the old value (outside of the lock).
 if (old_association.hasValue()) ReleaseValue()(old_association);
 }
 代码中涉及到的一些数据结构。
 AssociationsManager 是顶级的对象，维护了一个从 spinlock_t 锁到 AssociationsHashMap 哈希表的单例键值对映射；
 AssociationsHashMap 是一个无序的哈希表，维护了从对象地址到 ObjectAssociationMap 的映射；
 ObjectAssociationMap 是一个 C 中的 map ，维护了从 key 到 ObjcAssociation 的映射，即关联记录；
 ObjcAssociation 是一个 C 的类，表示一个具体的关联结构，主要包括两个实例变量，_policy 表示关联策略，_value 表示关联对象。

 
 
 */



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)text1 {
    NSLog(@"%s",__func__);
}

- (void)text2 {
    NSLog(@"%s",__func__);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //获取成员变量
    unsigned int ivarCount = 0;
    Ivar *ivars = class_copyIvarList([CategoryAddPropertyVC class], &ivarCount);
    for (int i = 0; i < ivarCount; i++) {
        Ivar ivar = ivars[i];
        NSLog(@"第%d个成员变量：%s",i,ivar_getName(ivar));
    }
    free(ivars);
    
    //获取属性
    unsigned int propertyCount = 0;
    objc_property_t *propertyList = class_copyPropertyList([CategoryAddPropertyVC class], &propertyCount);
    for (int i = 0; i < propertyCount; i++) {
        objc_property_t property = propertyList[i];
        NSLog(@"第%d个属性：%s",i,property_getName(property));
    }
    
    //获取方法列表
    unsigned int methodCount = 0;
    Method *methods = class_copyMethodList([CategoryAddPropertyVC class], &methodCount);
    for (int i = 0; i < methodCount; i++) {
        Method method = methods[i];
        NSLog(@"第%d个方法：%s",i, sel_getName(method_getName(method)));
    }    
    
}


@end
