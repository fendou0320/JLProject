//
//  BaseCollectionView.h
//  JLProject
//
//  Created by UCS on 2017/8/17.
//  Copyright © 2017年 wangjiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BaseCollectionView;

@protocol BaseCollectionViewDelegete <NSObject>
@optional
- (void)baseCollectionView: (BaseCollectionView *)collectionView didSelectItemAtindexPath: (NSIndexPath *)indexPath dateModel:(id)model;
@end


@interface BaseCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>


@property (nonatomic, weak) id<BaseCollectionViewDelegete> collectionDelegate;

@property (nonatomic, strong) NSMutableArray *dataArray;

+ (instancetype)baseCollectionView: (CGRect)frame withDelegate:(id<BaseCollectionViewDelegete>)viewdelegate;


@end
