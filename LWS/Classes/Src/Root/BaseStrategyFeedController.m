//
//  BaseStrategyFeedController.m
//  LWS
//
//  Created by 张凯 on 16/8/13.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "BaseStrategyFeedController.h"
#import "BaseStrategyCell.h"
#import "DEFINE.h"


@interface BaseStrategyFeedController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation BaseStrategyFeedController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}


#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseStrategyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BaseStrategyCell"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 250;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSLog(@"cell 进入详细");
}


#pragma mark - 懒加载
- (UITableView *)tableView{
    if (_tableView == nil) {
        
        CGFloat height = KScreenHeight- 64 - 44 -49.0;
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, height) style:UITableViewStylePlain];
        _tableView.backgroundColor = Color_GlobalBackground;
        _tableView.showsHorizontalScrollIndicator = false;
        _tableView.showsVerticalScrollIndicator = false;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.sectionFooterHeight = 0.0001;
        _tableView.sectionHeaderHeight = 0.0001;
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerNib: [UINib nibWithNibName:@"BaseStrategyCell" bundle:nil]forCellReuseIdentifier:@"BaseStrategyCell"];
    }
    return _tableView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
