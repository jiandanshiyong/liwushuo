//
//  BaseGoodsFeedViewController.h
//  LWS
//
//  Created by 张凯 on 16/8/13.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseGoodsFeedViewController : BaseViewController

@property(nonatomic, strong) UICollectionView * collectionView; //网格列表

@property(nonatomic, strong) NSMutableArray * arrayDS; //数据源


@end
