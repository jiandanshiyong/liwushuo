//
//  ChoiceStrategyViewController.m
//  LWS
//
//  Created by 张凯 on 16/8/13.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "ChoiceStrategyViewController.h"
#import "DEFINE.h"
#import "BannerCollectionView.h"  //横幅1
#import "TopicCollectionView.h"   //横幅2

@interface ChoiceStrategyViewController ()

@property(nonatomic, strong) BannerCollectionView * banner;
@property(nonatomic, strong) TopicCollectionView * topic;

@end

@implementation ChoiceStrategyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.topic.yzBottom+10.0)];
    [headerView addSubview:self.banner];
    [headerView addSubview:self.topic];
    
    self.tableView.tableHeaderView = headerView;
}

#pragma mark - 懒加载
//上滚动
- (BannerCollectionView *)banner{
    if (_banner == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _banner = [[BannerCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 135.0*YZScaleY)
                                         collectionViewLayout:layout];
        _banner.backgroundColor = [UIColor whiteColor];
    }
    return _banner;
}

//二横幅
- (BannerCollectionView *)topic{
    if (_topic == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = cellMargin * 0.5;
        layout.minimumLineSpacing = cellMargin;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _topic = [[TopicCollectionView alloc] initWithFrame:CGRectMake(0, self.banner.yzHeight, kScreenWidth, 100.0*YZScaleY)
                                         collectionViewLayout:layout];
        _topic.backgroundColor = [UIColor whiteColor];
    }
    return _topic;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
