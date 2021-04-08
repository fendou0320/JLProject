//
//  IndexViewController.m
//  UcsProject
//
//  Created by UCS on 2017/5/3.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "IndexViewController.h"
#import "HistogramVC.h"
#import "LineChatVC.h"
#import "UIThirdVC.h"
#import "UIEncapsulationVC.h"
#import "UISystemVC.h"
#import "KeyBoardVC.h"
#import "RichTextVC.h"
#import "JLCameraVC.h"
#import "MoneyIncreaseVC.h"
#import "DongHuaViewController.h"
#import "BoWenShuiQiuController.h"
#import "PopUpController.h"
#import "MarketChartViewController.h"
#import "OpenOtherAppController.h"
#import "OpenPDFController.h"
#import "JLTextfieldVC.h"
#import "JLLoadingVC.h"
#import "SecurityOpenAccountVC.h"
#import "WKSecurityOpenAccountVC.h"
#import "DropdownLoadingVC.h"
#import "GifLoadingVC.h"
#import "StatisticalStepsVC.h"
#import "PageVC.h"
#import "UIBezierPathVC.h"
#import "UIBezierPathVC1.h"
#import "SendEmailVC.h"
#import "Animation1.h"
#import "Animation2.h"
#import "TouchVC.h"

#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>

#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"


@interface IndexViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;
    
//MARK:    method for handing memry managemrnt（方法）
//TODO:     通知更新需要做的事情
//FIXME:    你想要修改的bug
    
    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    NSLog(@"唯一标示符%@", identifierForVendor);
    
    NSLog(@"ip地址--- %@", [self getIPAddresses]);
    
    //抛出异常
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:1];
    if (!array) {
        // 抛出异常方式一
        NSException *excp = [NSException exceptionWithName:@"UrlError" reason:@"传入的url有异常！" userInfo:@{@"":@""}];
        // 抛出异常
        [excp raise];
        // 抛出异常方式二
        @throw [NSException exceptionWithName:@"UrlError" reason:@"传入的url有异常！" userInfo:nil];
    }
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 120) style:UITableViewStylePlain];
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
    
    return k_TableCellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"柱状图";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"折线图";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"UI三方控件";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"UI封装";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"UI系统控件";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"键盘";
    }else if (indexPath.row == 6){
        cell.textLabel.text = @"富文本";
    }else if (indexPath.row == 7){
        cell.textLabel.text = @"自定义相机";
    }else if (indexPath.row == 8){
        cell.textLabel.text = @"弹窗";
    }else if (indexPath.row == 9){
        cell.textLabel.text = @"金钱数字逐渐增长";
    }else if (indexPath.row == 10){
        cell.textLabel.text = @"各种动画";
    }else if (indexPath.row == 11){
        cell.textLabel.text = @"水波纹圆球";
    }else if (indexPath.row == 12){
        cell.textLabel.text = @"打开其他APP两种方式";
    }else if (indexPath.row == 13){
        cell.textLabel.text = @"打开PDF";
    }else if (indexPath.row == 14){
        cell.textLabel.text = @"点击横屏";
    }else if (indexPath.row == 15){
        cell.textLabel.text = @"输入框各种样式";
    }else if (indexPath.row == 16){
        cell.textLabel.text = @"上拉、下拉、加载动画";
    }else if (indexPath.row == 17){
        cell.textLabel.text = @"uiwebview证券开户";
    }else if (indexPath.row == 18){
        cell.textLabel.text = @"WKwebview证券开户";
    }else if (indexPath.row == 19){
        cell.textLabel.text = @"下拉动画";
    }else if (indexPath.row == 20){
        cell.textLabel.text = @"gif首次加载";
    }else if (indexPath.row == 21){
        cell.textLabel.text = @"计步功能";
    }else if (indexPath.row == 22){
        cell.textLabel.text = @"PageVC";
    }else if (indexPath.row == 23){
        cell.textLabel.text = @"贝塞尔曲线静态绘制 椭圆、矩形、圆弧、绘制多边图形、二阶曲线、三阶曲线";
    }else if (indexPath.row == 24){
        cell.textLabel.text = @"贝塞尔曲线动态绘制";
    }else if (indexPath.row == 25){
        cell.textLabel.text = @"发送邮件";
    }else if (indexPath.row == 26){
        cell.textLabel.text = @"动画";
    }else if (indexPath.row == 27){
        cell.textLabel.text = @"开始和结束比较慢, 中间比较快的⻉塞尔曲线";
    }else if (indexPath.row == 28){
        cell.textLabel.text = @"响应者链";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        HistogramVC *vc = [[HistogramVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        LineChatVC *vc = [[LineChatVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        UIThirdVC *vc = [[UIThirdVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        UIEncapsulationVC *vc = [[UIEncapsulationVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        UISystemVC *vc = [[UISystemVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 5){
        KeyBoardVC *vc = [[KeyBoardVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 6){
        RichTextVC *vc = [[RichTextVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 7){
        JLCameraVC *vc = [[JLCameraVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 8){
        PopUpController *vc = [[PopUpController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 9){
        MoneyIncreaseVC *vc = [[MoneyIncreaseVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else  if (indexPath.row == 10){
        
        DongHuaViewController *donghua = [[DongHuaViewController alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 11){
        
        BoWenShuiQiuController *donghua = [[BoWenShuiQiuController alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 12){
        
        OpenOtherAppController *vc = [[OpenOtherAppController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 13){
        
        OpenPDFController *vc = [[OpenPDFController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 14){
        
        MarketChartViewController *donghua = [[MarketChartViewController alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 15){
        
        JLTextfieldVC *donghua = [[JLTextfieldVC alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 16){
        
        JLLoadingVC *donghua = [[JLLoadingVC alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 17){
        
        SecurityOpenAccountVC *donghua = [[SecurityOpenAccountVC alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 18){
        
        WKSecurityOpenAccountVC *donghua = [[WKSecurityOpenAccountVC alloc] init];
        [self.navigationController pushViewController:donghua animated:YES];
        
    }else if (indexPath.row == 19){
        
        DropdownLoadingVC *vc = [[DropdownLoadingVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 20){
        
        GifLoadingVC *vc = [[GifLoadingVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 21){
        
        StatisticalStepsVC *vc = [[StatisticalStepsVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 22){
        
        PageVC *vc = [[PageVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 23){
        
        UIBezierPathVC *vc = [[UIBezierPathVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 24){
        
        UIBezierPathVC1 *vc = [[UIBezierPathVC1 alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 25){
        
        SendEmailVC *vc = [[SendEmailVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 26){
        
        Animation1 *vc = [[Animation1 alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 27){
        
        Animation2 *vc = [[Animation2 alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 28){
        
        TouchVC *vc = [[TouchVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    

}


- (NSString *)getIPAddress:(BOOL)preferIPv4
{
    NSArray *searchArray = preferIPv4 ?
    @[ IOS_VPN @"/" IP_ADDR_IPv4, IOS_VPN @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6 ] :
    @[ IOS_VPN @"/" IP_ADDR_IPv6, IOS_VPN @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4 ] ;
    NSDictionary *addresses = [self getIPAddresses];
    NSLog(@"addresses: %@", addresses);
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
     {
         address = addresses[key];
         if(address) *stop = YES;
     } ];
    return address ? address : @"0.0.0.0";
}

- (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */ ) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            char addrBuf[ MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN) ];
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;
                if(addr->sin_family == AF_INET) {
                    if(inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                } else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6*)interface->ifa_addr;
                    if(inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }
                if(type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}





@end
