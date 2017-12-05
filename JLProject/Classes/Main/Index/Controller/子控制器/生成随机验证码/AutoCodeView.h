//
//  AutoCodeView.h
//  MVMProject
//
//  Created by ucsdigital on 17/8/25.
//  Copyright © 2017年 MVMProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoCodeView : UIButton
@property (strong, nonatomic) NSArray *dataArray;//字符素材数组

@property (strong, nonatomic) NSMutableString *authCodeStr;//验证码字符串

@end
