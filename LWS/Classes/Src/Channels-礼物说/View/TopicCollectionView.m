//
//  TopicCollectionView.m
//  LWS
//
//  Created by 张凯 on 16/8/13.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "TopicCollectionView.h"
#import "DEFINE.h"
#import "TopicCell.h"
#import "CommonStrategyViewController.h"

@interface TopicCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation TopicCollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.backgroundColor = [UIColor whiteColor];
    self.showsVerticalScrollIndicator = false;
    self.showsHorizontalScrollIndicator = false;
    self.pagingEnabled = false;
    self.delegate = self;
    self.dataSource = self;
    [self registerNib:[UINib nibWithNibName:@"TopicCell" bundle:nil] forCellWithReuseIdentifier:@"TopicCell"];
}


#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopicCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"TopicCell" forIndexPath:indexPath];
    
    return  cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(80*YZScaleX, 80*YZScaleX);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(cellMargin, cellMargin,cellMargin, cellMargin);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"横幅2 跳转");
    CommonStrategyViewController *CommonStrategyVC =  [[CommonStrategyViewController alloc] init];
    
    [self.viewController.navigationController pushViewController:CommonStrategyVC animated:YES];
}


@end
