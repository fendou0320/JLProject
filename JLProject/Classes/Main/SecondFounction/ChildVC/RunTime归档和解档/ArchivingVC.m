//
//  ArchivingVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/12.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "ArchivingVC.h"
#import "ArchivingPerson.h"
#import <objc/message.h>
#import "SerializeDemo.h"

@interface ArchivingVC ()

@end

@implementation ArchivingVC

//获取某类的所有属性变量API：
//objc_property_t *class_copyPropertyList(Class cls, unsigned int *outCount)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //归档和解档
    [self archivingAction];
    
    //序列化和反序列化
    [self serializeAction];
    
    //MARK:  使用请看demo类----SerializeDemo
    
}

#pragma mark - 归档和解档
- (void)archivingAction{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 150, kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btn];
    btn.backgroundColor = RandomColor;
    [btn setTitle:@"归档" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btntwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btntwo.frame = CGRectMake(0, SIZE_IPHONE6(250), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btntwo];
    btntwo.backgroundColor = RandomColor;
    [btntwo setTitle:@"解档" forState:UIControlStateNormal];
    [btntwo addTarget:self action:@selector(btnTwo:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnthree = [UIButton buttonWithType:UIButtonTypeCustom];
    btnthree.frame = CGRectMake(0, SIZE_IPHONE6(350), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btnthree];
    btnthree.backgroundColor = RandomColor;
    [btnthree setTitle:@"demo展示" forState:UIControlStateNormal];
    [btnthree addTarget:self action:@selector(demoShow:) forControlEvents:UIControlEventTouchUpInside];
    
//    NSLog(@"%@", NSTemporaryDirectory());
}

- (void)btnOne: (UIButton *)sender{
    
    ArchivingPerson *person = [[ArchivingPerson alloc] init];
    person.name = @"jiangliang";
    person.age = @"18";
    person.fatherName = @"fathername";
    person.fatherage = @"50";

    NSString *temp = NSTemporaryDirectory();
    NSString *filePath = [temp stringByAppendingPathComponent:@"jiangLiang.text"];
    //归档
    [NSKeyedArchiver archiveRootObject:person toFile:filePath];
    
    //----demo----
    SerializeDemo *demo = [[SerializeDemo alloc] init];
    demo.name = @"jiangliang";
    demo.age = @"18";
    demo.fatherName = @"fathername";
    demo.fatherage = @"50";
    NSString *demofilePath = [temp stringByAppendingPathComponent:@"demojiangLiang.text"];
    //归档
    [NSKeyedArchiver archiveRootObject:demo toFile:demofilePath];
    
}

- (void)btnTwo: (UIButton *)sender{
    
    NSString *temp = NSTemporaryDirectory();
    NSString *filePath = [temp stringByAppendingPathComponent:@"jiangLiang.text"];
    //解档
    ArchivingPerson *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    DLog(@"%@老师%@岁了", p.name, p.age);
    DLog(@"%@老师父亲%@---%@岁了", p.name, p.fatherName, p.fatherage);

    //使用copy方法
    ArchivingPerson *copyP = [p copy];
    
    DLog(@"copy--%@老师%@岁了", copyP.name, copyP.age);
    DLog(@"copy--%@老师父亲%@---%@岁了", copyP.name, copyP.fatherName, copyP.fatherage);
    
//    NSString *descriptionStr = [p shareDescription];
//    NSLog(@"原属性%@", descriptionStr);
    
    NSLog(@"copy后的%@", [copyP shareDescription]);
    
}

- (void)demoShow: (UIButton *)sender{
    
    NSString *temp = NSTemporaryDirectory();
    NSString *filePath = [temp stringByAppendingPathComponent:@"demojiangLiang.text"];
    //解档
    SerializeDemo *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    DLog(@"%@老师%@岁了", p.name, p.age);
    DLog(@"%@老师父亲%@---%@岁了", p.name, p.fatherName, p.fatherage);
    DLog("%@", [p description]);

    //使用copy方法
    SerializeDemo *copyP = [p copy];
    DLog(@"copy--%@老师%@岁了", copyP.name, copyP.age);
    DLog(@"copy--%@老师父亲%@---%@岁了", copyP.name, copyP.fatherName, copyP.fatherage);
    DLog("%@", [p description]);
    
}


#pragma mark - 序列化和反序列化
- (void)serializeAction{
    
    //运行时
    /*
     Method：成员方法
     ivar：成员属性
     */
    
    /*
     Method：成员方法
     */
    
    /*
     ivar：成员属性
     Ivar是runtime对于变量的定义，本质是一个结构体
     struct objc_ivar {
     char *ivar_name;
     char *ivar_type;
     int ivar_offset;
     #ifdef __LP64__
     int space;
     #endif
     }
     typedef struct objc_ivar *Ivar;
     ivar_name:变量名，对于一个给定的Ivar，可以通过const char *ivar_getName(Ivar v) 函数获得char *类型的变量名；
     ivar_type: 变量类型，在runtime中变量类型用字符串表示，例如用@表示id类型，用i表示int类型...。这不在本文讨论之列。类似地，可以通过const char *ivar_getTypeEncoding(Ivar v) 函数获得变量类型；
     ivar_offset： 基地址偏移字节数，可以不用理会
     */
    
    //-------------------获取类的成员变量--使用Ivar------------------------------------------
    unsigned int numIvars = 0;
    //runtime中获取某类的所有变量(属性变量以及实例变量)API：
    //Ivar *class_copyIvarList(Class cls, unsigned int *outCount)
    Ivar *vars = class_copyIvarList([ArchivingPerson class], &numIvars);
    
//    {
//        Ivar ivarOne = vars[1];
//        const char *ivarOnename = ivar_getName(ivarOne);
//        NSLog(@"%s", ivarOnename);
//        //会崩溃
//        Ivar ivarTwo = vars[100];
//        const char *ivarTwoname = ivar_getName(ivarTwo);
//        NSLog(@"%s", ivarTwoname);
//    }
    
    //    Ivar *vars = class_copyIvarList(NSClassFromString(@"UIView"), &numIvars);
    //key的个数
    NSString *key = nil;
    for (int i = 0; i < numIvars; i++) {
        Ivar thisIvar = vars[i];
        //获取成员变量名字/*变量列表，含属性以及私有变量*/ 
        key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        NSLog(@"variable name :%@", key);
        //获取成员变量的数据类型
        key = [NSString stringWithUTF8String:ivar_getTypeEncoding(thisIvar)];
        NSLog(@"variable type :%@", key);
    }
    //记得释放掉
    free(vars);
    
    //-------------------获取类的属性变量--使用objc_property_t------------------------------------------
    //objc_property_t是runtime对于属性变量的定义，本质上也是一个结构体（事实上OC是对C的封装，大多数类型的本质都是C结构体）。在runtime.h头文件中只有typedef struct objc_property *objc_property_t，并没有更详细的结构体介绍。
    
    unsigned int outCount, i;
    objc_property_t *propertys = class_copyPropertyList([ArchivingPerson class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = propertys[i];
        //获取属性名字
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        NSLog(@"objc_property_t获取属性名字---variable name :%@", propertyName);
        //获取属性类型--property_getAttributes： runtime 头文件中这个 C 语言方法了 ，其作用就是用来获取属性的真实类型。
        NSString *propertyType = [[NSString alloc] initWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
        NSLog(@"objc_property_t获取属性类型---variable type :%@", propertyType);
        
        //        上面例子输出
        //        name: num
        //        attrs: T@"i", C,N,V_num
        //        上面输出我们可以看出，name 自然是这个属性的名称了，但是 attrs: Ti,N,V_num 这串字符串又是什么呢？
        //        我来为大家解析一下：
        //        通过阅读苹果官方文档可以看出
        //        T: 在大写 T 后面是放的是该属性的数据类型
        //        V: 在大写 V 后面放的是该属性的变量名称(因为我们知道 @property 实际上只是为我们编写好了 getter 和 setter 方法，并创建一个以下划线开头的变量)
        //        输出中看出，T后面放的是 i，那么 i 又是什么类型呢？
    }
    
    //class_copyIvarList 带有copy new等的方法有强引用，会retain，需要free（）
    
    free(propertys);
    
}




@end
