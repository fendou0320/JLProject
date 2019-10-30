//
//  MoneyIncreaseVC.m
//  JLProject
//
//  Created by jiangliang on 2018/9/14.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "MoneyIncreaseVC.h"
#import "UICountingLabel.h"

@interface MoneyIncreaseVC ()
@property (nonatomic, strong) UICountingLabel *label;
@end

@implementation MoneyIncreaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    UICountingLabel* myLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];
//    myLabel.method = UILabelCountingMethodLinear;
//    myLabel.format = @"%d";
//    [self.view addSubview:myLabel];
//    [myLabel countFrom:1 to:10 withDuration:3.0];
//
//    // make one that counts up from 5% to 10%, using ease in out (the default)
//    UICountingLabel* countPercentageLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 50, 200, 40)];
//    [self.view addSubview:countPercentageLabel];
//    countPercentageLabel.format = @"%.1f%%";
//    [countPercentageLabel countFrom:5 to:10];
    
    
    
    // count up using a string that uses a number formatter
    UICountingLabel* scoreLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 90, 300, 40)];
    [self.view addSubview:scoreLabel];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = 2;// 小数位最多位数
    formatter.minimumFractionDigits = 2;// 小数位最少位数
    scoreLabel.formatBlock = ^NSString* (CGFloat value)
    {
        NSString* formatted = [formatter stringFromNumber:@((CGFloat)value)];
        return [NSString stringWithFormat:@"%@",formatted];//Score:
    };
    scoreLabel.method = UILabelCountingMethodEaseOut;
    [scoreLabel countFrom:0 to:12345678912345.12 withDuration:2.5];
    
//    // count up with attributed string
//    NSInteger toValue = 100;
//    UICountingLabel* attributedLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 130, 200, 40)];
//    [self.view addSubview:attributedLabel];
//    attributedLabel.attributedFormatBlock = ^NSAttributedString* (CGFloat value)
//    {
//        NSDictionary* normal = @{ NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue-UltraLight" size: 20] };
//        NSDictionary* highlight = @{ NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue" size: 20] };
//
//        NSString* prefix = [NSString stringWithFormat:@"%d", (int)value];
//        NSString* postfix = [NSString stringWithFormat:@"/%d", (int)toValue];
//
//        NSMutableAttributedString* prefixAttr = [[NSMutableAttributedString alloc] initWithString: prefix
//                                                                                       attributes: highlight];
//        NSAttributedString* postfixAttr = [[NSAttributedString alloc] initWithString: postfix
//                                                                          attributes: normal];
//        [prefixAttr appendAttributedString: postfixAttr];
//
//        return prefixAttr;
//    };
//    [attributedLabel countFrom:0 to:toValue withDuration:2.5];
//
//    self.label = [[UICountingLabel alloc] initWithFrame:CGRectMake(100, 300, 200, 200)];
//    [self.view addSubview:self.label];
//    self.label.method = UILabelCountingMethodEaseInOut;
//    self.label.format = @"%d%%";
//    [self.label countFrom:0 to:100];
    
}








@end
