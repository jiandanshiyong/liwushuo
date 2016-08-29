//
//  AllClassifyViewController.m
//  LWS
//
//  Created by 张凯 on 16/8/20.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "AllClassifyViewController.h"
#import "StrategyCategoryCell.h"
#import "DEFINE.h"
#import "CommonStrategyViewController.h"

#define cellColumns  2
#define cellMargin   10.0
#define columnCellHeight 250.0
#define cellScale (200.0 / 100.0) /// cellxib宽高比例

@interface AllClassifyViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong) UICollectionView * collectionView;

@end

@implementation AllClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
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
        _collectionView.showsHorizontalScrollIndicator = false;
        _collectionView.showsVerticalScrollIndicator = false;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"StrategyCategoryCell" bundle:nil] forCellWithReuseIdentifier:@"StrategyCategoryCell"];
    }
    return _collectionView;
}


#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

// item视图
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    StrategyCategoryCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"StrategyCategoryCell" forIndexPath:indexPath];
    
    return cell;
}

//选中
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"item被点击 跳转");
    CommonStrategyViewController *commonStrategyVC = [[CommonStrategyViewController alloc] init];
    commonStrategyVC.tableView.frame = CGRectMake(0, 0, kScreenWidth, KScreenHeight-64);
    
    [self.navigationController pushViewController:commonStrategyVC animated:YES];
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
