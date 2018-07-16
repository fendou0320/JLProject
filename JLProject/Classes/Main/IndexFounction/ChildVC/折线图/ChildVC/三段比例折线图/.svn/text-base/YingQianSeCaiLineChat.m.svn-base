//
//  YingQianSeCaiLineChat.m
//  UcsProject
//
//  Created by UCS on 2017/6/11.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "YingQianSeCaiLineChat.h"

#define P_M(x,y) CGPointMake(x, y)
#define XORYLINEMAXSIZE CGSizeMake(CGFLOAT_MAX,30)

@interface YingQianSeCaiLineChat ()
@property (nonatomic, strong) NSMutableArray *xArr;
@property (nonatomic, strong) NSMutableArray *yArr;
@property (nonatomic, strong) NSMutableArray *positionArr;
//X，Y轴的长度
@property (assign, nonatomic) CGFloat  xLength;
@property (assign, nonatomic) CGFloat  yLength;
//X，Y轴每一个单位的长度
@property (nonatomic, assign) CGFloat  perXLen;
//@property (nonatomic, assign) CGFloat  perYlen;
//比例
@property (assign , nonatomic)  CGFloat  perValue ;
//保存点位置的数组,存放各个传入数值的位置
@property (nonatomic,strong)    NSMutableArray * drawDataArr;
//y轴从下到上依次
@end


@implementation YingQianSeCaiLineChat

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
//    _perYlen = (_yLength-_lastYRangeEnd)/(self.yArr.count-1);
}

//绘制X轴
- (void)drawXLineWithContext:(CGContextRef)context{
    
    //绘制X轴
    [self drawLineWithContext:context andStarPoint:self.chartOrigin andEndPoint:P_M(self.contentInsets.left+_xLength, self.chartOrigin.y) andIsDottedLine:NO andColor:self.xAndYLineColor];
    
    for (NSInteger i = 0; i<self.xArr.count;i++ ) {
        
        CGPoint p = P_M(_firstXRangeStart +i*_perXLen+self.chartOrigin.x, self.chartOrigin.y);
        CGFloat len = [self sizeOfStringWithMaxSize:XORYLINEMAXSIZE textFont:self.xDescTextFontSize aimString:self.xArr[i]].width;
        //绘制x轴的点
//        [self drawLineWithContext:context andStarPoint:p andEndPoint:P_M(p.x, p.y-3) andIsDottedLine:NO andColor:self.xAndYLineColor];
        //设置第一个X轴文字的左侧偏移
        if (i==0) {
            //            len = ;
        }
        [self drawText:[NSString stringWithFormat:@"%@",self.xArr[i]] andContext:context atPoint:P_M(p.x-len/2, p.y + SIZE_IPHONE6PX(22)) WithColor:COLOR_CHATLINE_ZUOBIAO andFontSize:self.xDescTextFontSize];
    }
    
    //绘制x，y轴名称
    CGPoint yTitle = P_M(self.chartOrigin.x+2, self.chartOrigin.y - self.yLength - SIZE_FONT_IPHONE6(14/2)/2);
    //获取每一个文字的宽度
    [self drawText:[NSString stringWithFormat:@"%@",_yBiaoZhu] andContext:context atPoint:yTitle WithColor:COLOR_Cinema andFontSize: SIZE_FONT_IPHONE6(14/2)];
    
    CGFloat XBiaoZhuFrame = [self sizeOfStringWithMaxSize:XORYLINEMAXSIZE textFont:SIZE_IPHONE6PX(14/2) aimString:_xBiaoZhu].width;
    CGPoint xTitle = P_M(self.chartOrigin.x + self.xLength - XBiaoZhuFrame/2-4, self.chartOrigin.y - SIZE_IPHONE6PX(14)-6);
    //获取每一个文字的宽度
    [self drawText:[NSString stringWithFormat:@"%@",_xBiaoZhu] andContext:context atPoint:xTitle WithColor:_xAndYNumberColor andFontSize: SIZE_FONT_IPHONE6(14/2)];
}

