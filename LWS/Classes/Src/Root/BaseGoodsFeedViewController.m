//
//  BaseGoodsFeedViewController.m
//  LWS
//
//  Created by 张凯 on 16/8/13.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "BaseGoodsFeedViewController.h"
#import "DEFINE.h"
#import "BaseGoodsCell.h"

/// 列数
#define collectionViewRow  2
/// cell间距
#define cellMargin 10.0
/// cell里除图片外的固定高度(适配了所有机型在展示的商品图片都为正方形)
#define fixedHeight 78.0

@interface BaseGoodsFeedViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation BaseGoodsFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customUI];
}

- (void)customUI{
    [self.view addSubview:self.collectionView];
}


#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrayDS.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BaseGoodsCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"BaseGoodsCell" forIndexPath:indexPath];
    
    cell.model = self.arrayDS[indexPath.row];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (kScreenWidth - (cellMargin * (collectionViewRow + 1))) / collectionViewRow;
    CGFloat height = width + fixedHeight;
    return CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(cellMargin, cellMargin, cellMargin, cellMargin);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"跳转 详细");

}


#pragma mark - 懒加载

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = cellMargin * 0.5;
        layout.minimumLineSpacing = cellMargin;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical; //纵向滑动
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.view.yzHeight-64)
                                         collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = Color_GlobalBackground;
        _collectionView.showsHorizontalScrollIndicator = false;
        _collectionView.showsVerticalScrollIndicator = false;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"BaseGoodsCell" bundle:nil] forCellWithReuseIdentifier:@"BaseGoodsCell"];
    }
    return _collectionView;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
