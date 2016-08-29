//
//  ChannelListViewController.m
//  MSJ
//
//  Created by 张凯 on 16/7/16.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "ChannelListViewController.h"
#import "BaseTableView.h"
#import "ChannelItemModel.h"
#import "UIImageView+AFNetworking.h"
#import "channelItemCell.h"
#import "AdCell.h"
#import "CellDetailViewController.h"
#import "BannerModel.h"
#import "SecondBannerModel.h"
#import "YCRefreshControl.h"    // 刷新
#import "DEFINE.h"
#import "NetManager.h"


@interface ChannelListViewController ()<UITableViewDataSource, UITableViewDelegate, ADCellDelegate>{
    NSInteger _currentpage; ////记录当前的页数
    BOOL _isUp; // 记录上拉／下拉？  YES：上拉    NO:下拉
}
//AD 广告 仅首页面有
@property(nonatomic, strong) NSMutableArray * bannerArr; //AD广告
@property(nonatomic, strong) NSMutableArray * secBannerArr; //AD广告2

@property(nonatomic, strong) NSMutableArray * dataArrary; //cell数据源
@property(nonatomic, strong) UITableView * tableView;

@end


@implementation ChannelListViewController


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArrary = [[NSMutableArray alloc] init];
    _currentpage = 0;
    
    [self initUI];
    
    if (self.type == 100) { // 仅仅首页 精选  有AD轮播
        _bannerArr = [[NSMutableArray alloc] init];
        _secBannerArr = [[NSMutableArray alloc] init];
        [self downloadData_Banner];
        [self downloadData_secBanner];
    }
   
//    [self downloadData];
}

- (void)initUI{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, KScreenWidth, KScreenHeight-64-40-44) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource =self;
    
    _tableView.separatorStyle =UITableViewCellSeparatorStyleNone; //隐藏cell底部线条
    
    _tableView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_tableView];
    
    // 添加上拉，下拉刷新视图
    [self addHeaderAndFooterRefresh];
}

