//
//  BlockVC.h
//  JLProject
//
//  Created by UCS on 2018/7/21.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "BaseViewController.h"

typedef int(^JLGlobalBlock)(int a, int b);


@interface BlockVC : BaseViewController

@property (nonatomic, copy) JLGlobalBlock formBlcok;


@end
