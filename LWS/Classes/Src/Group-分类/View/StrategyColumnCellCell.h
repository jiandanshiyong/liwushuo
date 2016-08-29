//
//  StrategyColumnCellCell.h
//  LWS
//
//  Created by 张凯 on 16/8/18.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StrategyColumnCellCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView; //图片
@property (strong, nonatomic) IBOutlet UILabel *topLabel;//标题
@property (strong, nonatomic) IBOutlet UILabel *middleLabel;//第几期
@property (strong, nonatomic) IBOutlet UILabel *bottomLabel;//作者

@property (strong, nonatomic) IBOutlet UIView *viewAllcoverView;//点击查看全部 背景遮罩
@property (strong, nonatomic) IBOutlet UIButton *viewAllBtn;//点击查看全部 按钮


@end
