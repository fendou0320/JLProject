//
//  CustomPopUpView.m
//  JLProject
//
//  Created by jiangliang on 2018/9/11.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "CustomPopUpView.h"

#define kMainWindow                [UIApplication sharedApplication].keyWindow

#define kArrowWidth          15
#define kArrowHeight         10
#define kDefaultMargin       10
#define kAnimationTime       0.25

@interface CustomPopUpView(){
    CGPoint          _refPoint;
    UIView          *_refView;
    CGFloat          _menuWidth;
    CGFloat          _menuHeight;
    CGFloat         _arrowPosition; // 三角底部的起始点x
    CGFloat         _topMargin;
    BOOL            _isReverse;     // 是否反向
    BOOL            _needReload;    //是否需要刷新
    UIFont          *_titleFont;
    NSString        *_titleString;   //内容
}
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation CustomPopUpView

// 从关联点创建
+ (instancetype)customPopUpViewWithWidth:(CGFloat)width titleString: (NSString *)titleString titleFont: (UIFont *)titleFont atPoint:(CGPoint)point {
    NSAssert(width>0.0f, @"width要大于0");
    CustomPopUpView *menu = [[CustomPopUpView alloc] initWithWidth:width titleString:titleString titleFont:titleFont atPoint:point];
    return menu;
}

// 从关联视图创建（可以是UIView和UIBarButtonItem）
+ (instancetype)customPopUpViewWithWidth:(CGFloat)width titleString: (NSString *)titleString titleFont: (UIFont *)titleFont relyonView:(id)view {
    NSAssert(width>0.0f, @"width要大于0");
    NSAssert([view isKindOfClass:[UIView class]]||[view isKindOfClass:[UIBarButtonItem class]], @"relyonView必须是UIView或UIBarButtonItem");
    CustomPopUpView *menu = [[CustomPopUpView alloc] initWithWidth:width titleString:titleString titleFont:titleFont relyonView:view];
    return menu;
}

- (instancetype)initWithWidth:(CGFloat)width titleString: (NSString *)titleString titleFont: (UIFont *)titleFont atPoint:(CGPoint)point{
    if (self = [super init]) {
        _menuWidth = width;
        _menuHeight = 140;//[self getBigSizeWithText:titleString font:titleFont width:width].height+kArrowHeight;
        _refPoint = point;
        _titleFont = titleFont;
        _titleString = titleString;
        [self defaultConfiguration];
        [self setupSubView];
    }
    return self;
}

- (instancetype)initWithWidth:(CGFloat)width titleString: (NSString *)titleString titleFont: (UIFont *)titleFont relyonView:(id)view{
    if (self = [super init]) {
        // 针对UIBarButtonItem做的处理
        if ([view isKindOfClass:[UIBarButtonItem class]]) {
            UIView *bgView = [view valueForKey:@"_view"];
            _refView = bgView;
        }else{
            _refView = view;
        }
        if (_refView) {
            _refPoint = [self getRefPoint];
        }
        _menuWidth = width;
        _menuHeight = 140;//[self getBigSizeWithText:titleString font:titleFont width:width].height+kArrowHeight;
        _titleFont = titleFont;
        _titleString = titleString;
        [self defaultConfiguration];
        [self setupSubView];
    }
    return self;
}

- (void)defaultConfiguration{
    self.alpha = 0.0f;
    [self setDefaultShadow];
    _cornerRaius = 5.0f;
    _offset = 0.0f;
}

- (void)setupSubView{
    [self calculateArrowAndFrame];
    [self setupMaskLayer];
    [self addSubview:self.contentView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
}

- (void)reloadData{
    [self.contentView removeFromSuperview];
    self.contentView = nil;
    [self setupSubView];
}

- (CGPoint)getRefPoint{
    CGRect absoluteRect = [_refView convertRect:_refView.bounds toView:kMainWindow];
    CGPoint refPoint;
    CGFloat menuHeight = _menuHeight;
    if (absoluteRect.origin.y + absoluteRect.size.height +  menuHeight > kScreenHeight - 10) {
        refPoint = CGPointMake(absoluteRect.origin.x + absoluteRect.size.width / 2, absoluteRect.origin.y);
    }else{
        refPoint = CGPointMake(absoluteRect.origin.x + absoluteRect.size.width / 2, absoluteRect.origin.y + absoluteRect.size.height);
    }
    return refPoint;
}

- (void)show{
    // 自定义设置统一在这边刷新一次
    [kMainWindow addSubview: self.bgView];
    [kMainWindow addSubview: self];
    self.layer.affineTransform = CGAffineTransformMakeScale(0.1, 0.1);
    [UIView animateWithDuration: kAnimationTime animations:^{
        self.layer.affineTransform = CGAffineTransformMakeScale(1.0, 1.0);
        self.alpha = 1.0f;
        self.bgView.alpha = 1.0f;
    }];
}

- (void)dismiss{
    [UIView animateWithDuration: kAnimationTime animations:^{
        self.layer.affineTransform = CGAffineTransformMakeScale(0.1, 0.1);
        self.alpha = 0.0f;
        self.bgView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.bgView removeFromSuperview];
    }];
}

// 计算文字内容宽高度，根据全部内容来计算
- (CGSize)getBigSizeWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width {
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    style.alignment = NSTextAlignmentLeft;
    NSDictionary *attribute = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:style};
    CGSize labelSize = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options: NSStringDrawingTruncatesLastVisibleLine |  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return labelSize;
}

