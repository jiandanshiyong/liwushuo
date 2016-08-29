//
//  SingleGifCell.m
//  LWS
//
//  Created by 张凯 on 16/8/17.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "SingleGifCell.h"

@implementation SingleGifCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.photoImageView.layer.masksToBounds = true;
    self.photoImageView.contentMode = UIViewContentModeScaleAspectFill;
}

@end
