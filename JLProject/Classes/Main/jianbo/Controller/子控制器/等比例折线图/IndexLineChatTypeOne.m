//
//  IndexLineChatTypeOne.m
//  UcsProject
//
//  Created by UCS on 2017/6/19.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "IndexLineChatTypeOne.h"

#define P_M(x,y) CGPointMake(x, y)
#define XORYLINEMAXSIZE CGSizeMake(CGFLOAT_MAX,30)

@interface IndexLineChatTypeOne ()

@property (nonatomic, strong) NSMutableArray *xArr;
@property (nonatomic, strong) NSMutableArray *yArr;
@property (nonatomic, strong) NSMutableArray *positionArr;
//X，Y轴的长度
@property (assign, nonatomic) CGFloat  xLength;
@property (assign, nonatomic) CGFloat  yLength;
//X，Y轴每一个单位的长度
@property (nonatomic, assign) CGFloat  perXLen;
@property (nonatomic, assign) CGFloat  perYlen;
//比例
@property (assign , nonatomic)  CGFloat  perValue ;
//保存点位置的数组,存放各个传入数值的位置
@property (nonatomic,strong)    NSMutableArray * drawDataArr;
@end


@implementation IndexLineChatTypeOne

/**
 *  重写初始化方法
 *
 *  @param frame         frame
 *
 *  @return 自定义折线图
 */

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)reloadXdata: (NSMutableArray *)xdata ydata: (NSMutableArray *)ydata positionData: (NSMutableArray *)positionData{
    
    self.xArr = xdata;
    self.yArr = ydata;
    self.positionArr = positionData;
    //计算原点位置
    [self configChartOrigin];
    //获取X与Y轴的长度
    [self configChartXAndYLength];
    //获取每一个单位个X轴间距
    [self configPerX];
    //将传入的数据换算成点
    [self configValueDataArray];
    
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制x和y
    [self drawXLineWithContext:context];
    [self drawYLineWithContext:context];
    //绘制折线
    [self drawPositionLineWithContext:context];
    
}

- (NSMutableArray *)xArr{
    
    if (_xArr == nil) {
        _xArr = [NSMutableArray arrayWithCapacity:2];
    }
    return _xArr;
}

- (NSMutableArray *)yArr{
    
    if (_yArr == nil) {
        _yArr = [NSMutableArray arrayWithCapacity:2];
    }
    return _yArr;
}

- (NSMutableArray *)positionArr{
    
    if (_positionArr == nil) {
        _positionArr = [NSMutableArray arrayWithCapacity:2];
    }
    return _positionArr;
}

- (NSMutableArray *)drawDataArr{
    
    if (_drawDataArr == nil) {
        _drawDataArr = [NSMutableArray arrayWithCapacity:2];
    }
    return _drawDataArr;
}

/**
 *  获取X与Y轴的长度
 */
- (void)configChartXAndYLength{
    _xLength = CGRectGetWidth(self.frame)-self.contentInsets.left-self.contentInsets.right;
    _yLength = CGRectGetHeight(self.frame)-self.contentInsets.top-self.contentInsets.bottom;
}
/**
 *  构建折线图原点
 */
- (void)configChartOrigin{
    
    self.chartOrigin = CGPointMake(self.contentInsets.left, self.frame.size.height-self.contentInsets.bottom);
}
/**
 *  获取每个X轴刻度间距
 */
- (void)configPerX{
    
    _perXLen = (_xLength-(_firstXRangeStart+_lastXRangeEnd))/(self.xArr.count-1);
    _perYlen = (_yLength-_lastYRangeEnd)/(self.yArr.count);
}

