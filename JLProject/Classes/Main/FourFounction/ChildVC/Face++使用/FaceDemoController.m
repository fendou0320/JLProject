//
//  FaceDemoController.m
//  JLProject
//
//  Created by jiangliang on 2019/3/27.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "FaceDemoController.h"
#import "DemoMegNetwork.h"
#import "MBProgressHUD.h"
#import <MGFaceIDLiveDetect/MGFaceIDLiveDetect.h>

@interface FaceDemoController ()

@property (nonatomic, strong) UISegmentedControl* liveTypeSegC;
@property (nonatomic, strong) NSString* bizTokenStr;

@end

@implementation FaceDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildView];
}

#pragma mark - BuildView
- (void)buildView {
    _liveTypeSegC = [[UISegmentedControl alloc] initWithItems:@[@"动作活体", @"静默活体"]];
    [self.view addSubview:self.liveTypeSegC];
    [self.liveTypeSegC setFrame:CGRectMake(40, 200, CGRectGetWidth(self.view.frame) - 80, 40.0f)];
    [self.liveTypeSegC setSelectedSegmentIndex:0];
    
    UIButton* bizTokenButton = [self getMegOperationButtonWithTitle:@"获取 bizToken" action:@selector(getBizToken:)];
    [self.view addSubview:bizTokenButton];
    [bizTokenButton setBounds:CGRectMake(0, 0, 160, 40)];
    [bizTokenButton setCenter:CGPointMake(self.liveTypeSegC.center.x, self.liveTypeSegC.center.y + CGRectGetHeight(self.liveTypeSegC.frame) + 60)];
    
    UIButton* detectButton = [self getMegOperationButtonWithTitle:@"开始检测" action:@selector(startDetect:)];
    [self.view addSubview:detectButton];
    [detectButton setBounds:bizTokenButton.bounds];
    [detectButton setCenter:CGPointMake(bizTokenButton.center.x, bizTokenButton.center.y + CGRectGetHeight(bizTokenButton.frame) + 20)];
}

- (UIButton *)getMegOperationButtonWithTitle:(NSString *)textStr action:(SEL)operationAction {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:textStr forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor]
                 forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor]
                 forState:UIControlStateHighlighted];
    [button.layer setBorderWidth:1.0f];
    [button.layer setBorderColor:[UIColor blueColor].CGColor];
    [button addTarget:self
               action:operationAction
     forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma mark - BizToken
- (void)getBizToken:(UIButton *)sender {
    NSMutableDictionary* liveInfoDict = [[NSMutableDictionary alloc] initWithCapacity:1];
    [liveInfoDict setObject:@"1" forKey:@"liveness_retry_count"];
//    [liveInfoDict setObject:@"1" forKey:@"verbose"];
    [liveInfoDict setObject:@"2" forKey:@"security_level"];
    //123
    [liveInfoDict setObject:@"王江亮" forKey:@"idcard_name"];
    [liveInfoDict setObject:@"37112119910320101X" forKey:@"idcard_number"];
    
    [liveInfoDict setObject:self.liveTypeSegC.selectedSegmentIndex == 0 ? @"meglive" : @"still" forKey:@"liveness_type"];
    
    UIImage* bizTokenImage = [UIImage imageNamed:@"bizTokenImage"];
    
    sender.userInteractionEnabled = NO;
    [[DemoMegNetwork singleton] queryDemoMGFaceIDAntiSpoofingBizTokenWithUUID:[NSUUID UUID].UUIDString
                                                                     imageRef:bizTokenImage
                                                                   liveConfig:liveInfoDict
                                                                      success:^(NSInteger statusCode, NSDictionary *responseObject) {
                                                                          
                                                                          sender.userInteractionEnabled = YES;
                                                                          if (statusCode == 200 && responseObject && [[responseObject allKeys] containsObject:@"biz_token"] && [responseObject objectForKey:@"biz_token"]) {
                                                                              self.bizTokenStr = [responseObject objectForKey:@"biz_token"];
                                                                              [self showCheckMessage:@"获取 BizToken 成功"];
                                                                          } else {
                                                                              [self showCheckMessage:@"获取 BizToken 失败"];
                                                                          }
                                                                          
                                                                      } failure:^(NSInteger statusCode, NSError *error) {
                                                                          
                                                                          
                                                                          sender.userInteractionEnabled = YES;
                                                                          [self showCheckMessage:[NSString stringWithFormat:@"网络请求失败"]];
                                                                          
                                                                      }];
}

#pragma mark - Detect
- (void)startDetect:(UIButton *)sender {
    sender.userInteractionEnabled = NO;
    MGFaceIDLiveDetectError* error;
    MGFaceIDLiveDetectManager* detectManager = [[MGFaceIDLiveDetectManager alloc] initMGFaceIDLiveDetectManagerWithBizToken:self.bizTokenStr
                                                                                                                   language:MGFaceIDLiveDetectLanguageCh
                                                                                                                networkHost:@"https://api.megvii.com"
                                                                                                                  extraData:nil
                                                                                                                      error:&error];
    if (error || !detectManager) {
        [self showCheckMessage:error.errorMessageStr];
        sender.userInteractionEnabled = YES;
    }
    //  可选方法-当前使用默认值
    {
        MGFaceIDLiveDetectCustomConfigItem* customConfigItem = [[MGFaceIDLiveDetectCustomConfigItem alloc] init];
        [detectManager setMGFaceIDLiveDetectCustomUIConfig:customConfigItem];
        [detectManager setMGFaceIDLiveDetectPhoneVertical:MGFaceIDLiveDetectPhoneVerticalFront];
    }
    
    [detectManager startMGFaceIDLiveDetectWithCurrentController:self
                                                       callback:^(MGFaceIDLiveDetectError *error, NSData *deltaData, NSString *bizTokenStr, NSDictionary *extraOutDataDict) {
                                                           [self showCheckMessage:error.errorMessageStr];
                                                           sender.userInteractionEnabled = YES;
                                                       }];
}

#pragma mark - showCheckMessage
- (void)showCheckMessage:(NSString *)checkMessage {
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = checkMessage;
        [hud hideAnimated:YES afterDelay:2];
    });
}


@end
