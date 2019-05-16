//
//  SuiJiYanZhengMaController.m
//  JLProject
//
//  Created by UCS on 2017/11/17.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "SuiJiYanZhengMaController.h"

@interface SuiJiYanZhengMaController ()

@end

@implementation SuiJiYanZhengMaController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //获取验证码按钮
    AutoCodeView *captchaView = [[AutoCodeView alloc]init];;
    [self.view addSubview: captchaView];
    [captchaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_bottom).with.offset(SIZE_IPHONE6(20));
        make.left.equalTo(self.view.mas_right).with.offset(3);
        make.width.mas_equalTo(SIZE_IPHONE6(100));
        make.height.mas_equalTo(SIZE_IPHONE6(40));
    }];
    captchaView.layer.cornerRadius = 6.0;
    captchaView.layer.masksToBounds = YES;
    
//    NSString *title = @"123456";
//    //@{}
//    [self yanzheng:title];
}


//- (void)yanzheng: (NSDictionary *)result{
////    if ([result isKindOfClass:[NSDictionary class]]) {
//        if ([[(NSDictionary *)result allKeys] containsObject:@"payURL"]) {
//            NSDictionary *payURLDic = [(NSDictionary *)result objectForKey:@"payURL"];
//            if ([[payURLDic allKeys] containsObject:@"subject"]) {
//                NSString *subjectString = [payURLDic objectForKey:@"subject"];
//                [payURLDic setValue:[self stringFromHexString:subjectString] forKey:@"subject"];
//            }
//            if ([[payURLDic allKeys] containsObject:@"body"]) {
//                NSString *subjectString = [payURLDic objectForKey:@"body"];
//                [payURLDic setValue:[self stringFromHexString:subjectString] forKey:@"body"];
//            }
//        }
////    }
//    NSLog(@"%@", result);
//}
//
//// 普通字符串转换为十六进制的字符串
//+ (NSString *)hexStringFromString:(NSString *)string {
//    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
//    Byte *bytes = (Byte *)[myD bytes];
//    NSString *hexStr=@"";
//    for(int i=0;i<[myD length];i++) {
//        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff]; //16进制数
//        if([newHexStr length]==1) {
//            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
//        } else {
//            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
//        }
//    }
//    return hexStr;
//}
//
//// 十六进制转换为普通字符串
//+ (NSString *)stringFromHexString:(NSString *)hexString {
//    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
//    bzero(myBuffer, [hexString length] / 2 + 1);
//    for (int i = 0; i < [hexString length] - 1; i += 2) {
//        unsigned int anInt;
//        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
//        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
//        [scanner scanHexInt:&anInt];
//        myBuffer[i / 2] = (char)anInt;
//    }
//    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
//    return unicodeString;
//}


@end
