//
//  OpenOtherAppController.m
//  JLProject
//
//  Created by jiangliang on 2019/4/29.
//  Copyright © 2019 wangjiangliang. All rights reserved.
//

#import "OpenOtherAppController.h"
#import <StoreKit/StoreKit.h>

@interface OpenOtherAppController ()<SKStoreProductViewControllerDelegate>

@end

@implementation OpenOtherAppController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.btnOne setTitle:@"打开APPStore" forState:UIControlStateNormal];
    
    [self.btnTwo setTitle:@"在APP内部打开web页面" forState:UIControlStateNormal];
    
}

- (void)btnOne: (UIButton *)sender{
    
    NSString *urlstr = @"https://itunes.apple.com/app/apple-store/id440948110?mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlstr]];
    
}

- (void)btnTwo: (UIButton *)sender{
    
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"440948110" forKey:SKStoreProductParameterITunesItemIdentifier];
    SKStoreProductViewController *ctrl = [[SKStoreProductViewController alloc] init];
    ctrl.delegate = self;
    [self presentViewController:ctrl animated:YES completion:nil];
    [ctrl loadProductWithParameters:dict completionBlock:^(BOOL result, NSError * _Nullable error) {
        //        if(error) {
        //            NSLog(@"Error：%@",error.userInfo);
        //        }
        //        else {
        //            [self presentViewController:ctrl animated:YES completion:nil];
        //        }
    }];
}


#pragma mark - SKStoreProductViewControllerDelegate

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    
    [viewController dismissViewControllerAnimated:YES completion:^{
        //        NSLog(@"productViewControllerDidFinish");
    }];
    
}


- (void)btnThree: (UIButton *)sender{
    
    
}

- (void)btnFour: (UIButton *)sender{
    
    
}


@end
