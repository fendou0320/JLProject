//
//  ConnectionViewController.m
//  JLProject
//
//  Created by jiangliang on 2019/3/27.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "ConnectionViewController.h"

static NSString *conCell = @"conCell";
#define kDocCenterTitle         @"详情请参阅文档中心"
#define kDocCenterLink          @"https://iotdoc.cloudentify.com/instruction_manual.html#distribution-network"

@interface ConnectionViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *conTable;
@property (nonatomic,strong)NSMutableArray *conInfoArr;//设备信息

@end

@implementation ConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = RandomColor;
    
    [self initDeviceUI];
}

- (void)initDeviceUI{
    
    self.title = @"音箱配网";
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:17/255.0 green:158/255.0 blue:231/255.0 alpha:1]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //self.navigationController.navigationBar.translucent = YES;
    self.view.backgroundColor = [UIColor redColor];
    self.conTable.scrollEnabled = YES;
}

- (void)backBtnAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSMutableArray *)conInfoArr{
    if (!_conInfoArr) {
        _conInfoArr = [NSMutableArray array];
        NSDictionary *airkissInfoDic = @{@"conTitle":@"Airkiss模式",@"description":@"使用Airkiss对音箱进行配网",@"img":@"icon_wifi"};
        NSDictionary *apInfoDic = @{@"conTitle":@"AP模式",@"description":@"使用AP模式对音箱进行配网",@"img":@"icon_hot_poit"};
        [_conInfoArr addObject:airkissInfoDic];
        [_conInfoArr addObject:apInfoDic];
    }
    return _conInfoArr;
}

- (UITableView *)conTable{
    if (!_conTable) {
        _conTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-200) style:UITableViewStyleGrouped];
        _conTable.delegate = self;
        _conTable.dataSource = self;
        _conTable.backgroundColor = RandomColor;
        [_conTable registerClass:[UITableViewCell class] forCellReuseIdentifier:conCell];
        [self.view addSubview:_conTable];
    }
    return _conTable;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:conCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor purpleColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if (section == 1) {
        UIView *foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 400)];
        foot.backgroundColor = [UIColor greenColor];
        UILabel *desLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, kScreenWidth-20, 0)];
        desLabel.text = @"温馨提示:\r\n\r\n1.Airkiss配网模式:\r\n输入音箱需要连接的WiFi名称和密码,点击一键配网即可。\r\n\r\n2.AP(热点配网)模式:\r\n手机连接音箱产生的热点,输入音箱需要连接的WiFi名称和密码(包括本机开启的热点),点击一键配网即可。如果输入的是本机的热点,此时需要将手机连接的音箱热点断开并开启手机热点。\r\n\r\n";
        desLabel.numberOfLines = 0;
        desLabel.height = [self calcuateLabelHeight:desLabel.text];
        [foot addSubview:desLabel];

        UIButton *docCenterlink = [UIButton buttonWithType:UIButtonTypeCustom];
        docCenterlink.frame = CGRectMake(10, desLabel.bottom, kScreenWidth-20, 30);
        [docCenterlink setTitle:kDocCenterTitle forState:UIControlStateNormal];
        [docCenterlink setTitleColor:RandomColor forState:UIControlStateNormal];
        docCenterlink.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [foot addSubview:docCenterlink];

        return foot;
    }else{
        return [UIView new];
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.10f;
}

- (CGFloat)calcuateLabelHeight:(NSString *)string{
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    CGRect rect = [string boundingRectWithSize:CGSizeMake(kScreenWidth-20, 0) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.height;
}


@end
