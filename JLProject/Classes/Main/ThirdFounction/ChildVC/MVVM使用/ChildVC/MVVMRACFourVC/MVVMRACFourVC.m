//
//  MVVMRACFourVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/8/27.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MVVMRACFourVC.h"
#import "MVVMRACFourOneVC.h"

@interface MVVMRACFourVC ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation MVVMRACFourVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    RAC(_label, text) = self.textField.rac_textSignal;
    
    [RACObserve(self.view, frame) subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-1);
    
}

- (IBAction)buttomBtn:(UIButton *)sender {
    
    MVVMRACFourOneVC *donghua = [[MVVMRACFourOneVC alloc] init];
    [self.navigationController pushViewController:donghua animated:YES];
}

@end