//绘制Y轴
- (void)drawYLineWithContext:(CGContextRef)context{

    //绘制Y轴
    [self drawLineWithContext:context andStarPoint:self.chartOrigin andEndPoint:P_M(self.chartOrigin.x,self.chartOrigin.y-_yLength) andIsDottedLine:NO andColor:self.xAndYLineColor];
    
        for (NSInteger i = 0; i<3; i++) {
    
            //获取每一个文字的宽度
            CGFloat len = [self sizeOfStringWithMaxSize:XORYLINEMAXSIZE textFont:self.yDescTextFontSize aimString:self.yArr[i]].width;
            CGFloat hei = [self sizeOfStringWithMaxSize:CGSizeMake(CGFLOAT_MAX, 30) textFont:self.yDescTextFontSize aimString:self.yArr[i]].height;
            //创建位置
            CGPoint p;
            //获得每一个y轴上标注的点的位置
            if (i == 0) {
                
                p = P_M(self.chartOrigin.x, self.chartOrigin.y);
                
            }else if (i == 1){
            
                p = P_M(self.chartOrigin.x, self.chartOrigin.y - SIZE_IPHONE6(kYBottom));
                [self drawLineWithContext:context andStarPoint:p andEndPoint:P_M(self.contentInsets.left+_xLength, p.y) andIsDottedLine:YES andColor:self.leveLineColor];

            }else if (i == 2){
            
                p = P_M(self.chartOrigin.x, self.chartOrigin.y - SIZE_IPHONE6(kYBottom) - SIZE_IPHONE6(kYMiddle));
                [self drawLineWithContext:context andStarPoint:p andEndPoint:P_M(self.contentInsets.left+_xLength, p.y) andIsDottedLine:YES andColor:self.leveLineColor];
            }            
            //绘制y轴上的文字
            [self drawText:[NSString stringWithFormat:@"%@",self.yArr[i]] andContext:context atPoint:P_M(p.x-len-3, p.y-hei / 2) WithColor:_xAndYNumberColor andFontSize:self.yDescTextFontSize];
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
    
    NSMutableArray *lineDateArr = _drawDataArr.firstObject;
    //绘制折线
    for (NSInteger i = 0 ;i< lineDateArr.count;i++ ) {
        
        CGPoint p = [lineDateArr[i] CGPointValue];

        if (i == 0) {
            //第一个点无线可连
        }else{
          
            [self drawdataLineWithContext:context andStarPoint:[lineDateArr[i - 1] CGPointValue] andEndPoint:p andIsDottedLine:NO andColor:self.HuiZhilineColor];
        }
    }
    
    //绘制圆点
    for (NSInteger i = 0; i < lineDateArr.count; i++) {
        
        CGPoint p = [lineDateArr[i] CGPointValue];
        
        //设置颜色
        CGFloat lowShuiPingXian = self.contentInsets.top + _yLength  - SIZE_IPHONE6(kYBottom);
        CGFloat hignShuiPingXian = self.contentInsets.top + _yLength  - SIZE_IPHONE6(kYBottom) - SIZE_IPHONE6PX(kYMiddle);
        
        if (p.y > lowShuiPingXian) {
            
            [self drawPointWithRedius:SIZE_IPHONE6PX(12/2) andColor:[UIColor redColor] andPoint:p andContext:context];
        }else if (p.y < hignShuiPingXian){
            
            [self drawPointWithRedius:SIZE_IPHONE6PX(12/2) andColor:[UIColor redColor] andPoint:p andContext:context];
        }else{
            
            [self drawPointWithRedius:SIZE_IPHONE6PX(12/2) andColor:[UIColor greenColor] andPoint:p andContext:context];
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
    //取出标准值
    CGFloat indexBottom = [self.yArr[1] floatValue];
    CGFloat indexMiddle = [self.yArr[2] floatValue];
    CGFloat indexTop = [self.yArr.lastObject floatValue];

    //对应的三段比例
    CGFloat biLiBottom = kYBottom/indexBottom;
    CGFloat biLiMiddel = kYMiddle/(indexMiddle-indexBottom);
    CGFloat biLiTop = kYTop/(indexTop-indexMiddle);
    
    //将各个点的位置放入数组
    NSMutableArray *dataMArr = [NSMutableArray arrayWithCapacity:3];
    
    for (NSInteger i = 0; i < _positionArr.count; i++) {
        
        NSString *indexStr = _positionArr[i];
        
        CGFloat indexFloat = [indexStr floatValue];
        NSLog(@"%f", indexFloat);
        
        //x坐标
        CGFloat xZuoBiao = i * _perXLen + self.chartOrigin.x + _firstXRangeStart;
        
        
        if (indexFloat < indexBottom) {
            
            //y坐标
            CGFloat yZuoBiao = self.contentInsets.top + _yLength  - SIZE_IPHONE6(biLiBottom*indexFloat);
            
            CGPoint p = P_M(xZuoBiao, yZuoBiao);
            
            NSValue *value = [NSValue valueWithCGPoint:p];
            
            [dataMArr addObject:value];
            
        }else if(indexFloat == indexBottom){
        
            //y坐标
            CGFloat middleDistance =(indexFloat - indexBottom)*biLiMiddel;
            
            CGFloat yZuoBiao = self.contentInsets.top + _yLength  - SIZE_IPHONE6(kYBottom) - SIZE_IPHONE6(middleDistance);
            
            CGPoint p = P_M(xZuoBiao, yZuoBiao);
            
            NSValue *value = [NSValue valueWithCGPoint:p];
            
            [dataMArr addObject:value];

            
        }else if ((indexFloat > indexBottom) && (indexFloat < indexMiddle)){
            
            //y坐标
            CGFloat middleDistance =(indexFloat - indexBottom)*biLiMiddel;
            
            CGFloat yZuoBiao = self.contentInsets.top + _yLength  - SIZE_IPHONE6(kYBottom) - SIZE_IPHONE6(middleDistance);
            
            CGPoint p = P_M(xZuoBiao, yZuoBiao);
            
            NSValue *value = [NSValue valueWithCGPoint:p];
            
            [dataMArr addObject:value];
            
        }else if (indexFloat == indexMiddle){
        
            //y坐标
            CGFloat topDistance =(indexFloat - indexMiddle)*biLiTop;
            
            CGFloat yZuoBiao = self.contentInsets.top + _yLength  - SIZE_IPHONE6(kYBottom) - SIZE_IPHONE6(kYMiddle) - SIZE_IPHONE6(topDistance);
            
            CGPoint p = P_M(xZuoBiao, yZuoBiao);
            
            NSValue *value = [NSValue valueWithCGPoint:p];
            
            [dataMArr addObject:value];
            
        }else if (indexFloat > indexMiddle){
            
            //y坐标
            CGFloat topDistance =(indexFloat - indexMiddle)*biLiTop;
            
            CGFloat yZuoBiao = self.contentInsets.top + _yLength  - SIZE_IPHONE6(kYBottom) - SIZE_IPHONE6(kYMiddle) - SIZE_IPHONE6(topDistance);
            
            CGPoint p = P_M(xZuoBiao, yZuoBiao);
            
            NSValue *value = [NSValue valueWithCGPoint:p];
            
            [dataMArr addObject:value];
            
        }
        
    }
    [self.drawDataArr addObject:[dataMArr copy]];
    
    
}






@end
