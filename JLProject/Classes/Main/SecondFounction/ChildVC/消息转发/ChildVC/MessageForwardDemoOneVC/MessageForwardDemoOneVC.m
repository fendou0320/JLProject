//
//  MessageForwardDemoOneVC.m
//  JLProject
//
//  Created by UCS on 2018/8/13.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MessageForwardDemoOneVC.h"
#import "ADCHero.h"

@interface MessageForwardDemoOneVC ()

@end

@implementation MessageForwardDemoOneVC

/*
 最简单的方法就是直接在类中添加playPiano方法，或者在其继承树中添加该方法，均可以解决该问题
 */


/*
 
 方案一：
 (BOOL)resolveInstanceMethod:(SEL)sel
 (BOOL)resolveClassMethod:(SEL)sel
 若方法返回YES，则表示可以处理该消息。在这个过程，可以动态地给消息增加方法。
 若方法返回NO，则进行消息转发的第二步，查找是否有其它的接收者。
 
 
 方案二：
 (id)forwardingTargetForSelector:(SEL)aSelector
 可以通过该函数返回一个可以处理该消息的对象。
 若第二步返回nil，则进入消息转发的第三步。调用
 
 
 方案三：
 (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector;
 (void)forwardInvocation:(NSInvocation *)anInvocation;
 这个方法实现得很简单。只需要改变调用目标，使消息在新目标上得以调用即可。不过，如果采用这种方式，实现的效果与第二步的消息转发是一致的。所以比较有用的实现方式是：先以某种方式改变消息内容，比如追加另外一个参数，或者改换选择子，等等。
 
 */


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ADCHero *vn = [[ADCHero alloc] init];
    
//    [vn skillR];
    
//    [vn secondMVPHeroSkill];
   
    [vn thirdMVPHeroSkill];
    
}










@end
