//
//  AutoreleasePoolVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/8.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "AutoreleasePoolVC.h"

@interface AutoreleasePoolVC ()

@end

__weak NSString *string_Weak = nil;


@implementation AutoreleasePoolVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //情景一
    NSString *stringOne = [NSString stringWithFormat:@"情景一"];
    string_Weak = stringOne;
    DLog(@"viewDidLoad---string: %@", string_Weak);
    
    //情景二
//    @autoreleasepool{
//        NSString *stringTwo = [NSString stringWithFormat:@"情景二"];
//        string_Weak = stringTwo;
//        DLog(@"autoreleasepool内部---string: %@", string_Weak);
//    }
//    DLog(@"viewDidLoad---string: %@", string_Weak);
    
    //情景三
//    NSString *stringThree = @"";
//    @autoreleasepool{
//        stringThree = [NSString stringWithFormat:@"情景三"];
////        NSLog(@"引用计数---string_Weak: %ld", CFGetRetainCount((__bridge CFTypeRef)(stringThree)));
//        string_Weak = stringThree;
//        DLog(@"autoreleasepool内部---string: %@", string_Weak);
//    }
//    DLog(@"viewDidLoad---string: %@", string_Weak);


}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear---string: %@", string_Weak);
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear---string: %@", string_Weak);
}




@end
