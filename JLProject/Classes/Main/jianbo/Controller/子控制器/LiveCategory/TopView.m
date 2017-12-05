//
//  TopView.m
//  newInterface
//
//  Created by wangjiangliang on 16/5/11.
//  Copyright © 2016年 wangjiangliang. All rights reserved.
//

#import "TopView.h"
//粗线条的宽度和高度
#define KNavagationButtomLabelWidth  120/2
#define KNavagationButtomLabelHeight  4/2

@interface TopView ()
@property (nonatomic,strong) TopViewChannalButton *selectedButton;
//@property (nonatomic,strong) UIButton *selectedButton;
//创建底部线条
@property (nonatomic, weak) UIView *colorLabel;
@property (nonatomic, strong) NSMutableArray *btnArray;
@end

@implementation TopView

+(instancetype)topViewWithFrame:(CGRect)frame delegate:(id<TopViewDelegate>) delegate{
    
    TopView *view = [[TopView alloc]initWithFrame:frame delegate:delegate];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame delegate:(id<TopViewDelegate>) delegate{
    self = [super initWithFrame:frame];
    if (self) {
        self.topViewDelegate = delegate;
    }
    return self;
}

- (void)setModelArray:(NSArray *)modelArray{
    _modelArray = modelArray;
    [self setupUI];
}

- (NSMutableArray *)btnArray{
    if (_btnArray == nil) {
        _btnArray = [[NSMutableArray alloc] init];
    }
    return _btnArray;
}

- (void)setupUI{

    //先移除
    for (UIView *view in self.subviews) {
        [self.btnArray removeAllObjects];
        [view removeFromSuperview];
    }
    
    //创建底部线条
    UIView *label = [[UIView alloc] initWithFrame:CGRectZero];
    self.colorLabel = label;
    label.backgroundColor = [UIColor redColor];
    [self addSubview:label];
    
    //再添加
    CGFloat x = 20;
    CGFloat y = 0;
    CGFloat w = (self.frame.size.width-(20*(self.modelArray.count+1)))/self.modelArray.count;
    CGFloat h = self.frame.size.height - KNavagationButtomLabelHeight;
    
    for (int i = 0; i < self.modelArray.count; i++) {
        
        TopViewChannalButton *channalButton = [TopViewChannalButton topViewChannalButtonWithFrame:CGRectMake(x, y, w, h)];
        [self addSubview: channalButton];
        channalButton.backgroundColor = RandomColor1;
        [self.btnArray addObject:channalButton];
        x = x + 20 + w;
    }
}


//- (void)btnClick:(TopViewChannalButton *)btn{
//    
//    self.selectedButton.selected = NO;
//    btn.selected = YES;
//    self.selectedButton = btn;
//    
//    //获取点击的位置
//    NSInteger margin = 13;
//    CGFloat width = btn.frame.size.width+margin*2;
//    NSInteger btnX = btn.frame.origin.x;
//    NSInteger btnY = btn.frame.origin.y+btn.frame.size.height;
////    if (btn.width < KNavagationButtomLabelWidth){
////        width = KNavagationButtomLabelWidth;
//        btnX = btn.frame.origin.x - margin;
////    }
////    NSInteger btnX = btn.x;//btn.frame.origin.x+btn.frame.size.width/2 - KNavagationButtomLabelWidth/2;
//    
//    weakedSelf
//    CGRect colorLabelframe = CGRectMake(btnX, btnY+1, width, KNavagationButtomLabelHeight);
//    [UIView animateWithDuration:.1 animations:^{
//        weakSelf.colorLabel.frame = colorLabelframe;
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.5 animations:^{
//            
//            CGPoint offset = self.contentOffset;
//            offset.x = btn.center.x - self.center.x;
//            if (btn.center.x <self.frame.size.width / 2) {
//                self.contentOffset = CGPointMake(0, 0);
//            } else if (btn.center.x > self.contentSize.width - self.frame.size.width / 2){
//                self.contentOffset = CGPointMake(self.contentSize.width - self.frame.size.width, 0);
//            }else{
//                self.contentOffset = offset;
//            }
//        }];
//    }];
//    
//    self.selectedButton = btn;
//    if ([self.topViewDelegate respondsToSelector:@selector(topView:didClickChannalButton:)]) {
//        [self.topViewDelegate topView:self didClickChannalButton:btn];
//    }
//}


//- (void)topViewWithBtn: (NSInteger)index{
//
//    if (self.btnArray.count == 0) {
//        return;
//    }
//    TopViewChannalButton *channalButton = self.btnArray[index];
//    [self btnClick:channalButton];
//}


@end
