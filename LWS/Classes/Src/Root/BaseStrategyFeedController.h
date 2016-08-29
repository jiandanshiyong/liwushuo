//
//  BaseStrategyFeedController.h
//  LWS
//
//  Created by 张凯 on 16/8/13.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseStrategyFeedController : BaseViewController

@property(nonatomic, strong) UITableView * tableView;

@property(nonatomic, assign) NSInteger type; //分类ID

@end
