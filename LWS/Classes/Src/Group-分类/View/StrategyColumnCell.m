//
//  StrategyColumnCell.m
//  LWS
//
//  Created by 张凯 on 16/8/18.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "StrategyColumnCell.h"
#import "DEFINE.h"
#import "StrategyColumnCellCell.h"
#import "ColumnListViewController.h"
#import "AllColumnViewController.h"

#define cellColumns  3
#define cellMargin   10.0
#define cellScale   (340.0 / 90.0)        /// cellxib宽高比例
#define cellID      @"StrategyColumnCellCell"

@interface StrategyColumnCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation StrategyColumnCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"StrategyColumnCellCell" bundle:nil] forCellWithReuseIdentifier:cellID];
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    StrategyColumnCellCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.viewAllcoverView.hidden = indexPath.row == 14 ? false : true;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UINavigationController *nav = self.collectionView.viewController.navigationController;
    
    if (indexPath.row == 14) {
        NSLog(@"1cell的 14item 被点击 跳转 查看全部列表");
        AllColumnViewController *allColumnVC = [[AllColumnViewController alloc] init];
        
        [nav pushViewController:allColumnVC animated:YES];
    } else {
        NSLog(@"1cell的item被点击 跳转详细");
        ColumnListViewController *ColumnListVC = [[ColumnListViewController alloc] init];
        
        [nav pushViewController:ColumnListVC animated:YES];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = (collectionView.yzHeight - (cellMargin * (cellColumns + 1))) / cellColumns;
    CGFloat width = height * cellScale;
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
     return UIEdgeInsetsMake(cellMargin, cellMargin, cellMargin, cellMargin);
}


@end
