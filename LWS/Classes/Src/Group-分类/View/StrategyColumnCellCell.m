//
//  StrategyColumnCellCell.m
//  LWS
//
//  Created by 张凯 on 16/8/18.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "StrategyColumnCellCell.h"
#import "AllColumnViewController.h"

@implementation StrategyColumnCellCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.photoImageView.clipsToBounds = true;
    self.photoImageView.contentMode =  UIViewContentModeScaleAspectFill;
//    self.photoImageView.image = UIImage(named: "strategy_\(Int(arc4random() % 17) + 1).jpg")
    
    self.viewAllBtn.layer.masksToBounds = true;
    self.viewAllBtn.layer.cornerRadius = 2.0;
    self.viewAllBtn.layer.borderColor = self.viewAllBtn.titleLabel.textColor.CGColor;
    self.viewAllBtn.layer.borderWidth = 0.5;
}

- (IBAction)viewAllBtnAction:(id)sender {
    NSLog(@"点击查看全部 ");
    //Xib关闭用户响应， 由父类cell统一跳转
}

@end
