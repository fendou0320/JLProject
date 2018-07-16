//
//  DropDownController.m
//  JLProject
//
//  Created by UCS on 2017/12/1.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "DropDownController.h"
#import "DropdownMenu.h"

@interface DropDownController ()<DropdownMenuDelegate>

@property (nonatomic, strong)DropdownMenu *typeMenu;

@end

@implementation DropDownController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //企业类型
    _typeMenu = [[DropdownMenu alloc] init];
    [_typeMenu setFrame:CGRectMake(100, SIZE_IPHONE6PX(200), kScreenWidth-200, SIZE_IPHONE6PX(54))];
    [_typeMenu setMenuTitles:@[@"影院",@"院线",@"其他"] rowHeight:30];
    [_typeMenu.mainBtn setTitle:@"影院" forState:UIControlStateNormal];
    _typeMenu.delegate = self;
    [self.view addSubview:_typeMenu];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LMJDropdownMenu Delegate

- (void)dropdownMenu:(DropdownMenu *)menu selectedCellNumber:(NSInteger)number{
    
    
    
}


@end
