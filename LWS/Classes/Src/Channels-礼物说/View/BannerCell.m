//
//  BannerCell.m
//  LWS
//
//  Created by 张凯 on 16/8/13.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "BannerCell.h"


@implementation BannerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.photoImageView.clipsToBounds = true;
    self.photoImageView.contentMode =  UIViewContentModeScaleAspectFill;
    self.photoImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"strategy_%u.jpg", arc4random()%17+1]];
}

@end
