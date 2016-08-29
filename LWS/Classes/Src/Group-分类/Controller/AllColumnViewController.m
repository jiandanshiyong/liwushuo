//
//  AllColumnViewController.m
//  LWS
//
//  Created by 张凯 on 16/8/20.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "AllColumnViewController.h"
#import "StrategyColumnCellCell.h"
#import "DEFINE.h"
#import "ColumnListViewController.h"

#define cellColumns 1
#define cellMargin 10.0
#define cellScale (340.0 / 90.0) /// cellxib宽高比例

@interface AllColumnViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong) UICollectionView * collectionView;

@end

@implementation AllColumnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    [self.view addSubview:self.collectionView];
}


#pragma mark - 懒加载
- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = cellMargin * 0.5;
        layout.minimumLineSpacing =cellMargin;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"StrategyColumnCellCell" bundle:nil] forCellWithReuseIdentifier:@"StrategyColumnCellCell"];
    }
    return _collectionView;
}


#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 15;
}

// item视图
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    StrategyColumnCellCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"StrategyColumnCellCell" forIndexPath:indexPath];
        
        return cell;
}

//选中
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"item被点击 跳转");
    ColumnListViewController *columnListVC = [[ColumnListViewController alloc] init];
    
    [self.navigationController pushViewController:columnListVC animated:true];
}

//item的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width = (self.collectionView.yzWidth - (cellMargin * (cellColumns + 1))) / cellColumns;
    CGFloat height = width / cellScale;
    return CGSizeMake(width, height);
}

//item间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(cellMargin, cellMargin, cellMargin, cellMargin);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
