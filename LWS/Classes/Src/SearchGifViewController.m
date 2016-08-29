//
//  SearchGifViewController.m
//  LWS
//
//  Created by 张凯 on 16/8/21.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "SearchGifViewController.h"
#import "UIButton+extension.h"
#import "DEFINE.h"
#import "PopoverSortGifView.h"
#import "PopoverSortView.h"

@interface SearchGifViewController ()

@property(nonatomic, strong) UIButton * rightBtn;

@property(nonatomic, strong) PopoverSortGifView * popoverSortGifView;
@property(nonatomic, strong) PopoverSortView * popoverSortView;


@end

@implementation SearchGifViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupUI];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    [self setupUIFrame];
}

- (void)setupUI{
    self.title= @"选礼神器";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    self.view.backgroundColor = Color_GlobalBackground;
    [self.view addSubview:self.popoverSortGifView];
    [self.view addSubview:self.popoverSortView];
}

- (void)setupUIFrame{
    CGFloat height = 44.0;
    self.popoverSortGifView.frame = CGRectMake(0, 0, self.view.yzWidth, height);
    self.collectionView.yzTop= height;
    self.collectionView.yzHeight = self.view.yzHeight - height;
}


#pragma mark - action

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

- (UIButton *)rightBtn{
    if (_rightBtn == nil) {
        _rightBtn = [UIButton init_SortTarget:self action:@selector(rightBtnAction)];
    }
    return _rightBtn;
}

- (PopoverSortGifView *)popoverSortGifView{
    if (_popoverSortGifView == nil) {
        _popoverSortGifView= [PopoverSortGifView popoverSortGifView];
        
    }
    return _popoverSortGifView;
}


- (PopoverSortView *)popoverSortView{
    if (_popoverSortView == nil) {
        _popoverSortView = [[PopoverSortView alloc] initWithFrame:CGRectMake(KScreenWidth - 155, 0, 155, 190)];
    }
    return _popoverSortView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
