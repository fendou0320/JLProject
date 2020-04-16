//
//  SendEmailVC.m
//  JLProject
//
//  Created by jiangliang on 2020/4/16.
//  Copyright © 2020 wangjiangliang. All rights reserved.
//

#import "SendEmailVC.h"
#import <MessageUI/MessageUI.h>

@interface SendEmailVC ()<MFMailComposeViewControllerDelegate>
{
    MFMailComposeViewController *mailComposer;
}


@end

@implementation SendEmailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpBtnUI];
    
    
    
}


- (void)setUpBtnUI{
    
    self.btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnOne.frame = CGRectMake(0, SIZE_IPHONE6(0), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:self.btnOne];
    self.btnOne.backgroundColor = RandomColor;
    [self.btnOne setTitle:@"发送邮件" forState:UIControlStateNormal];
    [self.btnOne addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnTwo.frame = CGRectMake(0, SIZE_IPHONE6(40), kScreenWidth, SIZE_IPHONE6(30));
    [self.view addSubview:self.btnTwo];
    self.btnTwo.backgroundColor = RandomColor;
    [self.btnTwo setTitle:@"btnTwo" forState:UIControlStateNormal];
    [self.btnTwo addTarget:self action:@selector(btnTwo:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnTwo: (UIButton *)sender{
    
    
}

- (void)btnOne: (UIButton *)sender{
    
    if (!MFMailComposeViewController.canSendMail) {
        //不支持发送邮件
        NSLog(@"不支持发送邮件");
        return;
    }
    
    mailComposer = [[MFMailComposeViewController alloc]init];
    mailComposer.mailComposeDelegate = self;
    [mailComposer setSubject:@"Test mail"];
    [mailComposer setMessageBody:@"Testing message for the test mail" isHTML:NO];
    
    [self presentModalViewController:mailComposer animated:YES];
     
}

     
#pragma mark - mail compose delegate
-(void)mailComposeController:(MFMailComposeViewController *)controller
 didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
   if (result) {
       NSLog(@"Result : %ld",(long)result);
    }
    if (error) {
        NSLog(@"Error : %@",error);
    }
    [self dismissModalViewControllerAnimated:YES];

}


@end
