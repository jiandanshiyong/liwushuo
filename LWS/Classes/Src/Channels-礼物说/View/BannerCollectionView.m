//
//  BannerCollectionView.m
//  LWS
//
//  Created by 张凯 on 16/8/13.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "BannerCollectionView.h"
#import "DEFINE.h"
#import "BannerCell.h"
#import "CommonStrategyViewController.h"

@interface BannerCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) UIPageControl * pageControl;

@end


@implementation BannerCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        self.pageControl.yzCenterX = self.yzWidth * 0.5;
        self.pageControl.yzTop = self.yzHeight - (12.0 + self.pageControl.yzHeight);
    });
}

- (void)createUI{
    self.backgroundColor = Color_GlobalBackground;
    self.showsVerticalScrollIndicator = false;
    self.showsHorizontalScrollIndicator = false;
    self.pagingEnabled = true;
    self.delegate = self;
    self.dataSource = self;
    [self registerNib:[UINib nibWithNibName:@"BannerCell" bundle:nil] forCellWithReuseIdentifier:@"BannerCell"];
    
    [self addSubview:self.pageControl];
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 100;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BannerCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"BannerCell" forIndexPath:indexPath];
    
    return  cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kScreenWidth, 135*YZScaleY);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"横幅1 跳转");
    CommonStrategyViewController *CommonStrategyVC =  [[CommonStrategyViewController alloc] init];
    CommonStrategyVC.tableView.frame = CGRectMake(0, 0, kScreenWidth, KScreenHeight-64);
    [self.viewController.navigationController pushViewController:CommonStrategyVC animated:YES];
}


#pragma mark -  UIScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    NSInteger index = (contentOffsetX / kScreenWidth + 0.5);
    NSInteger page =  index %4 ;
    
    self.pageControl.yzCenterX = contentOffsetX + (kScreenWidth * 0.5);
    self.pageControl.currentPage = page;
}




#pragma mark - 懒加载
- (UIPageControl *)pageControl{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.pageIndicatorTintColor = [UIColor colorWithWhite:0 alpha:0.1];
        _pageControl.numberOfPages = 4;
    }
    return _pageControl;
}


@end
