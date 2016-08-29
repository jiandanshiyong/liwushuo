//
//  Refresh.m
//  LWS
//
//  Created by 张凯 on 16/8/15.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "Refresh.h"

@implementation Refresh

- (void)prepare{
    [super prepare];
    
    NSMutableArray *idleImages       = [[NSMutableArray alloc] init];
    NSMutableArray *pullingImages    = [[NSMutableArray alloc] init];
    NSMutableArray *refreshingImages = [[NSMutableArray alloc] init];

    for (int i=0; i<=10; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"loading_dragdown_%02d", i]];
        [idleImages addObject:img];
    }
    [pullingImages addObject:[UIImage imageNamed:@"loading_00"]];
    for (int i=0; i<=22; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"loading_%02d", i]];
        [refreshingImages addObject:img];
    }
    
    
     self.lastUpdatedTimeLabel.hidden = true;
     self.stateLabel.hidden = true;
    [self setImages:idleImages forState:MJRefreshStateIdle];
    [self setImages:pullingImages forState:MJRefreshStatePulling];
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
}

@end
