//
//  SanDianView.m
//  JLProject
//
//  Created by UCS on 2017/6/8.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "SanDianView.h"

#define P_M(x,y) CGPointMake(x, y)
//最后一个标注距离右端的长度
#define kXandYSpaceForSuperView 20.0
#define XORYLINEMAXSIZE CGSizeMake(CGFLOAT_MAX,30)

@interface SanDianView ()
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

@implementation SanDianView

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
    self.positionArr = positionData;
    //设置纵坐标
    [self updateYScale];
    
    //计算原点位置
    [self configChartOrigin];
    //获取X与Y轴的长度
    [self configChartXAndYLength];
    //获取每一个单位个X或y轴间距
    [self configPerXAndPerY];
    //将传入的数据换算成点
    [self configValueDataArray];
    
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //绘制x和y
    [self drawXAndYLineWithContext:context];
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
 *  获取每个X或y轴刻度间距
 */
- (void)configPerXAndPerY{
    
    _perXLen = (_xLength-kXandYSpaceForSuperView)/([self.xArr count]);
    _perYlen = (_yLength-kXandYSpaceForSuperView)/(self.yArr.count-1);
}

//绘制X轴和Y轴
- (void)drawXAndYLineWithContext:(CGContextRef)context{
    
    //绘制X轴
    [self drawLineWithContext:context andStarPoint:self.chartOrigin andEndPoint:P_M(self.contentInsets.left+_xLength, self.chartOrigin.y) andIsDottedLine:NO andColor:self.xAndYLineColor];
    //绘制Y轴
    [self drawLineWithContext:context andStarPoint:self.chartOrigin andEndPoint:P_M(self.chartOrigin.x,self.chartOrigin.y-_yLength) andIsDottedLine:NO andColor:self.xAndYLineColor];
    
    CGFloat yPace = (_yLength - kXandYSpaceForSuperView)/([self.yArr count]);
    
    //        _perYlen = yPace;
    for (NSInteger i = 0; i<self.yArr.count; i++) {
        
        //获得每一个y轴上标注的点的位置
//        CGPoint p = P_M(self.chartOrigin.x, self.chartOrigin.y - (i+1)*yPace);
        CGPoint p = P_M(self.chartOrigin.x, self.chartOrigin.y - i*yPace);
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
    
    
    CGFloat xPace = (_xLength-kXandYSpaceForSuperView)/(self.xArr.count);
    
    for (NSInteger i = 0; i<self.xArr.count;i++ ) {
        
        CGPoint p = P_M((i+1)*xPace+self.chartOrigin.x, self.chartOrigin.y);
        
        CGFloat len = [self sizeOfStringWithMaxSize:XORYLINEMAXSIZE textFont:self.xDescTextFontSize aimString:self.xArr[i]].width;
        [self drawLineWithContext:context andStarPoint:p andEndPoint:P_M(p.x, p.y-3) andIsDottedLine:NO andColor:self.xAndYLineColor];
        //设置第一个X轴文字的左侧偏移
        if (i==0) {
            //            len = ;
        }
        [self drawText:[NSString stringWithFormat:@"%@",self.xArr[i]] andContext:context atPoint:P_M(p.x-len/2, p.y+2) WithColor:_xAndYNumberColor andFontSize:self.xDescTextFontSize];
    }
    
    //绘制x，y轴名称
    CGPoint yTitle = P_M(self.chartOrigin.x, self.chartOrigin.y - (self.yArr.count * yPace));
    //获取每一个文字的宽度
//    CGFloat yTitlewidth = [self sizeOfStringWithMaxSize:XORYLINEMAXSIZE textFont:self.yDescTextFontSize aimString:_yBiaoZhu].width;
    [self drawText:[NSString stringWithFormat:@"%@",_yBiaoZhu] andContext:context atPoint:yTitle WithColor:_xAndYNumberColor andFontSize:self.xDescTextFontSize];

    CGPoint xTitle = P_M(self.chartOrigin.x + (self.xArr.count * xPace) + 10, self.chartOrigin.y - 10);
    //获取每一个文字的宽度
    //    CGFloat yTitlewidth = [self sizeOfStringWithMaxSize:XORYLINEMAXSIZE textFont:self.yDescTextFontSize aimString:_yBiaoZhu].width;
    [self drawText:[NSString stringWithFormat:@"%@",_xBiaoZhu] andContext:context atPoint:xTitle WithColor:_xAndYNumberColor andFontSize:self.xDescTextFontSize];

}

/**
 *  绘制线段
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
        CGFloat ss[] = {1.5,2};
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
    
    //定义图线颜色
    UIColor *positionLineColor;
    
    for (NSInteger m = 0; m<self.positionArr.count; m++) {
        
        NSMutableArray *lineDateArr = _drawDataArr[m];
        //设置颜色
        if (self.drawDataArr.count == self.lineColorArr.count)
        {
            positionLineColor = self.lineColorArr[m];
        }else{
            positionLineColor = [UIColor blackColor];
        }
        
        for (NSInteger i = 0 ;i< lineDateArr.count;i++ ) {
            
            CGPoint p = [lineDateArr[i] CGPointValue];
            
            //绘制圆点
            [self drawPointWithRedius:6 andColor:[UIColor redColor] andPoint:p andContext:context];

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
        
        _perValue = (_perYlen*(self.yArr.count-1))/[[_yArr lastObject] floatValue];
        
        for (NSInteger i = 0; i < valueArr.count; i++) {
            
            CGPoint p = P_M((i+1)*_perXLen+self.chartOrigin.x, self.contentInsets.top + _yLength  - [valueArr[i] floatValue] * _perValue);
            
            NSValue *value = [NSValue valueWithCGPoint:p];
            
            [dataMArr addObject:value];
        }
        
        [self.drawDataArr addObject:[dataMArr copy]];
        
    }
}


/**
 *  设置纵坐标
 */
- (void)updateYScale{
    
    NSInteger max = 0;
    NSInteger min = 0;
    
    for (NSArray *arr in self.positionArr) {
        
        for (NSString * numer  in arr) {
            NSInteger i = [numer integerValue];
            if (i>=max) {
                max = i;
            }
            if (i<=min) {
                min = i;
            }
        }
    }
    
    min = labs(min);
    max = (min<max?(max):(min));
    if (max%5==0) {
        max = max;
    }else
        max = (max/5+1)*5;
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:[NSString stringWithFormat:@"0"]];
    
    NSMutableArray *minArr = [NSMutableArray array];
    if (max<=5) {
        for (NSInteger i = 0; i<5; i++) {
            [arr addObject:[NSString stringWithFormat:@"%ld",(i+1)*1]];
            [minArr addObject:[NSString stringWithFormat:@"-%ld",(i+1)*1]];
        }
    }
    if (max<=10&&max>5) {
        
        for (NSInteger i = 0; i<5; i++) {
            [arr addObject:[NSString stringWithFormat:@"%ld",(i+1)*2]];
            [minArr addObject:[NSString stringWithFormat:@"-%ld",(i+1)*2]];
        }
    }else if(max>10&&max<=100){
        for (NSInteger i = 0; i<max/5; i++) {
            [arr addObject:[NSString stringWithFormat:@"%ld",(i+1)*5]];
            [minArr addObject:[NSString stringWithFormat:@"-%ld",(i+1)*5]];
        }
    }else{
        NSInteger count = max / 10;
        for (NSInteger i = 0; i<11; i++) {
            [arr addObject:[NSString stringWithFormat:@"%ld",(i+1)*count]];
            [minArr addObject:[NSString stringWithFormat:@"-%ld",(i+1)*count]];
        }
    }
    //    self.yArr = [NSMutableArray arrayWithArray:@[[arr copy],[minArr copy]]];
    self.yArr = [arr copy];
    //    [self setNeedsDisplay];
    
}


@end
