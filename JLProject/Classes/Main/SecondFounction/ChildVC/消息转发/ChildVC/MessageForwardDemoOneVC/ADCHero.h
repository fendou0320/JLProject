//
//  ADCHero.h
//  JLProject
//
//  Created by UCS on 2018/8/13.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADCHero : NSObject


// E技能
- (void)skillE;

//实例方法
// R技能
- (void)fistskillR;

//指派其他对象执行该方法
- (void)secondMVPHeroSkill;

//第三次转发
- (void)thirdMVPHeroSkill;


//类方法
// X技能
+ (void)skillX;


@end
