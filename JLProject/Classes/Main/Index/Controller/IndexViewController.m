//
//  IndexViewController.m
//  UcsProject
//
//  Created by UCS on 2017/5/3.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "IndexViewController.h"
#import "TypeOneLabel.h"
#import "yuanshengriliViewController.h"
#import "MSSCalendarViewController.h"
#import "YinDaoDemoController.h"
#import "MvvmIndexController.h"
#import "MVVMTwoController.h"
#import "LoginViewController.h"
#import "LunBoNewController.h"
#import "StarController.h"
//#import "TableViewDelectController.h"
#import "SuiJiYanZhengMaController.h"
#import "DownLoaderController.h"
#import "DropDownController.h"


@interface IndexViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;
    
    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    NSLog(@"唯一标示符%@", identifierForVendor);

    
//    //测试导入三方
//    NSString *url = @"http://api.douban.com/v2/movie/top250?count=1";
//    [RequestManager requestGetWithURL:url completeBlock:^(id result) {
////        DLog(@"%@", result);
//    } errorBlock:^(NSError *error) {
////        DLog(@"%@", error);
//    }];
//    
//    weakedSelf
//    UIImageView *imageView = [[UIImageView alloc] init];
//    [self.view addSubview:imageView];
//    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(weakSelf.view);
//        make.size.mas_equalTo(CGSizeMake(200, 300));
//    }];
//    imageView.backgroundColor = [UIColor redColor];
////    imageView.contentMode = UIViewContentModeTop;
//    imageView.alpha = 1.0;
//    [imageView sd_setImageWithURL:[NSURL URLWithString:@"http://p1.img.cctvpic.com/photoworkspace/2017/04/26/2017042619115523104.jpg"]];
    
//    NSLog(@"111");
    
//     NSData *inFile = (NSData *)[NSFileHandle fileHandleForReadingAtPath:@"新建文本文档.txt"];
//    
////    NSData *data = (NSData *)[NSFileHandle fileHandleForReadingAtPath:@"新建文本文档.txt"];
//    
//    NSDictionary *xmlDoc = [NSDictionary dictionaryWithXMLData: inFile];
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"jiexi" ofType:@"html"];//文件路径
//    
//    NSLog(@"%@",[NSDictionary dictionaryWithXMLFile:filePath]);//
    
//    NSLog(@"111221");
 
    //创建一个分组样式的UITableView
    
    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    //设置数据源，注意必须实现对应的UITableViewDataSource协议
    _tableView.dataSource=self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//    cell.backgroundColor = RandomColor1;
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"原生日历";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"三方日历";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"启动引导页";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"MVVM页面1";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"MVVM页面2--首页";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"MVVM页面2--登录页面";
    }else if (indexPath.row == 6){
        cell.textLabel.text = @"MVVM页面3--新式轮播图";
    }else if (indexPath.row == 7){
        cell.textLabel.text = @"星星";
    }else if (indexPath.row == 8){
        
        cell.textLabel.text = @"TableView删除";
    }else if (indexPath.row == 9){
        
        cell.textLabel.text = @"随机验证码";
        
    }else if (indexPath.row == 10){
        
        cell.textLabel.text = @"下载";
    }else if (indexPath.row == 11){
        
        cell.textLabel.text = @"下拉框";
    }

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        yuanshengriliViewController *jd = [[yuanshengriliViewController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 1){
        
        MSSCalendarViewController *jd = [[MSSCalendarViewController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 2){
    
        YinDaoDemoController *jd = [[YinDaoDemoController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];

    }else if (indexPath.row == 3){
        
        MvvmIndexController *jd = [[MvvmIndexController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 4){
        
        MVVMTwoController *jd = [[MVVMTwoController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 5){
        
//        LoginViewController *jd = [[LoginViewController alloc] init];
//        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 6){
        
        LunBoNewController *jd = [[LunBoNewController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 7){
        
        StarController *jd = [[StarController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 8){
        
//        TableViewDelectController *jd = [[TableViewDelectController alloc] init];
//        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 9){
        
        SuiJiYanZhengMaController *jd = [[SuiJiYanZhengMaController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 10){
        
        DownLoaderController *jd = [[DownLoaderController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }else if (indexPath.row == 11){
        
        DropDownController *jd = [[DropDownController alloc] init];
        [self.navigationController pushViewController:jd animated:YES];
        
    }



    
    
    
    
    
}

    

@end
