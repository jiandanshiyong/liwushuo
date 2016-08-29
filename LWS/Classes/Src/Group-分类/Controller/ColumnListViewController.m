//
//  ColumnListViewController.m
//  LWS
//
//  Created by 张凯 on 16/8/19.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "ColumnListViewController.h"
#import "DEFINE.h"
#import "ColumnListHeader.h"
#import "UIButton+extension.h"
#import "ColumnListCell.h"


#define showImageHeight 150.0/// 顶部封面图高度

@interface ColumnListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView * tableView;
@property(nonatomic, strong) ColumnListHeader * tableViewHeader;

@property(nonatomic, strong) UIView * navbarView;

@end

@implementation ColumnListViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupUI];
}

- (void)setupUI{
    self.automaticallyAdjustsScrollViewInsets = false;
    [self.view addSubview:self.tableView];
    [self customNavbar]; //后加 否则会被tableView挡住
}

/// 导航栏
- (void)customNavbar{
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLab.text = @"不打烊的礼物店";
    titleLab.textColor = [UIColor whiteColor];
    titleLab.font = [UIFont systemFontOfSize:17.0];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [titleLab sizeToFit];
    titleLab.yzCenterX = self.navbarView.yzCenterX;
    titleLab.yzCenterY = self.navbarView.yzCenterY+5.0;
    
    UIButton *backBtn = [UIButton init_BackTarget:self action:@selector(backBtnAction)];
    backBtn.frame = CGRectMake(10.0, 15.0, 44, 44);
    
    [self.navbarView addSubview:titleLab];
    [self.view addSubview:self.navbarView];
    [self.view addSubview:backBtn];
}

- (void)backBtnAction{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ColumnListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ColumnListCell"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"cell点击");
//      navigationController?.pushViewController(CommonFetureViewController(), animated: true)
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 93.0;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, KScreenWidth, 39)];
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"   列表";
    [label setTextColor:UICOLOR_RGB(170, 170, 170, 1.0)];
    [label setFont:[UIFont systemFontOfSize:15.0]];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 50)];
    bgView.backgroundColor = UICOLOR_RGB(240, 240, 240, 1.0);
    [bgView addSubview:label];
    
    return  bgView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}



#pragma mark - UIScrollViewDelegate
//拖动narbarView显示
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    self.navbarView.alpha = offsetY / (showImageHeight - self.navbarView.yzHeight);
}


#pragma mark - 懒加载
//导航栏
- (UIView *)navbarView{
    if (_navbarView == nil) {
        _navbarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 64.0)];
        _navbarView.backgroundColor = Color_NavBackground;
        _navbarView.alpha = 0.0;
    }
    return _navbarView;
}

//表格
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.backgroundColor = Color_GlobalBackground;
        _tableView.showsHorizontalScrollIndicator = false;
        _tableView.showsVerticalScrollIndicator = false;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.sectionFooterHeight = 0.0001;
        _tableView.sectionHeaderHeight = 0.0001;
        
        
        [_tableView registerNib:[UINib nibWithNibName:@"ColumnListCell" bundle:nil] forCellReuseIdentifier:@"ColumnListCell"];
        _tableView.tableHeaderView = self.tableViewHeader;
    }
    return _tableView;
}

//表头
- (ColumnListHeader *)tableViewHeader{
    if (_tableViewHeader == nil) {
        _tableViewHeader = [[ColumnListHeader alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 250.0)];
    }
    return _tableViewHeader;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
