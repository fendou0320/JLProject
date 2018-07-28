//
//  RunTimeKVOVC.m
//  JLProject
//
//  Created by jiangliangwang on 2018/7/28.
//  Copyright © 2018年 wangjiangliang. All rights reserved.
//

#import "RunTimeKVOVC.h"
#import "PersonRunTimeKVO.h"
#import "NSObject+JLKVO.h"

@interface RunTimeKVOVC ()
@property (nonatomic, strong) PersonRunTimeKVO *dog;
@end

@implementation RunTimeKVOVC

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"用runtime实现kvo";
    
    [self creatSubView];
    
}


- (void)creatSubView{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 150, kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btn];
    btn.backgroundColor = RandomColor;
    [btn setTitle:@"demo" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btntwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btntwo.frame = CGRectMake(0, SIZE_IPHONE6(250), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btntwo];
    btntwo.backgroundColor = RandomColor;
    [btntwo setTitle:@"demo" forState:UIControlStateNormal];
    [btntwo addTarget:self action:@selector(btnTwo:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnthree = [UIButton buttonWithType:UIButtonTypeCustom];
    btnthree.frame = CGRectMake(0, SIZE_IPHONE6(350), kScreenWidth, SIZE_IPHONE6(50));
    [self.view addSubview:btnthree];
    btnthree.backgroundColor = RandomColor;
    [btnthree setTitle:@"用runtime实现kvo" forState:UIControlStateNormal];
    [btnthree addTarget:self action:@selector(demoShow:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnOne: (UIButton *)sender{
    
    
}


- (void)btnTwo: (UIButton *)sender{
    
    
}

- (void)demoShow: (UIButton *)sender{
    
    _dog = [[PersonRunTimeKVO alloc] init];
//    [_dog addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    [_dog JLAddObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    //点语法： kvo监听set方法
    _dog.age = 18;
    
    _dog.age = 27;

}

- (void)JLAddObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    DLog(@"%ld", _dog.age);
}


//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
//    DLog(@"%@", keyPath);
//}


- (void)dealloc{
    
//    [_dog removeObserver:self forKeyPath:@"age"];
    
}




@end
