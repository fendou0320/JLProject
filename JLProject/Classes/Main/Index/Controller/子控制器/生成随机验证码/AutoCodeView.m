//
//  AutoCodeView.m
//  MVMProject
//
//  Created by ucsdigital on 17/8/25.
//  Copyright © 2017年 MVMProject. All rights reserved.
//

#import "AutoCodeView.h"

#define kRandomColor  [UIColor colorWithRed:arc4random() % 256 / 256.0 green:arc4random() % 256 / 256.0 blue:arc4random() % 256 / 256.0 alpha:1.0];
#define kLineCount 4
#define kLineWidth 1.0
#define kCharCount 4
#define kFontSize [UIFont systemFontOfSize:15]

@implementation AutoCodeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.layer.cornerRadius = 5.0f;
        self.layer.masksToBounds = YES;
//        self.backgroundColor = COLOR_6f5a55;
        
        [self getAuthcode];//获得随机验证码
    }
    return self;
}

#pragma mark 获得随机验证码
- (void)getAuthcode
{
    //字符串素材
    _dataArray = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    
    _authCodeStr = [[NSMutableString alloc] initWithCapacity:kCharCount];
    //随机从数组中选取需要个数的字符串，拼接为验证码字符串
    for (int i = 0; i < kCharCount; i++)
    {
        NSInteger index = arc4random() % (_dataArray.count-1);
        NSString *tempStr = [_dataArray objectAtIndex:index];
        _authCodeStr = (NSMutableString *)[_authCodeStr stringByAppendingString:tempStr];
    }
}

#pragma mark 点击界面切换验证码
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self getAuthcode];
    
    //setNeedsDisplay调用drawRect方法来实现view的绘制
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    //设置随机背景颜色
//    self.backgroundColor = COLOR_6f5a55;
    
    //根据要显示的验证码字符串，根据长度，计算每个字符串显示的位置
    NSString *text = [NSString stringWithFormat:@"%@",_authCodeStr];
    
    CGSize cSize = [@"A" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    int width = rect.size.width/text.length - cSize.width;
//    int height = rect.size.height - cSize.height;
    
    CGPoint point;
    
    //依次绘制每一个字符,可以设置显示的每个字符的字体大小、颜色、样式等
    float pX,pY;
    for( int i = 0; i<text.length; i++)
    {
        pY = 8;
        if (width == 0) {
            width = 1;
        }
        pX = arc4random() % width + rect.size.width/text.length * i + 3;
        point = CGPointMake(pX, pY);
        
        unichar c = [text characterAtIndex:i];
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        
        [textC drawAtPoint:point withAttributes:@{NSFontAttributeName:kFontSize}];
    }

    //调用drawRect：之前，系统会向栈中压入一个CGContextRef，调用UIGraphicsGetCurrentContext()会取栈顶的CGContextRef
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    //设置线条宽度
//    CGContextSetLineWidth(context, kLineWidth);
    
    //绘制干扰线
//    for (int i = 0; i < kLineCount; i++)
//    {
//        UIColor *color = kRandomColor;
//        CGContextSetStrokeColorWithColor(context, color.CGColor);//设置线条填充色
//        
//        //设置线的起点
//        pX = arc4random() % (int)rect.size.width;
//        pY = arc4random() % (int)rect.size.height;
//        CGContextMoveToPoint(context, pX, pY);
//        //设置线终点
//        pX = arc4random() % (int)rect.size.width;
//        pY = arc4random() % (int)rect.size.height;
//        CGContextAddLineToPoint(context, pX, pY);
//        //画线
//        CGContextStrokePath(context);
//    }
}

@end
