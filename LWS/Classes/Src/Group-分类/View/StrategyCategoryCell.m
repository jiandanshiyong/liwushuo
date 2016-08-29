//
//  StrategyCategoryCell.m
//  LWS
//
//  Created by 张凯 on 16/8/18.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "StrategyCategoryCell.h"

@implementation StrategyCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.photoImageView.clipsToBounds = true;
    self.photoImageView.contentMode =  UIViewContentModeScaleAspectFill;
//    photoImageView.image = UIImage(named: "strategy_\(Int(arc4random() % 17) + 1).jpg")
}

@end
