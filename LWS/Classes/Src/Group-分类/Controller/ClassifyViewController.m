//
//  ClassifyViewController.m
//  LWS
//
//  Created by 张凯 on 16/8/15.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "ClassifyViewController.h"
#import "DEFINE.h"
#import "UIBarButtonItem+extension.h"
#import "ClassifyTitleView.h"
#import "UISearchBar+extension.h"
#import "StrategyViewController.h"
#import "SingleGifViewController.h"


@interface ClassifyViewController ()<ClassifyTitleViewDelegate,UISearchBarDelegate, UIScrollViewDelegate >

@property(nonatomic, strong) ClassifyTitleView * titleView; //标题
@property(nonatomic, strong) UISearchBar * searchBar; //搜索栏

@property(nonatomic, strong) UIScrollView * scrollView;
@property(nonatomic, strong) StrategyViewController * strategyVC; //攻略
@property(nonatomic, strong) SingleGifViewController * singleGifVC; //单品

@end

@implementation ClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = Color_GlobalBackground;
    self.navigationItem.titleView = self.titleView;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem init_ChooseGifTarget:self action:@selector(SearchGifBtnAction)];
    self.navigationItem.rightBarButtonItem.customView.alpha = 0;

    [self setupUI];
}

//右侧navBar  action
- (void)SearchGifBtnAction{
    NSLog(@"跳转选礼神器");
//     navigationController?.pushViewController(SearchGifViewController(), animated: true)
}

- (void)setupUI{
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.scrollView];
    
     self.strategyVC.view.frame = CGRectMake(0, 0, KScreenWidth, self.scrollView.yzHeight);
     self.singleGifVC.view.frame = CGRectMake(KScreenWidth, 0, KScreenWidth, self.scrollView.yzHeight);
    [self.scrollView addSubview:self.strategyVC.view];
    [self.scrollView addSubview:self.singleGifVC.view];
    
    [self addChildViewController:self.strategyVC];
    [self addChildViewController:self.singleGifVC];
    
}


#pragma mark - 懒加载
//标题
- (ClassifyTitleView *)titleView{
    if (_titleView == nil) {
        _titleView = [[ClassifyTitleView alloc] initWithFrame:CGRectMake(0, 0, 120, 44)];
        _titleView.delegate = self;
    }
    return _titleView;
}

//搜索栏
- (UISearchBar *)searchBar{
    if (_searchBar == nil) {
        _searchBar = [UISearchBar init_searchGifdelegate:self
                                         backgroundColor:[UIColor colorWithWhite:0 alpha:0.05]
                                         backgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
        _searchBar.frame = CGRectMake(0, 0, KScreenWidth, 44.0);
    }
    return _searchBar;
}

//scrollView
- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        
        CGFloat height = self.view.yzHeight - self.searchBar.yzHeight - 49.0;
        _scrollView.frame = CGRectMake(0, self.searchBar.yzBottom, KScreenWidth, height);
        _scrollView.contentSize = CGSizeMake(KScreenWidth *2.0, height);
        
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = false;
        _scrollView.pagingEnabled = true;
    }
    return _scrollView;
}

//攻略
- (StrategyViewController *)strategyVC{
    if (_strategyVC == nil) {
        _strategyVC = [[StrategyViewController alloc] init];
    }
    return _strategyVC;
}

//单品
- (SingleGifViewController *)singleGifVC{
    if (_singleGifVC == nil) {
        _singleGifVC = [[SingleGifViewController alloc] init];
    }
    return _singleGifVC;
}


#pragma mark - ClassifyTitleViewDelegate
//标题 选择 代理 0 1
- (void)selectedOptionAtIndex:(NSInteger)index{
    self.scrollView.contentOffset = CGPointMake(KScreenWidth *index, 0);
}

#pragma mark - UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"跳转到搜索");
    //navigationController?.pushViewController(SearchViewController(), animated: true)
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    /// 更改选礼神器按钮alpha 0或1
    self.navigationItem.rightBarButtonItem.customView.alpha = self.scrollView.contentOffset.x / self.scrollView.bounds.size.width;
    /// 更改titleView底部线条x
    [self.titleView scrollLine:self.scrollView.bounds.size.width
                       offsetX:self.scrollView.contentOffset.x];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
