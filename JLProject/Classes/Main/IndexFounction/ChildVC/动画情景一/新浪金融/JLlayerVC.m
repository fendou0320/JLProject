//
//  JLlayerVC.m
//  JLProject
//
//  Created by jiangliang on 2019/6/13.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "JLlayerVC.h"
#import "JLLayerCell.h"

@interface JLlayerVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView *tableView;

@end

@implementation JLlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _initTabelView];
    
}


- (void) _initTabelView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.tableFooterView = [[UIView alloc] init];
    [tableView setExclusiveTouch:YES];
    [tableView registerClass:[JLLayerCell class] forCellReuseIdentifier:@"JLLayerCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JLLayerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JLLayerCell" forIndexPath:indexPath];
    return  cell;
}

@end
