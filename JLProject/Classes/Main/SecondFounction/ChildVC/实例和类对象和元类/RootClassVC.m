//
//  RootClassVC.m
//  JLProject
//
//  Created by UCS on 2018/7/19.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "RootClassVC.h"

@interface RootClassVC ()

@end

@implementation RootClassVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    @autoreleasepool {
       
        RootClassVC *rootClass = [[RootClassVC alloc] init];
        Class c1 = [rootClass class];
        Class c2 = [RootClassVC class];
        
        DLog(@"%@--%@", c1, c2);
        
        //输出1
        DLog(@"输出%d", [c1 class]==object_getClass(rootClass));
        //输出0
        DLog(@"输出%d", class_isMetaClass(object_getClass(rootClass)));
        //输出1
        DLog(@"输出%d", class_isMetaClass(object_getClass([RootClassVC class])));
        //输出0
        DLog(@"输出%d", object_getClass(rootClass)==object_getClass([rootClass class]));
        
    }
    
    
    
}





@end
