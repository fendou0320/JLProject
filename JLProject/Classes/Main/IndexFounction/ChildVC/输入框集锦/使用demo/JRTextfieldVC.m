//
//  JRTextfieldVC.m
//  JLProject
//
//  Created by jiangliang on 2019/5/16.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "JRTextfieldVC.h"
#import "CRBoxInputView_Line.h"

@interface JRTextfieldVC (){
    
    CRBoxInputView *_boxInputView;
}


@end

@implementation JRTextfieldVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _boxInputView = [self generateBoxInputView_line];

//    weakedSelf
    _boxInputView.textDidChangeblock = ^(NSString *text, BOOL isFinished) {
        NSLog(@"%@", text);
        if (text.length > 0) {
//            weakSelf.valueLabel.text = text;
        }else{
//            weakSelf.valueLabel.text = @"Empty";
        }
    };
    [self.view addSubview:_boxInputView];
    [_boxInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kScreenSize);
        make.height.mas_equalTo(60);
        make.centerX.offset(0);
        make.top.equalTo(self.view).offset(100);
    }];
}


#pragma mark - Line
- (CRBoxInputView_Line *)generateBoxInputView_line
{
    CRBoxInputCellProperty *cellProperty = [CRBoxInputCellProperty new];
    cellProperty.cellCursorColor = [UIColor greenColor];
    cellProperty.cellCursorWidth = 2;
    cellProperty.cellCursorHeight = 30;
    cellProperty.cornerRadius = 0;
    cellProperty.borderWidth = 0;
    cellProperty.cellFont = [UIFont boldSystemFontOfSize:24];
    cellProperty.cellTextColor = [UIColor redColor];
    
    CRBoxInputView_Line *_boxInputView = [CRBoxInputView_Line new];
    _boxInputView.boxFlowLayout.itemSize = CGSizeMake(60, 60);
    _boxInputView.customCellProperty = cellProperty;
    [_boxInputView loadAndPrepareViewWithBeginEdit:YES];
    
    return _boxInputView;
}


@end
