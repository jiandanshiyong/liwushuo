//
//  BaseGoodsCell.m
//  LWS
//
//  Created by 张凯 on 16/7/28.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "BaseGoodsCell.h"
#import "UIImageView+AFNetworking.h"
#include "DEFINE.h"

@interface BaseGoodsCell ()

@property (strong, nonatomic) IBOutlet UIImageView *goodImgView;
@property (strong, nonatomic) IBOutlet UILabel *goodLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIButton *likeButton;

@end


@implementation BaseGoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.goodImgView.layer.masksToBounds = true;
    self.goodImgView.contentMode =  UIViewContentModeScaleAspectFill;
//    self.goodImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"goods_%u.jpg", arc4random()%10+1]];
}


- (void)setModel:(GoodModel *)model{
    _model = model;
    
    [self.goodImgView setImageWithURL:[NSURL URLWithString:model.cover_image_url] placeholderImage:Default_Image];

    self.goodLabel.text = model.name;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@", model.price];
    [self.likeButton setTitle:[NSString stringWithFormat:@"%@",model.favorites_count ] forState:UIControlStateNormal];
}


- (IBAction)likeBtnAction:(id)sender {
    NSLog(@"心形按钮+1");
}




@end
