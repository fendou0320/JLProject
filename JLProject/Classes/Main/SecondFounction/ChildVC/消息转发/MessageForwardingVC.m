//
//  MessageForwardingVC.m
//  JLProject
//
//  Created by UCS on 2018/7/10.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MessageForwardingVC.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "Son.h"
#import "Father.h"
#import "Dog.h"
#import "Cat.h"

@interface MessageForwardingVC ()
@property (nonatomic, strong) Dog *dog;
@property (nonatomic, strong) Cat *cat;
@end

@implementation MessageForwardingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息转发";
    
    [self creatSubView];
        
}


- (void)creatSubView{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 150, kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btn];
    btn.backgroundColor = RandomColor;
    [btn setTitle:@"消息转发普通应用" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btntwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btntwo.frame = CGRectMake(0, SIZE_IPHONE6(250), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btntwo];
    btntwo.backgroundColor = RandomColor;
    [btntwo setTitle:@"动态添加方法" forState:UIControlStateNormal];
    [btntwo addTarget:self action:@selector(btnTwo:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnthree = [UIButton buttonWithType:UIButtonTypeCustom];
    btnthree.frame = CGRectMake(0, SIZE_IPHONE6(350), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btnthree];
    btnthree.backgroundColor = RandomColor;
    [btnthree setTitle:@"KVO观察机制" forState:UIControlStateNormal];
    [btnthree addTarget:self action:@selector(demoShow:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnFour = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFour.frame = CGRectMake(0, SIZE_IPHONE6(450), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btnFour];
    btnFour.backgroundColor = RandomColor;
    [btnFour setTitle:@"消息转发实现" forState:UIControlStateNormal];
    [btnFour addTarget:self action:@selector(btnFour:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnOne: (UIButton *)sender{
    //模拟系统方法的实现
    //    Son *son = [[Son alloc] init];
    //    Son *son = objc_msgSend([Son class], @selector(alloc));
    //    Son *son = objc_msgSend(objc_getClass("Son"), sel_registerName("alloc"));
    
    //    son = objc_msgSend(son, @selector(init));
    //    son = objc_msgSend(son, sel_registerName("init"));
    
    //    Son *son = objc_msgSend(objc_msgSend(objc_getClass("Son"), sel_registerName("alloc")), sel_registerName("init")) ;
    
    Son *son = objc_msgSend(objc_msgSend(objc_getClass("Son"), sel_registerName("alloc")), sel_registerName("init"));
    
    //    //常规--两种方法调用语法
    //    //(1)
    //    [son run];
    //    //(2)@selector(run):方法编号
    //    [son performSelector:@selector(run)];
    
    //消息发送-调用
    objc_msgSend(son, @selector(run));
    objc_msgSend(son, @selector(sing:), @"最初的梦想");
    objc_msgSend(son, @selector(sing:withEat:), @"梦想", @"红烧肉");
    objc_msgSend(son, @selector(sing:withEat:), @"梦想");
    
}


- (void)btnTwo: (UIButton *)sender{
    
    Father *father = [[Father alloc] init];
    //    [father drinkMilk];
    [father performSelector:@selector(drinkMilk:) withObject:@"红烧肉和鸡腿堡"];
    
}

- (void)demoShow: (UIButton *)sender{
    
    _dog = [[Dog alloc] init];
    [_dog addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [_dog addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    [_dog addObserver:self forKeyPath:@"address" options:NSKeyValueObservingOptionNew context:nil];

    //点语法： kvo监听set方法
    _dog.name = @"Huang";
    self.dog.age = 12;
    
    //MARK: -> 访问成员变量的用法
    //直接访问成员变量，kvo监听不到
    _dog->address = @"boy";
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    DLog(@"%@", keyPath);
}

- (void)dealloc{
    
    [_dog removeObserver:self forKeyPath:@"name"];
    [_dog removeObserver:self forKeyPath:@"age"];
    [_dog removeObserver:self forKeyPath:@"address"];
}



- (void)btnFour: (UIButton *)sender{
    
    /*
     Q:说一下你理解的消息转发机制？
     
     A:
     
     先会调用objc_msgSend方法，首先在Class中的缓存查找IMP，没有缓存则初始化缓存。如果没有找到，则向父类的Class查找。如果一直查找到根类仍旧没有实现，则执行消息转发。
     
     1、调用resolveInstanceMethod：方法。允许用户在此时为该Class动态添加实现。如果有实现了，则调用并返回YES，重新开始objc_msgSend流程。这次对象会响应这个选择器，一般是因为它已经调用过了class_addMethod。如果仍没有实现，继续下面的动作。
     
     2、调用forwardingTargetForSelector:方法，尝试找到一个能响应该消息的对象。如果获取到，则直接把消息转发给它，返回非nil对象。否则返回nil，继续下面的动作。注意这里不要返回self，否则会形成死循环。
     
     3、调用methodSignatureForSelector:方法，尝试获得一个方法签名。如果获取不到，则直接调用doesNotRecognizeSelector抛出异常。如果能获取，则返回非nil;传给一个NSInvocation并传给forwardInvocation：。
     
     4、调用forwardInvocation:方法，将第三步获取到的方法签名包装成Invocation传入，如何处理就在这里面了，并返回非nil。
     
     5、调用doesNotRecognizeSelector：，默认的实现是抛出异常。如果第三步没能获得一个方法签名，执行该步骤 。
     
     
     */
    
    _cat = [[Cat alloc] init];

    [_cat run];
    
    
}





@end
