//
//  SingleGifColumnCell.m
//  LWS
//
//  Created by 张凯 on 16/8/17.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "SingleGifColumnCell.h"
#import "DEFINE.h"

@implementation SingleGifColumnCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.edgeLineView.hidden = true;
    [self.titleBtn setTitleColor:UICOLOR_RGB(102, 102, 102, 1.0) forState:UIControlStateNormal];
    [self.titleBtn setTitleColor:UICOLOR_RGB(251, 45, 71, 1.0) forState:UIControlStateSelected];
    
    [self.titleBtn setBackgroundImage:[UIImage imageWithColor:Color_GlobalBackground] forState:UIControlStateNormal];
    [self.titleBtn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateSelected];
}

- (void)changeStatus:(BOOL)selected {
    self.titleBtn.selected = selected;
    self.edgeLineView.hidden = !selected;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
