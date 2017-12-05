//
//  TableViewOpenController.m
//  JLProject
//
//  Created by UCS on 2017/6/19.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "TableViewOpenController.h"

#import "LHY_HeaderView.h"
#import "LHY_FriendsListCell.h"

static NSString *const kLHY_ViewControllerTitle         = @"好友列表";
static NSString *const kReusableCellIdentifier          = @"a1b1c1";
static NSString *const kHeaderFooterViewReuseIdentifier = @"a2b2c2";


@interface TableViewOpenController ()<UITableViewDataSource, UITableViewDelegate, LHY_HeaderViewDelegate>

{
    NSArray *_sectionTitles;   /**< 分组标题集合 */
    NSArray *_friendsListInfo; /**< 好友信息集合 */
    
    NSMutableDictionary *_openDict; /**< 用于设置当前分组展开或关闭 */
}

@property (nonatomic, strong) UITableView *tableView; /**< 表格视图 */

- (void)initializeDataSource;    /**< 初始化数据源 */
- (void)initializeUserInterface; /**< 初始化用户界面 */

@end


@implementation TableViewOpenController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSource];
    [self initializeUserInterface];
}

#pragma mark *** Initialize methods ***
- (void)initializeDataSource {
    
    // 初始化分组数据
    _sectionTitles = @[@"同事", @"家人", @"朋友", @"同学", @"陌生人", @"黑名单"];
    
    // 根据plist文件获取好友列表数据
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"FriendsList" ofType:@"plist"];
    _friendsListInfo = [NSArray arrayWithContentsOfFile:plistPath];
}

- (void)initializeUserInterface {
    
    self.title = kLHY_ViewControllerTitle;
    // 关闭系统自动偏移
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 加载表格视图
    [self.view addSubview:self.tableView];
}

#pragma mark *** <UITableViewDataSource, UITableViewDelegate> ***
// 设置组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // 返回分组数据集合的个数
    return _sectionTitles.count;
}

// 设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 返回好友列表信息集合的个数
    NSLog(@"------%ld",section);
    NSLog(@"%ld", _friendsListInfo.count);
    return _friendsListInfo.count;
}

// 设置单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    LHY_FriendsListCell *cell = [tableView dequeueReusableCellWithIdentifier:kReusableCellIdentifier forIndexPath:indexPath];
    
    // 超出父视图不显示，如果不将其值设为YES（默认为NO），那么现实在表格视图上的数据会出现重叠的bug。
    cell.layer.masksToBounds = YES;
    
    // 获取值
    NSString *nickName = _friendsListInfo[indexPath.row][@"nickName"];
    NSString *headPortrait = _friendsListInfo[indexPath.row][@"headPortrait"];
    NSString *signature = _friendsListInfo[indexPath.row][@"context"];
    
    // 赋值控件
    cell.nicknameLabel.text = nickName;
    cell.signatureLabel.text = signature;
    cell.headPortraitImageView.image = [UIImage imageNamed:headPortrait];
    
    return cell;
}


// 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 根据当前组获取字典key
    NSString *key = [NSString stringWithFormat:@"%ld", indexPath.section];
    
    // 判断如果字典对应key是否有值，如果有值，说明当前组展开，返回 80 高度；否则为关闭，返回 0 高度；
    if ([_openDict objectForKey:key]) {
        return 80;
    }else {
        return 0;
    }
}

// 设置组高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

// 自定义头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    // 创建头部视图
    // 头部视图重用
    LHY_HeaderView *lhyHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kHeaderFooterViewReuseIdentifier];
    
    // 设置代理
    lhyHeaderView.delegate = self;
    
    // 配置视图显示
    lhyHeaderView.sectionTitleLabel.text = _sectionTitles[section];
    lhyHeaderView.indictorImageView.image = [UIImage imageNamed:@"flag.png"];
    
    // 设置tag值
    lhyHeaderView.tag = section;
    
    // 根据字典对应key（section）是否有值来判断当前组应该展开还是收缩
    // 如果有值，则说明应该展开组，无值则应该关闭组
    NSString *key = [NSString stringWithFormat:@"%ld", section];
    // 通过动画效果实现展开与关闭指示状态的显示
    [UIView animateWithDuration:0.4 animations:^{
        // 如果展开，则将指示图片旋转45°，箭头向下，意为展开；
        // 如果关闭，则移除transform属性，回复原样，箭头向右，意为关闭；
        lhyHeaderView.indictorImageView.transform = [_openDict objectForKey:key] ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformIdentity;
    }];
    
    return lhyHeaderView;
    
}

#pragma mark *** LHY_HeaderViewDelegate ***
- (void)lhyHeaderView:(LHY_HeaderView *)lhyHeaderView didSelectedWithTag:(NSInteger)tag {
    
    // 判断字典是否存在，如果不存在，则新建；
    // 如果对一个未初始化的可变字典作数据操作，将会导致奔溃；
    if (!_openDict) {
        _openDict = [NSMutableDictionary dictionary];
    }
    
    // 获取tag值，并将其作为字典key
    NSString *key = [NSString stringWithFormat:@"%ld", tag];
    
    // 模拟展开与关闭
    // 判断当前组是否有值，有值则移除对应key-value对，无值则设置key-value对。
    if (![_openDict objectForKey:key]) {
        [_openDict setObject:key forKey:key];
    }else{
        [_openDict removeObjectForKey:key];
    }
    
    // 刷新表格视图指定组
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:tag] withRowAnimation:UITableViewRowAnimationFade];
}



#pragma mark *** Getters ***

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 64) style:UITableViewStylePlain];
        // 设置代理
        _tableView.delegate = self;
        // 设置数据源
        _tableView.dataSource = self;
        // 设置尾部视图（此设置可解决当表格视图在屏幕能完全展示数据，并且有多余空间情况下出现分割线的问题）
        _tableView.tableFooterView = [[UIView alloc] init];
        
        // 注册单元格
        [_tableView registerClass:[LHY_FriendsListCell class] forCellReuseIdentifier:kReusableCellIdentifier];
        // 注册头部视图
        [_tableView registerClass:[LHY_HeaderView class] forHeaderFooterViewReuseIdentifier:kHeaderFooterViewReuseIdentifier];
    }
    return _tableView;
}


@end
