//
//  SingleGifViewController.m
//  LWS
//
//  Created by 张凯 on 16/8/16.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "SingleGifViewController.h"
#import "DEFINE.h"
#import "SingleGifColumnCell.h"
#import "SingleGifCell.h"
#import "SingleGifSectionView.h"
#import "CommonGoodsFeedViewController.h"

#define scale  0.25     //tableView的宽度
#define cellColumns  3
#define cellMargin 10.0
#define cellScale (100.0 / 140.0)   // cellxib宽高比例
#define  cellID     @"SingleGifCell"
#define  sectionID  @"SingleGifSectionView"
#define  columnCellID   @"columnCell"

@interface SingleGifViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
    
@property(nonatomic, strong) UITableView * tableView;
@property(nonatomic, strong) UICollectionView * collectionView;

@property(nonatomic, assign) CGSize headerReferenceSize;   //标题头的大小
@property(nonatomic, assign) NSInteger selectedColumnRow;  //记录选中的 左侧cell

// ture:点击左侧cell  false:滚动右侧collectionView
@property(nonatomic, assign) BOOL isSelectedColumn;

@end


@implementation SingleGifViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    self.automaticallyAdjustsScrollViewInsets = NO;  //从(0,0)开始布局
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
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
        _collectionView.frame = CGRectMake(self.tableView.yzRight, 0, KScreenWidth*(1-scale), KScreenHeight-64-44 -49);
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = false;
        _collectionView.showsVerticalScrollIndicator = false;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"SingleGifCell" bundle:nil] forCellWithReuseIdentifier:cellID];
        [_collectionView registerNib:[UINib nibWithNibName:@"SingleGifSectionView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionID];
        
        UIView *section = [[NSBundle mainBundle] loadNibNamed:@"SingleGifSectionView" owner:self options:nil].lastObject;
        UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout *)_collectionView.collectionViewLayout;
        collectionViewLayout.headerReferenceSize = CGSizeMake(KScreenWidth, section.yzHeight);
        
        self.headerReferenceSize = collectionViewLayout.headerReferenceSize;
    }
    return _collectionView;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.frame = CGRectMake(0, 0, KScreenWidth * scale, KScreenHeight-64-44 -49);
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.backgroundColor = Color_GlobalBackground;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.sectionHeaderHeight = 0.0001;
        _tableView.sectionFooterHeight = 0.0001;
        
        [_tableView registerNib:[UINib nibWithNibName:@"SingleGifColumnCell" bundle:nil] forCellReuseIdentifier:columnCellID];
    }
    return _tableView;
}


#pragma mark - UITableViewDelegate, UITableViewDataSource 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 18;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SingleGifColumnCell *cell = [tableView dequeueReusableCellWithIdentifier:columnCellID];
    [cell changeStatus:(indexPath.row == self.selectedColumnRow ? YES : NO)];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"tableView Cell 点击");
    self.isSelectedColumn = true;
    self.selectedColumnRow = indexPath.row;
    [self.tableView reloadData];
    
    //使得collectionView跳转到指定的分组上
    NSIndexPath *indexPath_collection = [NSIndexPath indexPathForItem:0 inSection:indexPath.row];
    [self.collectionView scrollToItemAtIndexPath:indexPath_collection atScrollPosition:UICollectionViewScrollPositionTop animated:true];
//    [self.collectionView selectItemAtIndexPath:indexPath_colletion animated:YES scrollPosition:UICollectionViewScrollPositionTop];
}


#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 18;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

// item视图
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SingleGifCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    // 滚动栏目列表
    if (!self.isSelectedColumn && self.selectedColumnRow != indexPath.section ){
        self.selectedColumnRow = indexPath.section;
        [self.tableView reloadData];

        NSIndexPath *indexPath_tableView = [NSIndexPath indexPathForItem:indexPath.section inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath_tableView atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
    
    return cell;
}

//节头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    SingleGifSectionView *sectionView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:sectionID forIndexPath:indexPath];
    
    return sectionView;
}

//选中
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"非1cell的 item被点击 跳转列表");
    CommonGoodsFeedViewController *CommGoodsFeedVC = [[CommonGoodsFeedViewController alloc] init];
    
    [self.navigationController pushViewController:CommGoodsFeedVC animated:YES];
}

//item的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
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
        return CGSizeZero;
    }
    return self.headerReferenceSize;
}

#pragma mark - UIScrollViewDelegate
//拖动事件
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.isSelectedColumn = ![scrollView isKindOfClass:[UICollectionView class]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
