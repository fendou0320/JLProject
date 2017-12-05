//
//  BaseCollectionView.m
//  JLProject
//
//  Created by UCS on 2017/8/17.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import "BaseCollectionView.h"
#import "BaseCollectionViewCell.h"

@implementation BaseCollectionView

+ (instancetype)baseCollectionView: (CGRect)frame withDelegate:(id<BaseCollectionViewDelegete>)viewdelegate{

    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((kScreenWidth-80)/3, 100);
    flowLayout.minimumLineSpacing = 20;
    flowLayout.minimumInteritemSpacing = 20;
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);

    BaseCollectionView *collectionView = [[BaseCollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    collectionView.collectionDelegate = viewdelegate;
    return collectionView;
}


- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[BaseCollectionViewCell class] forCellWithReuseIdentifier:@"BaseCollectionViewCell"];

    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
//    return _dataArray.count;
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BaseCollectionViewCell *cell = [BaseCollectionViewCell baseCollectionViewCell:collectionView indexpath:indexPath];
    return cell;
}



#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


- (void)setDataArray:(NSMutableArray *)dataArray{

    _dataArray = dataArray;
    [self reloadData];
}



@end
