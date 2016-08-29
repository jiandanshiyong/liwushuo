//
//  SearchViewController.m
//  LWS
//
//  Created by 张凯 on 16/8/20.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "SearchViewController.h"
#import "DEFINE.h"
#import "UISearchBar+extension.h"
#import "UIButton+extension.m"
#import "SearchGiftCell.h"
#import "SearchHeaderView.h"
#import "PopoverSortView.h"
#import "SearchResultViewController.h"
#import "SearchGifViewController.h"

@interface SearchViewController ()<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UISearchBar * searchBar; //搜索栏
@property(nonatomic, strong) UIButton * rightBtn; //右侧button
@property(nonatomic, strong) UIButton * leftBtn; //左侧button

@property(nonatomic, strong) UITableView * tableView;
@property(nonatomic, strong) SearchHeaderView * searchHeaderView;

@property(nonatomic, strong) PopoverSortView * popoverSortView;//排序pop

@end

@implementation SearchViewController



- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.searchBar becomeFirstResponder];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tagButtonAction) name:@"Notif_BtnAction_SearchTag" object:nil];
    
     /// 延时弹出键盘(否则键盘弹不出)
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self performSelector:@selector(searchBarBecomeFirstResponder) withObject:nil afterDelay:0.1];
    });
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Notif_BtnAction_SearchTag" object:nil];
    
    [self searchBarResignFirstResponder];
    [self.popoverSortView setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self searchBarResignFirstResponder];
}

- (void)setupUI{
    self.view.backgroundColor = Color_GlobalBackground;
    self.navigationItem.titleView = self.searchBar;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView: self.rightBtn];
    
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.popoverSortView]; //右侧排序视图
}

- (void)resetBarBtnSate{
    if (self.searchBar.isFirstResponder) {
         /// 弹出键盘
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
        [self.rightBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [self.rightBtn setTitle:@"取消" forState:UIControlStateNormal];
    } else{
        /// 隐藏键盘
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView: self.leftBtn];
        [self.rightBtn setImage:[UIImage imageNamed:@"icon_sort"] forState:UIControlStateNormal];
        [self.rightBtn setTitle:@"" forState:UIControlStateNormal];
    }
}


#pragma mark - action
//通知事件
- (void)tagButtonAction{
    [self searchBarResignFirstResponder];
    
    NSLog(@"跳转到搜索结果界面");
    SearchResultViewController * searchResult = [[SearchResultViewController alloc] init];
    [self.navigationController pushViewController:searchResult animated:YES];
}


// 搜索栏
- (void)searchBarBecomeFirstResponder{
    [self.searchBar becomeFirstResponder];
    [self resetBarBtnSate];
    [self.popoverSortView setHidden:YES]; //
}

- (void)searchBarResignFirstResponder{
    [self.searchBar resignFirstResponder];
    [self resetBarBtnSate];
}


//左右按钮
- (void)leftBtnAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBtnAction{
    if (self.searchBar.isFirstResponder) {
        [self searchBarResignFirstResponder];
    } else {
        if (self.popoverSortView.hidden){
            NSLog(@"弹出排序视图");
            [self.popoverSortView show];
        } else {
            NSLog(@"隐藏排序视图");
            [self.popoverSortView hide];
        }
    }
}


#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [self searchBarBecomeFirstResponder];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    [self searchBarResignFirstResponder];
}


#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchGiftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchGiftCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"跳转选礼神器");
    [self searchBarResignFirstResponder];

    SearchGifViewController * searchGifVC = [[SearchGifViewController alloc] init];
    [self.navigationController pushViewController:searchGifVC animated:YES];
}


#pragma mark - 懒加载

- (UISearchBar *)searchBar{
    if (_searchBar == nil) {
//        UIImage *bgImg = [[[UINavigationBar alloc] init] backgroundImageForBarMetrics:UIBarMetricsDefault];
        UIImage *bgImg = [UIImage imageWithColor:Color_NavBackground];
        
        _searchBar = [UISearchBar init_searchGifdelegate:self
                                         backgroundColor:[UIColor whiteColor]
                                         backgroundImage:bgImg];
        _searchBar.frame = CGRectMake(0, 0, KScreenWidth, 44.0);
    }
    return _searchBar;
}

- (UIButton *)rightBtn{
    if (_rightBtn == nil) {
        _rightBtn = [UIButton init_cancelTarget:self action:@selector(rightBtnAction)];
    }
    return _rightBtn;
}

- (UIButton *)leftBtn{
    if (_leftBtn == nil) {
        _leftBtn = [UIButton init_BackTarget:self action:@selector(leftBtnAction)];
    }
    return _leftBtn;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.backgroundColor = Color_GlobalBackground;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.sectionFooterHeight = 0.0001;
        _tableView.sectionHeaderHeight = 0.0001;
        
        [_tableView registerNib:[UINib nibWithNibName:@"SearchGiftCell" bundle:nil] forCellReuseIdentifier:@"SearchGiftCell"];
        _tableView.tableHeaderView = self.searchHeaderView;
    }
    return _tableView;
}

- (SearchHeaderView *)searchHeaderView{
    if (_searchHeaderView == nil) {
        _searchHeaderView = [[SearchHeaderView alloc] init];
        _searchHeaderView.frame = CGRectMake(0, 0, KScreenWidth, _searchHeaderView.getHeight);
        
    }
    return _searchHeaderView;
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
