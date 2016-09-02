//
//  MeViewController.m
//  LWS
//
//  Created by 张凯 on 16/7/16.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "MeViewController.h"
#import "UIButton+extension.h"
#import "DEFINE.h"
#import "MeHeaderView.h"
#import "MeFooterView.h"

@interface MeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UIView * leftBarView;
@property(nonatomic, strong) UIView * rightBarView;

@property(nonatomic, strong) MeHeaderView * headerView;
@property(nonatomic, strong) MeFooterView * footerView;
@property(nonatomic, strong) UIView * sectionView;

@property(nonatomic, strong) UITableView * tableView;


@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    [self hideNavigationBar:false];
    
    [self setupBarView];
    [self setupTableView];
}


//隐藏或显示导航条
- (void)hideNavigationBar:(BOOL)showBgImage{
    self.automaticallyAdjustsScrollViewInsets = false;
    self.navigationController.navigationBar.translucent = true;
    
    UIImage *image = (showBgImage ? [UIImage imageNamed:@"me_profilebackground"] : [[UIImage alloc] init]);
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage= [[UIImage alloc] init];
}

//布局导航栏按钮
- (void)setupBarView{
    UIButton *mailButton =[UIButton init_ButtonWithX:0 iconName:@"me_message" target:self action:@selector(mailBtnAction) imageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
     UIButton *alarmclockButton =[UIButton init_ButtonWithX:44 iconName:@"me_giftremind" target:self action:@selector(alarmclockBtnAction) imageEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
    [self.leftBarView addSubview: mailButton];
    [self.leftBarView addSubview: alarmclockButton];
    
     UIButton *qrcodeButton =[UIButton init_ButtonWithX:0 iconName:@"me_scan" target:self action:@selector(qrcodeBtnAction) imageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -20)];
     UIButton *settingButton =[UIButton init_ButtonWithX:44 iconName:@"iconSettings" target:self action:@selector(settingBtnAction) imageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -20)];
    [self.rightBarView addSubview: qrcodeButton];
    [self.rightBarView addSubview: settingButton];
    

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftBarView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBarView];
}

//布局tableview
- (void)setupTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style: UITableViewStyleGrouped];
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator  = NO;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = Color_GlobalBackground;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 0;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIndentifier"];
    [self.view addSubview: self.tableView];
    
    // tableview头部
    self.tableView.tableHeaderView = self.headerView;
    // tableview底部
    self.tableView.tableFooterView = self.footerView;
}


#pragma mark - action

- (void)mailBtnAction{
    NSLog(@"mail");
}

- (void)alarmclockBtnAction{
    NSLog(@"alarmclock");
}

- (void)qrcodeBtnAction{
    NSLog(@"qrcode");
}

- (void)settingBtnAction{
    NSLog(@"setting");
}



#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIndentifier"];
    cell.textLabel.text = @"test";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0 ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.sectionView;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;{
    // 处理背景图片拉伸效果
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 0){
        return ;
    }
    
    CGFloat upFactor = 0.6;
    if (offsetY >= 0.0) {
        self.headerView.bgimageView.transform = CGAffineTransformMakeTranslation(0, offsetY * upFactor);
        
    } else {
        CGAffineTransform transform = CGAffineTransformMakeTranslation(0, offsetY);
        CGFloat s = 1 + -offsetY * 0.01;
        self.headerView.bgimageView.transform = CGAffineTransformScale(transform, 1, s);
    }

}



#pragma mark - 懒加载
- (UIView *)leftBarView{
    if (_leftBarView == nil) {
        _leftBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 88, 44)];
    }
    return _leftBarView;
}

- (UIView *)rightBarView{
    if (_rightBarView == nil) {
        _rightBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 88, 44)];
    }
    return _rightBarView;
}

- (MeHeaderView *)headerView{
    if (_headerView == nil) {
        _headerView = [[MeHeaderView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 214 + 70)];
    }
    return _headerView;
}

- (MeFooterView *)footerView{
    if (_footerView == nil) {
        _footerView = [[MeFooterView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 300)];
    }
    return _footerView;
}

- (UIView *)sectionView{
    if (_sectionView == nil) {
        _sectionView = [[NSBundle mainBundle] loadNibNamed:@"MeSectionView" owner:nil options:nil].lastObject;
        
        _sectionView.frame = CGRectMake(0, 0, self.tableView.yzWidth, 60);
    }
    return _sectionView;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
