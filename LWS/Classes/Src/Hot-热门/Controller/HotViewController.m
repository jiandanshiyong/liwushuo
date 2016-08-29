//
//  HotViewController.m
//  LWS
//
//  Created by 张凯 on 16/7/16.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "HotViewController.h"
#import "DEFINE.h"
#import "UIBarButtonItem+extension.h"

#import "GoodModel.h"
#import "NetManager.h"
#import "Refresh.h"


@interface HotViewController ()
@end

@implementation HotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"热门";
    self.view.backgroundColor = Color_GlobalBackground;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem init_SearchTarget:self action:@selector(searchBtnAction)];
    
    [self setupRefresh]; //刷新
    
    self.arrayDS = [NSMutableArray new];
    [self downloadData];
}

#pragma mark - Refresh

- (void)setupRefresh{
    UIView *header = [Refresh headerWithRefreshingTarget:self refreshingAction:@selector(pullDownLoadData)];
    self.collectionView.mj_header = header;
}

- (void)pullDownLoadData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collectionView.mj_header endRefreshing];
    });
}


#pragma mark -  right navBarAction
- (void)searchBtnAction{
    //    navigationController.pushViewController(SearchViewController(), animated: true)
    NSLog(@"跳转到搜索页面");
}


#pragma mark - 下载数据
- (void)downloadData{    
    dispatch_async(QUEUE_async, ^{
        [NetManager GET:URL_Hot
             parameters:nil
                success:^(id responseObject) {
                    [self parserData:responseObject];
                } failure:^(NSError *error) {
                    NSLog(@"%s, %@",__func__, error.description);
                }];
    });
}

- (void)parserData:(NSData *)data{
    // 编辑判断， 容错处理
    if(!data){ return;}
    
    NSDictionary *root  = [NSJSONSerialization JSONObjectWithData:data
                                                          options:NSJSONReadingMutableContainers
                                                            error:nil];
    NSString *code = root[@"code"];
    if ([code integerValue] == 200) {
        NSArray *dicArr = root[@"data"][@"items"];
        
        for (NSDictionary *dic in dicArr){
            GoodModel *model = [[GoodModel alloc] initWithDataDic:dic[@"data"]];
            [self.arrayDS addObject:model];
        }
        
        [self.collectionView reloadData];
   } else{
        NSLog(@"数据获取失败");
    }
}


@end
