//
//  ChannelItemCell.h
//  LWS
//
//  Created by 张凯 on 16/7/16.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChannelItemModel.h"

@interface ChannelItemCell : UITableViewCell

@property(nonatomic, strong) ChannelItemModel * model;

- (CGFloat)cellHeight;


@end
