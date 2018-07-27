//
//  KeyBoardVC.m
//  JLProject
//
//  Created by UCS on 2018/7/26.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "KeyBoardVC.h"

@interface KeyBoardVC ()
@property (nonatomic, strong) UITextView *textView;
@end

@implementation KeyBoardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 100, kScreenWidth - 20, 100)];
    _textView.font = [UIFont systemFontWithSize:14];
    _textView.textColor = RandomColor;
//    _textView.backgroundColor = [UIColor clearColor];
//    _textView.layer.borderColor = [UIColor clearColor].CGColor;
    [self.view addSubview:_textView];
    
    
    
}




@end