#pragma mark - Private
- (void)setupMaskLayer{
    CAShapeLayer *layer = [self drawMaskLayer];
    self.contentView.layer.mask = layer;
}

- (void)calculateArrowAndFrame{
    CGFloat originX;
    CGFloat originY;
    CGFloat width;
    CGFloat height;
    width = _menuWidth;
    height = _menuHeight;
    // 默认在中间
    _arrowPosition = 0.5 * width - 0.5 * kArrowWidth;
    // 设置出menu的x和y（默认情况）
    originX = _refPoint.x - _arrowPosition - 0.5 * kArrowWidth;
    originY = _refPoint.y;
    // 考虑向左右展示不全的情况，需要反向展示
    if (originX + width > kScreenWidth - 10) {
        originX = kScreenWidth - kDefaultMargin - width;
    }else if (originX < 10) {
        //向上的情况间距也至少是kDefaultMargin
        originX = kDefaultMargin;
    }
    //设置三角形的起始点
    if ((_refPoint.x <= originX + width - _cornerRaius) && (_refPoint.x >= originX + _cornerRaius)) {
        _arrowPosition = _refPoint.x - originX - 0.5 * kArrowWidth;
    }else if (_refPoint.x < originX + _cornerRaius) {
        _arrowPosition = _cornerRaius;
    }else {
        _arrowPosition = width - _cornerRaius - kArrowWidth;
    }
    //如果不是根据关联视图，得算一次是否反向
    if (!_refView) {
        _isReverse = (originY + height > kScreenHeight - kDefaultMargin)?YES:NO;
    }
    CGPoint  anchorPoint;
    if (_isReverse) {
        originY = _refPoint.y - height;
        anchorPoint = CGPointMake(fabs(_arrowPosition) / width, 1);
        _topMargin = 0;
    }else{
        anchorPoint = CGPointMake(fabs(_arrowPosition) / width, 0);
        _topMargin = kArrowHeight;
    }
    originY += originY >= _refPoint.y ? _offset : -_offset;
    //保存原来的frame，防止设置锚点后偏移
    self.layer.anchorPoint = anchorPoint;
    self.frame = CGRectMake(originX, originY, width, height);
}

- (CAShapeLayer *)drawMaskLayer{
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    CGFloat bottomMargin = !_isReverse?0 :kArrowHeight;
    
    // 定出四个转角点
    CGPoint topRightArcCenter = CGPointMake(_menuWidth - _cornerRaius, _topMargin + _cornerRaius);
    CGPoint topLeftArcCenter = CGPointMake(_cornerRaius, _topMargin + _cornerRaius);
    CGPoint bottomRightArcCenter = CGPointMake(_menuWidth - _cornerRaius, _menuHeight - bottomMargin - _cornerRaius);
    CGPoint bottomLeftArcCenter = CGPointMake(_cornerRaius, _menuHeight - bottomMargin - _cornerRaius);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 从左上倒角的下边开始画
    [path moveToPoint: CGPointMake(0, _topMargin + _cornerRaius)];
    [path addLineToPoint: CGPointMake(0, bottomLeftArcCenter.y)];
    [path addArcWithCenter: bottomLeftArcCenter radius: _cornerRaius startAngle: -M_PI endAngle: -M_PI-M_PI_2 clockwise: NO];
    [path addLineToPoint: CGPointMake(_menuWidth - _cornerRaius, _menuHeight - bottomMargin)];
    [path addArcWithCenter: bottomRightArcCenter radius: _cornerRaius startAngle: -M_PI-M_PI_2 endAngle: -M_PI*2 clockwise: NO];
    [path addLineToPoint: CGPointMake(_menuWidth, _menuHeight - bottomMargin + _cornerRaius)];
    [path addArcWithCenter: topRightArcCenter radius: _cornerRaius startAngle: 0 endAngle: -M_PI_2 clockwise: NO];
    [path addLineToPoint: CGPointMake(_arrowPosition + kArrowWidth, _topMargin)];
    [path addLineToPoint: CGPointMake(_arrowPosition + 0.5 * kArrowWidth, 0)];
    [path addLineToPoint: CGPointMake(_arrowPosition, _topMargin)];
    [path addLineToPoint: CGPointMake(_cornerRaius, _topMargin)];
    [path addArcWithCenter: topLeftArcCenter radius: _cornerRaius startAngle: -M_PI_2 endAngle: -M_PI clockwise: NO];
    [path closePath];
    
    maskLayer.path = path.CGPath;
    return maskLayer;
}
- (void)setDefaultShadow{
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowRadius = 5.0;
}

#pragma mark - Setting&&Getting

- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
        _bgView.alpha = 0.0f;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:self.bounds];
        _contentView.backgroundColor = [UIColor blackColor];
        _contentView.layer.masksToBounds = YES;
    }
    return _contentView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(JRRelate(10), JRRelate(23), self.width-JRRelate(20), JRRelate(18))];
//        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textColor = [UIColor greenColor];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.numberOfLines = 1;
        _titleLabel.text = @" i证券用户专属自选股动态预警服务";
    }
    return _titleLabel;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(JRRelate(10), JRRelate(42), self.width-JRRelate(20), JRRelate(80))];
        _contentLabel.textColor = [UIColor redColor];
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.numberOfLines = 0;
        _contentLabel.text = @"最新鲜的自选股相关新闻-智能舆情、微博财经KOL独家牛眼解盘-大V点评、新浪模拟交易四星股神调仓信息及时捕捉-高手操作以及AI多空信号全把握-操盘K线，助您全方位盯盘，把握毫秒操作时机";
    }
    return _contentLabel;
}

@end


