//
//  ADCHero.m
//  JLProject
//
//  Created by UCS on 2018/8/13.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "ADCHero.h"
#import <Messages/Messages.h>
#import "MVPHero.h"

@implementation ADCHero

- (void)skillE {
    NSLog(@"ADC 发起了E技能");
}

/*
 *          代表  char *
 char BOOL  代表  c
 :          代表  SEL
 ^type      代表  type *
 @          代表  NSObject * 或 id
 ^@         代表  NSError **
 #          代表  NSObject
 v          代表  void
 */


#pragma mark - 第一步--动态方法解析
//类方法
+ (BOOL)resolveClassMethod:(SEL)sel{
//    NSLog(@"%s", sel);
    NSString *selectorString = NSStringFromSelector(sel);
    if ([selectorString isEqualToString:@"fistskillR"]) {
        //走消息转发
        return YES;
    }
    return [super resolveClassMethod:sel];
}
void skillFlash(){
    NSLog(@"闪现");
}
//实例方法
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    //    NSLog(@"%s", sel);
    NSString *selectorString = NSStringFromSelector(sel);
    /**
     *  i(类型为int)
     *  v(类型为void)
     *  @(类型为id)
     *  :(类型为SEL)
     */
    if ([selectorString isEqualToString:@"fistskillR"]) {
        //走消息转发
        //class_addMethod(self, sel, (IMP)skillFlash, "@:"); // 动态添加方法skillFlash， 参数一: 消息接收者；参数二: 调用的方法名；参数三：方法对应的实现地址；参数四: 类型编码。
        class_addMethod(self, sel, (IMP)skillFlash, "@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

#pragma mark - 第二步---备援接受者
 //可以通过该函数返回一个可以处理该消息的对象
/*
 通过此方案，我们可以用“组合”来模拟出“多重继承”的某些特性。在一个对象内部，可能还有一系列其他对象，该对象可以经由此方法将能够处理某选择子的相关内部对象返回，这样的话，在外界看来好像是该对象亲自处理了这些消息。
 伪多继承与真正的多继承的区别在于，真正的多继承是将多个类的功能组合到一个对象中，而消息转发实现的伪多继承，对应的功能仍然分布在多个对象中，但是将多个对象的区别对消息发送者透明。
 */
- (id)forwardingTargetForSelector:(SEL)aSelector{
   
    NSString *selStr = NSStringFromSelector(aSelector);
    if ([selStr isEqualToString:@"secondMVPHeroSkill"]) {
        MVPHero *heroSkill = [[MVPHero alloc] init];
        return heroSkill;
    }
    return [super forwardingTargetForSelector:aSelector];
}

#pragma mark - 第三步---完整消息转发
/*
 这个方法实现得很简单。只需要改变调用目标，使消息在新目标上得以调用即可。不过，如果采用这种方式，实现的效果与第二步的消息转发是一致的。所以比较有用的实现方式是：先以某种方式改变消息内容，比如追加另外一个参数，或者改换选择子，等等。
 */

/*
 如果转发算法到了这一步，那么唯一能做的就是启用完整的消息转发机制，首先创建NSInvocation对象，把尚未处理的那条消息有关的全部细节都封于其中。此对象包含选择子，目标及参数。在触发NSInvocation对象时，“消息派发系统”将会把消息指派给目标对象。
 该方法实现简单，只需要改变调用目标,使消息在新目标上得以调用即可。然而这样实现出来的方法与“备援接受者”方案所实现的方法等效，所有很少有人采用这么简单的实现方式。比较有用的实现方式为：在触发消息前，先以某种方式改变消息内容，比如追加另外一个参数，或是改变选择子。
 
 实现该方法时，若发现某调用操作不应由本类处理，则需要调用超类的同名方法。这样集成体系中的某个类都有机会处理此方法调用，直到NSObject，继而调用”doesNotRecognizeSelector:”以抛出异常，此异常表明选择子最终未能得到处理。
 */
/*
 如果备援接收能未能处理选择子，会调用- (NSMethodSignature )methodSignatureForSelector:(SEL)aSelector生成方法签名，然后系统用这个方法签名生成NSInvocation对象。NSInvocation对象包含选择子、目标及参数。之后调用- (void)forwardInvocation:(NSInvocation )anInvocation方法改变调用目标，使消息在新目标上得以调用。这种方法有两种实现方式：一种实现方式与调用备援接收者方法有异曲同工的作用，而越往后面处理消息的代价就越大，所以不推荐在此方法中实现类似效果。另一种实现方式是改变消息内容或是改变选择子。
 */
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    SEL selector = [anInvocation selector];
    //新建需要转发消息的对象
    MVPHero *mvp = [[MVPHero alloc] init];
    if ([mvp respondsToSelector:selector]) {
        //唤醒这个方法
        [anInvocation invokeWithTarget:mvp];
    }
}

/*
 NSMethodSignature顾名思义应该就是“方法签名”，类似于C++中的编译器对函数进行签名。从这里可以发现，其他很多语言的很多东西都是类似的。官方定义该类为对方法的参数、返回类似进行封装，协同NSInvocation实现消息转发。
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSString *sel = NSStringFromSelector(aSelector);
    //判断要转发的sel
    if ([sel isEqualToString:@"thirdMVPHeroSkill"]) {
        //为转发的方法手动生成签名
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}



@end