-(void)addHeaderAndFooterRefresh{
    // 上拉 footer
    [_tableView yc_setLoadmoreAction:^{
        // 触发上拉刷新之后，执行的内容
        _currentpage +=20;
        _isUp = YES;
        
        [self downloadData];
    }];
    
    // 下拉  header
    [_tableView yc_setRefreshAction:^{
        _currentpage = 0;
        _isUp = NO;
        
        //
        [self downloadData];
        if (self.type == 100) {
            [self downloadData_Banner];
            [self downloadData_secBanner];
        }
    }];
    [_tableView yc_beginRefresh];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
     if ( _type == 100) { // 仅仅首页 精选  有AD轮播
         return self.dataArrary.count +1;
     }
    
    return self.dataArrary.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //精选的 cell第0行
    if (_type == 100 && indexPath.row  == 0) {
        AdCell *adCell = [[AdCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        adCell.bannerArr = self.bannerArr;
        adCell.secBannerArr = self.secBannerArr;
        
//        NSLog(@"%ld, %ld", self.bannerArr.count, self.secBannerArr.count);
        adCell.delegate =self;
        
        adCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return adCell;
    }
    
    static NSString *cellIdentifer = @"cellIdentifer";
    ChannelItemCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (!cell) {
        cell = [[ChannelItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    
    //精选
    if (_type == 100 ) {
        ChannelItemModel * itemModel = self.dataArrary[indexPath.row-1];
        cell.model = itemModel;
    }
    else if(_type == 10){
        
        if (indexPath.row >= 18) {
            ChannelItemModel * itemModel = self.dataArrary[indexPath.row];
            cell.model = itemModel;
        }
        else{
            ChannelItemModel * itemModel = self.dataArrary[indexPath.row];
            cell.model = itemModel;
        }
        
    }
    else{ //非精选
        ChannelItemModel * itemModel = self.dataArrary[indexPath.row];
        cell.model = itemModel;
    }
    
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_type == 100 && indexPath.row  == 0) {
        return 245; //
    }
    
    ChannelItemCell *cell = (ChannelItemCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return [cell cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    ChannelItemModel * itemModel;
    if (_type == 100) {
        if(indexPath.row  == 0){ return ;} //精选的 cell0行
        
        itemModel = self.dataArrary[indexPath.row-1];
    }else{
        itemModel = self.dataArrary[indexPath.row];
    }
    
    CellDetailViewController *cellDetailVC = [[CellDetailViewController alloc] init];
    cellDetailVC.urlStr = itemModel.url;
    
    [self.navigationController pushViewController:cellDetailVC animated:YES];
}


#pragma mark - AdCellDelegate
- (void)didSelectAdCellWithId:(NSString *)urlStr{
    CellDetailViewController *cellDetailVC = [[CellDetailViewController alloc] init];
    cellDetailVC.urlStr = urlStr;
    
    [self.navigationController pushViewController:cellDetailVC animated:YES];
}


#pragma mark -  下载数据
- (void)downloadData{
    NSString *urlStr = [NSString stringWithFormat:URL_channel_type,self.type, _currentpage];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NetManager GET:urlStr parameters:nil success:^(id responseObject) {
            
            //解析：responseObject
            [self parseData:responseObject];
        } failure:^(NSError *error) {
            NSLog(@"error: %@", error.description);
        }];
    });
}

- (void)parseData:(NSData *)data{
    // 编辑判断， 容错处理
    if(!data){ return;}
    
     //下拉刷新 需要清空数据
    if(!_isUp){
        [_dataArrary removeAllObjects];
    }
    
    NSDictionary *root  = [NSJSONSerialization JSONObjectWithData:data
                                                          options:NSJSONReadingMutableContainers
                                                            error:nil];
    NSString *code = root[@"code"];
    if ([code integerValue] == 200) {
        NSArray *dicArr = root[@"data"][@"items"];
        
        for (NSDictionary *dic in dicArr){
            ChannelItemModel *model = [[ChannelItemModel alloc] initWithDataDic:dic];
            [_dataArrary addObject:model];
        }
        
        //是否需要在主线程刷新呢？
        [_tableView reloadData];
        
        // 结束刷新动作
        [_tableView yc_endLoadmore];
        [_tableView yc_endRefresh];
    } else{
        NSLog(@"数据获取失败");
    }
    
}


#pragma mark - 首页滚动动画数据
- (void)downloadData_Banner{
    [NetManager GET:URL_channels_banners
         parameters:nil
            success:^(id responseObject) {
                [self parseData_Banner:responseObject];
            } failure:^(NSError *error) {
                NSLog(@"%s, %@",__func__, error.description);
            }];
}

- (void)parseData_Banner:(NSData *)data{
    // 编辑判断， 容错处理
    if(!data){ return;}
    
    //下拉刷新 需要清空数据
    if(!_isUp){
        [_bannerArr removeAllObjects];
    }
    
    NSDictionary *root  = [NSJSONSerialization JSONObjectWithData:data
                                                          options:NSJSONReadingMutableContainers
                                                            error:nil];
    NSString *code = root[@"code"];
    if ([code integerValue] == 200) {
        NSArray *dicArr = root[@"data"][@"banners"];
        
        for (NSDictionary *dic in dicArr){
            BannerModel *model = [[BannerModel alloc] initWithDataDic:dic];
            [_bannerArr addObject:model];
        }
       
        [self.tableView reloadData];
    }
    else{
        NSLog(@"数据获取失败");
    }
}

- (void)downloadData_secBanner{
    [NetManager GET:URL_channels_secondary_banners
         parameters:nil
            success:^(id responseObject) {
                [self parseData_SecBanner:responseObject];
            } failure:^(NSError *error) {
                NSLog(@"%s, %@",__func__, error.description);
            }];
}

- (void)parseData_SecBanner:(NSData *)data{
    // 编辑判断， 容错处理
    if(!data){ return;}
    
    //下拉刷新 需要清空数据
    if(!_isUp){
        [_secBannerArr removeAllObjects];
    }
    
    NSDictionary *root  = [NSJSONSerialization JSONObjectWithData:data
                                                          options:NSJSONReadingMutableContainers
                                                            error:nil];
    NSString *code = root[@"code"];
    if ([code integerValue] == 200) {
        NSArray *dicArr = root[@"data"][@"secondary_banners"];
        
        for (NSDictionary *dic in dicArr){
            SecondBannerModel *model = [[SecondBannerModel alloc] initWithDataDic:dic];
            [_secBannerArr addObject:model];
        }
        
        [self.tableView reloadData];
    }
    else{
        NSLog(@"数据获取失败");
    }
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 
 switch (self.type) {
 case 100: //精选 0
 urlStr = [NSString stringWithFormat:@""];
 break;
 case 129: //海淘 1
 urlStr = [NSString stringWithFormat:@""];
 break;
 case 125: //创意生活 2
 urlStr = [NSString stringWithFormat:@""];
 break;
 case 10: //送女票 3
 urlStr = [NSString stringWithFormat:@""];
 break;
 case 28: //科技苑 4
 urlStr = [NSString stringWithFormat:@""];
 break;
 case 6: //送爸妈 5
 urlStr = [NSString stringWithFormat:@""];
 break;
 case 26: //送基友 6
 urlStr = [NSString stringWithFormat:@""];
 break;
 case 5: //送闺蜜 7
 urlStr = [NSString stringWithFormat:@""];
 break;
 case 17: //送同事 8
 urlStr = [NSString stringWithFormat:@""];
 break;
 case 24: //送宝贝 9
 urlStr = [NSString stringWithFormat:@""];
 break;
 case 127: //设计感 10
 urlStr = [NSString stringWithFormat:@""];
 break;
 case 14: //文艺风 11
 urlStr = [NSString stringWithFormat:@""];
 break;
 case 126: //奇葩搞怪 12
 urlStr = [NSString stringWithFormat:@""];
 break;
 case 11: //萌萌哒 13
 urlStr = [NSString stringWithFormat:@""];
 break;
 
 default :
 break;
 }
 
 */


@end
