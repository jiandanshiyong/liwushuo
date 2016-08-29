//
//  ColumnListHeader.m
//  LWS
//
//  Created by 张凯 on 16/8/19.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "ColumnListHeader.h"

@implementation ColumnListHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       self = [[NSBundle mainBundle] loadNibNamed:@"ColumnListHeader" owner:nil options:nil].lastObject;
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
   
    self.photoImageView.clipsToBounds = true;
    self.photoImageView.contentMode =  UIViewContentModeScaleAspectFill;
//    photoImageView.image = UIImage(named: "strategy_\(Int(arc4random() % 17) + 1).jpg")
}

@end
