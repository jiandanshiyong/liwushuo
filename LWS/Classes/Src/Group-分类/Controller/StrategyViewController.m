//
//  StrategyViewController.m
//  LWS
//
//  Created by 张凯 on 16/8/16.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "StrategyViewController.h"
#import "DEFINE.h"
#import "StrategyColumnCell.h"
#import "StrategyCategoryCell.h"
#import "StrategySectionView.h"
#import "CommonStrategyViewController.h"

#define cellColumns  2
#define cellMargin 10.0
#define columnCellHeight 250.0
#define cellScale  (200.0 / 100.0) /// cellxib宽高比例
#define columnCellID   @"StrategyColumnCell" //1cell
#define categoryCellID  @"StrategyCategoryCell" //234Cell
#define sectionID  @"StrategySectionView"  //分组头

@interface StrategyViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) UICollectionView * collectionView;
@property(nonatomic, assign) CGSize headerReferenceSize;   //标题头的大小

@end

@implementation StrategyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    self.automaticallyAdjustsScrollViewInsets = NO;  //从(0,0)开始布局
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
}


#pragma mark - 懒加载

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = cellMargin * 0.5;
        layout.minimumLineSpacing = cellMargin;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical; //纵向滑动
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.frame = CGRectMake(0, 0, KScreenWidth, KScreenHeight-64-44 -49);
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = false;
        _collectionView.showsVerticalScrollIndicator = false;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"StrategyColumnCell" bundle:nil] forCellWithReuseIdentifier:columnCellID];
        [_collectionView registerNib:[UINib nibWithNibName:@"StrategyCategoryCell" bundle:nil] forCellWithReuseIdentifier:categoryCellID];
        [_collectionView registerNib:[UINib nibWithNibName:@"StrategySectionView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionID];
        
        UIView *section = [[NSBundle mainBundle] loadNibNamed:@"StrategySectionView" owner:self options:nil].lastObject;
        UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout *)_collectionView.collectionViewLayout;
        collectionViewLayout.headerReferenceSize = CGSizeMake(KScreenWidth, section.yzHeight);
        
        self.headerReferenceSize = collectionViewLayout.headerReferenceSize;
    }
    return _collectionView;
}


#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return section == 0 ? 1 : 6;
}

// item视图
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {  //栏目
         StrategyColumnCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:columnCellID forIndexPath:indexPath];
        
         return cell;
    }else{  //分类
        StrategyCategoryCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:categoryCellID forIndexPath:indexPath];
        
        return cell;
    }
}

//节头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    StrategySectionView *sectionView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionID forIndexPath:indexPath];
    
    [sectionView hideMarginTopView:indexPath.section == 0 ? true : false];
    sectionView.viewAllBtn.tag = indexPath.section;
    return sectionView;
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
    
    if (indexPath.section == 0) {
        return CGSizeMake(self.collectionView.yzWidth, columnCellHeight);
    }
    
    CGFloat width = (self.collectionView.yzWidth - (cellMargin * (cellColumns + 1))) / cellColumns;
    CGFloat height = width / cellScale;
    return CGSizeMake(width, height);
}

//item间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return UIEdgeInsetsMake(0, cellMargin, 0, cellMargin);
    }
    return UIEdgeInsetsMake(cellMargin, cellMargin, cellMargin, cellMargin);
}

//节头的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(self.headerReferenceSize.width, self.headerReferenceSize.height-12);
    }
    return self.headerReferenceSize;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
