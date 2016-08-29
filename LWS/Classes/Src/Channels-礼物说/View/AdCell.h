//
//  AdCell.h
//  LWS
//
//  Created by 张凯 on 16/7/18.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ADCellDelegate <NSObject>

- (void)didSelectAdCellWithId:(NSString *)urlStr;

@end

@interface AdCell : UITableViewCell

//AD 广告 仅首页面有
@property(nonatomic, strong) NSMutableArray * bannerArr; //AD广告
@property(nonatomic, strong) NSMutableArray * secBannerArr; //AD广告2

// _delegate = newsListVC
@property(nonatomic, weak) id<ADCellDelegate> delegate;

@end
