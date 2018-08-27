//
//  MVVMRACTwoView.m
//  JLProject
//
//  Created by jiangliangwang on 2018/8/27.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MVVMRACTwoView.h"

@implementation MVVMRACTwoView

//- (RACSubject *)clickSubject{
//    if (!_clickSubject) {
//        _clickSubject = [RACSubject subject];
//    }
//    return _clickSubject;
//}

- (IBAction)clickBtn:(UIButton *)sender {
    
//    [self.clickSubject sendNext:@"message"];
    
    self.backgroundColor = RandomColor;
    
    self.width = self.frame.size.width+1;
    
}



@end
