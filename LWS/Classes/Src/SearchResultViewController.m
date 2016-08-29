//
//  SearchResultViewController.m
//  LWS
//
//  Created by 张凯 on 16/8/21.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "SearchResultViewController.h"
#import "DEFINE.h"
#import "UISearchBar+extension.h"
#import "UIButton+extension.h"

#import "CommonGoodsFeedViewController.h" //单品
#import "CommonStrategyViewController.h"  //攻略
#import "PopoverSortView.h"

@interface SearchResultViewController ()<UISearchBarDelegate>

@property(nonatomic, strong) UISearchBar * searchBar;
@property(nonatomic, strong) UIButton *leftBtn;
@property(nonatomic, strong) UIButton *rightBtn;

@property(nonatomic, strong) CommonGoodsFeedViewController * goodsVC;
@property(nonatomic, strong) CommonStrategyViewController * strategyVC;
@property(nonatomic, strong) PopoverSortView * popoverSortView;

@end

@implementation SearchResultViewController

- (void)loadView{
    [[NSBundle mainBundle] loadNibNamed:@"SearchResultViewController" owner:self options:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.popoverSortView hide];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self setupUIFrame];
}

- (void)setupUI{
    self.view.backgroundColor = Color_GlobalBackground;
    self.navigationItem.titleView = self.searchBar;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    
    [self addChildViewController:self.goodsVC];
    [self addChildViewController:self.strategyVC];
    [self.scrollView addSubview:self.goodsVC.view];
    [self.scrollView addSubview:self.strategyVC.view];
    [self.view addSubview: self.popoverSortView];
}

- (void)setupUIFrame{
    self.goodsVC.view.frame = CGRectMake(0, 0, self.scrollView.yzWidth, self.scrollView.yzHeight);
    self.strategyVC.view.frame = CGRectMake(self.scrollView.yzWidth, 0, self.scrollView.yzWidth, self.scrollView.yzHeight);
    self.scrollView.contentSize = CGSizeMake(self.scrollView.yzWidth * 2, 0);
}


#pragma mark - action

- (IBAction)singleBtnAction:(id)sender {
    [self resetRedlineView:YES];
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}

- (IBAction)strategyBtnAction:(id)sender {
    [self resetRedlineView:NO];
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.yzWidth, 0) animated:YES];
}

- (void)resetRedlineView:(BOOL)scrollToleft{
    self.redLineView.yzLeft = scrollToleft ? 0 : self.scrollView.yzWidth * 0.5;
}

- (void)leftBtnAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBtnAction{
    
    if (self.popoverSortView.hidden) {
        NSLog(@"弹出 刷选视图");
        [self.popoverSortView show];
    } else {
        NSLog(@"隐藏 刷选视图");
        [self.popoverSortView hide];
    }
}


#pragma mark - 懒加载
- (UISearchBar *)searchBar{
    if (_searchBar == nil) {
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.delegate = self;
        _searchBar.placeholder = @"快选一份礼物，送给亲爱的Ta吧";
        _searchBar.tintColor = [UIColor whiteColor];
        _searchBar.backgroundImage = [[[UINavigationBar alloc] init] backgroundImageForBarMetrics:UIBarMetricsDefault];
    }
    return _searchBar;
}

- (UIButton *)leftBtn{
    if (_leftBtn == nil) {
        _leftBtn =[UIButton init_BackTarget:self action:@selector(leftBtnAction)];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn{
    if (_rightBtn == nil) {
        _rightBtn = [UIButton init_SortTarget:self action:@selector(rightBtnAction)];
    }
    return _rightBtn;
}

- (CommonGoodsFeedViewController *)goodsVC{
    if (_goodsVC == nil) {
        _goodsVC = [[CommonGoodsFeedViewController alloc] init];
    }
    return _goodsVC;
}
                    
- (CommonStrategyViewController *)strategyVC{
    if (_strategyVC == nil) {
        _strategyVC = [[CommonStrategyViewController alloc] init];
    }
    return _strategyVC;
}

- (PopoverSortView *)popoverSortView{
    if (_popoverSortView == nil) {
        _popoverSortView = [[PopoverSortView alloc] initWithFrame:CGRectMake(KScreenWidth - 155, 0, 155, 190)];
    }
    return _popoverSortView;
}

#pragma mark -  UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self resetRedlineView:scrollView.contentOffset.x == 0.0 ? YES : NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
