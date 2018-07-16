//
//  JLProgressLine.m
//  JLProject
//
//  Created by UCS on 2017/6/5.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "JLProgressLine.h"

@interface JLProgressLine ()
@property (nonatomic,strong) NSArray *backColorArray;
@property (nonatomic,strong) NSArray *didColorArray;
@end


@implementation JLProgressLine

+(instancetype)progressLineWithBackColor:(NSString *)bColor didColor:(NSString *)dColor{
    return [[self alloc]initWithBackColor:bColor didColor:dColor];
}

- (instancetype)initWithBackColor:(NSString *)bColor didColor:(NSString *)dColor{
    if (self = [super init]) {
        self.backColor = bColor;
        self.backgroundColor = [UIColor colorWithRed:[self.backColorArray[0] floatValue] green:[self.backColorArray[1] floatValue] blue:[self.backColorArray[2] floatValue] alpha:1];
        self.didColor = dColor;
    }
    return self;
}

- (void)setBackColor:(NSString *)backColor{
    _backColor = backColor;
    self.backColorArray = [self RGBFromStr:backColor];
}

- (void)setDidColor:(NSString *)didColor{
    _didColor = didColor;
    self.didColorArray = [self RGBFromStr:didColor];
}

+(instancetype)progressLineWithFrame:(CGRect)frame{
    return [[self alloc]initWithFrame:frame];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat h = rect.size.height;
    CGContextSetLineWidth(context, h);  //线宽
    CGContextSetRGBStrokeColor(context, [self.didColorArray[0] floatValue], [self.didColorArray[1] floatValue], [self.didColorArray[2] floatValue], 1.0);  //线的颜色
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, 0, h/2);  //起点坐标
    CGContextAddLineToPoint(context, rect.size.width*_progress, h/2);   //终点坐标
    
    CGContextStrokePath(context);
}

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    [self setNeedsDisplay];
}

- (NSArray *)RGBFromStr:(NSString *)hexColor{
    
    NSString *str = nil;
    if([hexColor rangeOfString:@"#"].length>0){
        
        str = [hexColor substringFromIndex:1];
    }else{
        str = hexColor;
    }
    if(str.length<=0)return nil;
    
    unsigned int red, green, blue;
    NSRange range;
    range.length =2;
    
    range.location =0;
    [[NSScanner scannerWithString:[str substringWithRange:range]]scanHexInt:&red];
    range.location =2;
    [[NSScanner scannerWithString:[str substringWithRange:range]]scanHexInt:&green];
    range.location =4;
    [[NSScanner scannerWithString:[str substringWithRange:range]]scanHexInt:&blue];
    return @[@(red/255.0),@(green/255.0),@(blue/255.0)];
}


@end
