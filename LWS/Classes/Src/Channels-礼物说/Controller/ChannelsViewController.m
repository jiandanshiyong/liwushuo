//
//  ChannelsViewController.m
//  LWS
//
//  Created by 张凯 on 16/7/16.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "ChannelsViewController.h"
#import "NetManager.h"
#import "ChannelsModel.h"
#import "DEFINE.h"
#import "UIBarButtonItem+extension.h"
#import "PopoverCategoryView.h"
#import "CommonStrategyViewController.h"
#import "ChoiceStrategyViewController.h"
#import "SearchViewController.h"


@interface ChannelsViewController ()<UIScrollViewDelegate, PopoverCategoryViewDelegate>
@property(nonatomic, strong) NSMutableArray * channelArr;//导航数据

@property(nonatomic, strong) UIImageView * titleImageView; //navBar 中间logo
@property(nonatomic, strong) UIScrollView * scrollView;
@property(nonatomic, strong) PopoverCategoryView * popoverCategoryView; //顶部分类导航

@end

@implementation ChannelsViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem init_GifTarget:self action:@selector(gifBtnAction)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem init_SearchTarget:self action:@selector(searchBtnAction)];
    self.navigationItem.titleView = self.titleImageView;
    
    [self downloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  data
- (void)downloadData{
    [NetManager GET:URL_channels
         parameters:nil
            success:^(id responseObject) {
                [self parseData:responseObject];
            } failure:^(NSError *error) {
                NSLog(@"%s, %@",__func__, error.description);
            }];
}

- (void)parseData:(NSData *)data{
    // 编辑判断， 容错处理
    if(!data){ return;}
    
    NSDictionary *root  = [NSJSONSerialization JSONObjectWithData:data
                                                          options:NSJSONReadingMutableContainers
                                                            error:nil];
    NSString *code = root[@"code"];
    if ([code integerValue] == 200) {
        NSArray *dicArr = root[@"data"][@"channels"];
        
        self.channelArr = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in dicArr){
            ChannelsModel *model = [[ChannelsModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [_channelArr addObject:model];
        }
        
        [self setupUI];
    } else{
        NSLog(@"数据获取失败");
    }
}


#pragma mark - UI
//创建子视图
- (void)setupUI{
    self.view.backgroundColor = Color_GlobalBackground;
    [self.view addSubview:self.scrollView];;
    [self.view addSubview:self.popoverCategoryView]; //上方分类导航
    
    for(int i = 0; i<_channelArr.count; i++){
        ChannelsModel *model = _channelArr[i];
        
        BaseStrategyFeedController *VC = nil;
        if([model.myId integerValue] == 100){  // 仅仅首页 精选  有AD轮播
            VC = [[ChoiceStrategyViewController alloc] init];
        }else{
            VC = [[CommonStrategyViewController alloc] init];
        }
        
        VC.type = [model.myId integerValue];
        VC.view.frame = CGRectMake(self.scrollView.yzWidth*i, 0, self.scrollView.yzWidth, self.scrollView.yzHeight);
        
        [self addChildViewController:VC];
        [self.scrollView addSubview: VC.view];
    }
    
    self.scrollView.contentSize = CGSizeMake(_channelArr.count * kScreenWidth, 0);
}


#pragma mark - left right navBar action
- (void)gifBtnAction{
//    NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
    NSLog(@"登陆通知");
}

- (void)searchBtnAction{
    NSLog(@"跳转到搜索页面");
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    [self.navigationController pushViewController: searchVC animated:YES];
}


#pragma mark - 懒加载
- (UIImageView *)titleImageView{
    if (_titleImageView == nil) {
        UIImage *image = [UIImage imageNamed:@"logo"];
        _titleImageView = [[UIImageView alloc] initWithImage:image];
        _titleImageView.contentMode = UIViewContentModeScaleAspectFit;
        _titleImageView.bounds= CustomRectMake(0, 0, (image.size.width / image.size.height), 20.0);
    }
    return _titleImageView;
}

- (UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        
        CGFloat height = KScreenHeight- 64 - self.popoverCategoryView.yzHeight -49.0;
        _scrollView.frame =CGRectMake(0, self.popoverCategoryView.yzBottom, kScreenWidth, height);
    }
    return _scrollView;
}

- (PopoverCategoryView *)popoverCategoryView{
    if (_popoverCategoryView == nil) {
        _popoverCategoryView = [[PopoverCategoryView alloc] initWithFrame: CGRectMake(0, 0, kScreenWidth, 44.0)];
        _popoverCategoryView.delegate = self;
        _popoverCategoryView.categoryArr = _channelArr; //导航数据传递
    }
    return _popoverCategoryView;
}


#pragma mark - UIScrollViewDelegate
//拖动ScrollView，标签跟着移动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / kScreenWidth;
    [self.popoverCategoryView scrollCategoryBtnByIndex:index];
}

#pragma mark - PopoverCategoryViewDelegate
//点击标签，ScrollView移动
- (void)selectedCategoryEndWithIndex:(NSInteger)index{
    CGFloat xxx = index * self.scrollView.yzWidth;
    self.scrollView.contentOffset = CGPointMake(xxx, 0);
}


@end