- (void)drawXLineWithContext:(CGContextRef)context{
    
    [self drawLineWithContext:context andStarPoint:self.chartOrigin andEndPoint:P_M(self.contentInsets.left+_xLength, self.chartOrigin.y) andIsDottedLine:NO andColor:self.xAndYLineColor];
    
    for (NSInteger i = 0; i<self.xArr.count;i++ ) {
        
        CGPoint p = P_M(_firstXRangeStart +i*_perXLen+self.chartOrigin.x, self.chartOrigin.y);
        CGFloat len = [self sizeOfStringWithMaxSize:XORYLINEMAXSIZE textFont:self.xDescTextFontSize aimString:self.xArr[i]].width;
        //绘制点
        [self drawLineWithContext:context andStarPoint:p andEndPoint:P_M(p.x, p.y-3) andIsDottedLine:NO andColor:self.xAndYLineColor];
        [self drawText:[NSString stringWithFormat:@"%@",self.xArr[i]] andContext:context atPoint:P_M(p.x-len/2, p.y + SIZE_IPHONE6PX(22)) WithColor:[UIColor redColor] andFontSize:self.xDescTextFontSize];
    }
    
    //绘制x，y轴名称
    CGPoint yTitle = P_M(self.chartOrigin.x+2, self.chartOrigin.y - self.yLength - SIZE_FONT_IPHONE6(14/2)/2);
    [self drawText:[NSString stringWithFormat:@"%@",_yBiaoZhu] andContext:context atPoint:yTitle WithColor:[UIColor purpleColor] andFontSize: SIZE_FONT_IPHONE6(14/2)];
    
    CGFloat XBiaoZhuFrame = [self sizeOfStringWithMaxSize:XORYLINEMAXSIZE textFont:SIZE_IPHONE6PX(14/2) aimString:_xBiaoZhu].width;
    CGPoint xTitle = P_M(self.chartOrigin.x + self.xLength - XBiaoZhuFrame/2-4, self.chartOrigin.y - SIZE_IPHONE6PX(14)-6);
    [self drawText:[NSString stringWithFormat:@"%@",_xBiaoZhu] andContext:context atPoint:xTitle WithColor:_xAndYNumberColor andFontSize: SIZE_FONT_IPHONE6(14/2)];
}

//绘制Y轴
- (void)drawYLineWithContext:(CGContextRef)context{
    
    //绘制Y轴
    [self drawLineWithContext:context andStarPoint:self.chartOrigin andEndPoint:P_M(self.chartOrigin.x,self.chartOrigin.y-_yLength) andIsDottedLine:NO andColor:self.xAndYLineColor];
    
    for (NSInteger i = 0; i<self.yArr.count; i++) {
        
        //获得每一个y轴上标注的点的位置
        CGPoint p = P_M(self.chartOrigin.x, self.chartOrigin.y - (i+1)*_perYlen);
        //获取每一个文字的宽度
        CGFloat len = [self sizeOfStringWithMaxSize:XORYLINEMAXSIZE textFont:self.yDescTextFontSize aimString:self.yArr[i]].width;
        
        CGFloat hei = [self sizeOfStringWithMaxSize:CGSizeMake(CGFLOAT_MAX, 30) textFont:self.yDescTextFontSize aimString:self.yArr[i]].height;
        //绘制y轴上的文字
        [self drawText:[NSString stringWithFormat:@"%@",self.yArr[i]] andContext:context atPoint:P_M(p.x-len-3, p.y-hei / 2) WithColor:_xAndYNumberColor andFontSize:self.yDescTextFontSize];
        //是否显示虚线
        if (_showYLevelLine) {
            
            [self drawLineWithContext:context andStarPoint:p andEndPoint:P_M(self.contentInsets.left+_xLength, p.y) andIsDottedLine:YES andColor:self.xAndYLineColor];
        }else{
            
            [self drawLineWithContext:context andStarPoint:p andEndPoint:P_M(p.x+3, p.y) andIsDottedLine:NO andColor:self.xAndYLineColor];
        }
    }
}

/**
 *  绘制其他线段
 *
 *  @param context  图形绘制上下文
 *  @param start    起点
 *  @param end      终点
 *  @param isDotted 是否是虚线
 *  @param color    线段颜色
 */
- (void)drawLineWithContext:(CGContextRef )context andStarPoint:(CGPoint )start andEndPoint:(CGPoint)end andIsDottedLine:(BOOL)isDotted andColor:(UIColor *)color{
    //移动到点
    CGContextMoveToPoint(context, start.x, start.y);
    //连接到
    CGContextAddLineToPoint(context, end.x, end.y);
    //线宽
    CGContextSetLineWidth(context, 0.5);
    
    [color setStroke];
    
    if (isDotted) {
        CGFloat ss[] = {3,2};
        CGContextSetLineDash(context, 0, ss, 2);
    }else{
        CGFloat ss[] = {1,0};
        CGContextSetLineDash(context, 0, ss, 2);
    }
    
    CGContextMoveToPoint(context, end.x, end.y);
    CGContextDrawPath(context, kCGPathFillStroke);
}
/**
 *  绘制数据线段
 *
 *  @param context  图形绘制上下文
 *  @param start    起点
 *  @param end      终点
 *  @param isDotted 是否是虚线
 *  @param color    线段颜色
 */
