//
//  HotDetailViewController.m
//  LWS
//
//  Created by 张凯 on 16/8/1.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "HotDetailViewController.h"
#import "LeftViewController.h"
#import "CenterViewController.h"
#import "RightViewController.h"
#import "DEFINE.h"
#import "CustomSegment.h"
#import "NetManager.h"


@interface HotDetailViewController ()<UIScrollViewDelegate>
@property (nonatomic , strong)UIScrollView *scView ;
@property (nonatomic , strong) LeftViewController *leftVC ;
@property  (nonatomic, strong) CenterViewController * centerVC;
@property (nonatomic , strong) RightViewController *rightVC ;

@end

@implementation HotDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    1.单品 2.详细  3.评论
    [self initNavTitle:@[@"单品", @"详细", @"评论"] leftImg:@"string" rightImg:nil bgColor:nil];
    
    // 背景色
    self.scView.backgroundColor = [UIColor colorWithRed:0.93 green:0.94 blue:0.94 alpha:1] ;
    
    self.leftVC.view.backgroundColor    = [UIColor magentaColor];
    self.centerVC.view.backgroundColor  = [UIColor greenColor];
    self.rightVC.view.backgroundColor   = [UIColor cyanColor];
    
        
    [self downloadData];
}

- (void)leftAction{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - segment切换VC
// base中的属性，通过重写setter方法 overload
-(void)setSegment_index:(NSInteger)segment_index{
    [self.scView setContentOffset:CGPointMake(KScreenWidth*segment_index, 0) animated:YES] ;
}


#pragma mark - UIScrollViewDelegate
//滑动减速停止时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger page = _scView.contentOffset.x/KScreenWidth;
    
    self.mySeg.selectedPage = page;
}


#pragma mark - 下载数据
- (void)downloadData{
    NSString *urlStr = [NSString stringWithFormat: URL_Hot_detail, self.goodsId];
    
    dispatch_async(QUEUE_async, ^{
        [NetManager GET:urlStr
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
//        NSArray *dicArr = root[@"data"][@"items"];
//        
//        for (NSDictionary *dic in dicArr){
//            
//            GoodModel *model = [[GoodModel alloc] initWithDataDic:dic[@"data"]];
//            [_arrayDS addObject:model];
//        }
//        
//        [_collectionView reloadData];
    } else{
        NSLog(@"数据获取失败");
    }
}




#pragma mark - 懒加载

- (UIScrollView *)scView{
    if (_scView == nil) {
        CGFloat hhh = KScreenHeight-64 ;
        _scView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth,  hhh )];
        _scView.pagingEnabled = YES;
        _scView.bounces = NO;
        _scView.showsHorizontalScrollIndicator = NO;
        _scView.delegate =self;
        
        _scView.contentSize = CGSizeMake(KScreenWidth*3, hhh) ;
        [self.view addSubview:_scView];
    }
    return _scView ;
}

- (LeftViewController *)leftVC{
    if (_leftVC == nil) {
        _leftVC = [[LeftViewController alloc] init];
        
        _leftVC.view.frame = CGRectMake(0, 0, KScreenWidth,self.scView.yzHeight ) ;
        [self.scView addSubview:_leftVC.view];
        [self addChildViewController:_leftVC];
    }
    return _leftVC ;
}

- (CenterViewController *)centerVC{
    if (_centerVC == nil) {
        _centerVC = [[CenterViewController alloc] init];
        _centerVC.view.frame = CGRectMake(KScreenWidth , 0, KScreenWidth,self.scView.yzHeight ) ;
        [self.scView addSubview:_centerVC.view];
        [self addChildViewController:_centerVC];
    }
    return _centerVC;
}

- (RightViewController *)rightVC{
    if (_rightVC == nil) {
        _rightVC = [[RightViewController alloc] init];
        _rightVC.view.frame = CGRectMake(KScreenWidth*2 , 0, KScreenWidth,self.scView.yzHeight ) ;
        [self.scView addSubview:_rightVC.view];
        [self addChildViewController:_rightVC];
    }
    return _rightVC ;
}




@end
