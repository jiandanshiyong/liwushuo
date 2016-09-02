//
//  ButtonTitleDown.m
//  LWS
//
//  Created by 张凯 on 16/8/31.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "ButtonTitleDown.h"

@implementation ButtonTitleDown

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat margin = 2.0;
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    
    CGFloat imageH = self.imageView.frame.size.height;
    CGFloat imageW = self.imageView.frame.size.width;
    CGFloat titleH = self.titleLabel.frame.size.height;
    CGFloat titleW = self.titleLabel.frame.size.width;
    CGFloat contentMargin = (height - imageH - titleH - margin)/2;
    
    /*
     CGRect newFrame = self.frame;
     newFrame.origin.y = yzCenterY - newFrame.size.height/2 ;
     self.frame = newFrame;
     */
    
    CGRect newImg_Frame= self.imageView.frame;
    newImg_Frame.origin.y = contentMargin;
    newImg_Frame.origin.x = (width - imageW ) / 2;
    self.imageView.frame = newImg_Frame;
    
    CGRect newLab_Frame = self.titleLabel.frame;
    newLab_Frame.origin.y = CGRectGetMaxY(self.imageView.frame) + margin;
    newLab_Frame.origin.x = (width - titleW) /2;
    self.titleLabel.frame = newLab_Frame;
    
}

@end