- (void)drawdataLineWithContext:(CGContextRef )context andStarPoint:(CGPoint )start andEndPoint:(CGPoint)end andIsDottedLine:(BOOL)isDotted andColor:(UIColor *)color{
    //移动到点
    CGContextMoveToPoint(context, start.x, start.y);
    //连接到
    CGContextAddLineToPoint(context, end.x, end.y);
    //线宽
    CGContextSetLineWidth(context, SIZE_IPHONE6PX(4));
    
    [color setStroke];
    
    if (isDotted) {
        CGFloat ss[] = {3,2};
        CGContextSetLineDash(context, 0, ss, 2);
    }else{
        CGFloat ss[] = {1,0};
        CGContextSetLineDash(context, 0, ss, 2);
    }
    
    CGContextMoveToPoint(context, end.x, end.y);
    CGContextDrawPath(context, kCGPathFillStroke);
}

/**
 绘制圆点
 
 @param redius 半径
 @param color 颜色
 @param p 中心点
 @param contex context
 */
- (void)drawPointWithRedius:(CGFloat)redius andColor:(UIColor *)color andPoint:(CGPoint)p andContext:(CGContextRef)contex{
    
    CGContextAddArc(contex, p.x, p.y, redius, 0, M_PI * 2, YES);
    [color setFill];
    CGContextDrawPath(contex, kCGPathFill);
    
}

/**
 *  返回字符串的占用尺寸
 *
 *  @param maxSize   最大尺寸
 *  @param fontSize  字号大小
 *  @param aimString 目标字符串
 *
 *  @return 占用尺寸
 */
- (CGSize)sizeOfStringWithMaxSize:(CGSize)maxSize textFont:(CGFloat)fontSize aimString:(NSString *)aimString{
    
    return [[NSString stringWithFormat:@"%@",aimString] boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
}

/**
 *  绘制文字
 *
 *  @param text    文字内容
 *  @param context 图形绘制上下文
 *  @param rect    绘制点
 *  @param color   绘制颜色
 */
- (void)drawText:(NSString *)text andContext:(CGContextRef )context atPoint:(CGPoint )rect WithColor:(UIColor *)color andFontSize:(CGFloat)fontSize{
    
    
    [[NSString stringWithFormat:@"%@",text] drawAtPoint:rect withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSForegroundColorAttributeName:color}];
    
    [color setFill];
    
    CGContextDrawPath(context, kCGPathFill);
}


/**
 *  设置点的引导虚线
 *
 *  @param context 图形面板上下文
 */
- (void)drawPositionLineWithContext:(CGContextRef)context{
    
    if (self.drawDataArr.count==0) {
        return;
    }
    
    for (NSInteger m = 0; m < _drawDataArr.count;m++) {
        
        NSArray *arr = _drawDataArr[m];
        
        for (NSInteger i = 0 ;i<arr.count;i++ ) {
            
            CGPoint p = [arr[i] CGPointValue];
            
            UIColor *positionLineColor;
            
            if (_positionLineColorArr.count == _drawDataArr.count) {
                
                positionLineColor = _positionLineColorArr[m];
                
            }else{
            
                positionLineColor = [UIColor blackColor];
            }
            
            [self drawPointWithRedius:SIZE_IPHONE6PX(12/2) andColor:positionLineColor andPoint:p andContext:context];
            
            if (i == 0) {
                
            }else{
                
                [self drawdataLineWithContext:context andStarPoint:[arr[i - 1] CGPointValue] andEndPoint:p andIsDottedLine:NO andColor:positionLineColor];
            }
        }
        
    }
    
    
}

/**
 *  将各个点的位置放入数组
 */
- (void)configValueDataArray{
    
    if (self.positionArr.count==0) {
        return;
    }
    
    //将各个点的位置放入数组
    for (NSArray *valueArr in _positionArr) {
        
        NSMutableArray *dataMArr = [NSMutableArray arrayWithCapacity:3];
        
        _perValue = _perYlen/[[_yArr firstObject] floatValue];
        
        for (NSInteger i = 0; i < valueArr.count; i++) {
            
            CGPoint p = P_M(i*_perXLen + self.chartOrigin.x + _firstXRangeStart, self.contentInsets.top + _yLength  - [valueArr[i] floatValue] * _perValue);
            
            NSValue *value = [NSValue valueWithCGPoint:p];
            
            [dataMArr addObject:value];
        }
        
        [self.drawDataArr addObject:[dataMArr copy]];
        
    }
}






@end
