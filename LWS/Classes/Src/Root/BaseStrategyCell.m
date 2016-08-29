//
//  BaseStrategyCell.m
//  LWS
//
//  Created by 张凯 on 16/8/13.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "BaseStrategyCell.h"
#import "DEFINE.h"

@interface BaseStrategyCell()
@property (strong, nonatomic) IBOutlet UIButton *tagBtn;
@property (strong, nonatomic) IBOutlet UIButton *tagTitleBtn;
@property (strong, nonatomic) IBOutlet UIButton *headBtn;
@property (strong, nonatomic) IBOutlet UILabel *nickLab;

@property (strong, nonatomic) IBOutlet UIImageView *coverImageview;

@property (strong, nonatomic) IBOutlet UILabel *textLab;
@property (strong, nonatomic) IBOutlet UIButton *priseBtn;

@end



@implementation BaseStrategyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self customUI];
}


- (void)customUI{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.layer.borderWidth =3.0;
    self.layer.borderColor = Color_GlobalBackground.CGColor;

    self.tagBtn.layer.cornerRadius = 5.0;
    self.tagBtn.layer.masksToBounds = true;
    
    self.headBtn.layer.cornerRadius = self.headBtn.yzWidth * 0.5;
    self.headBtn.layer.masksToBounds = true;
    
    self.coverImageview.clipsToBounds = true;
    self.coverImageview.contentMode =  UIViewContentModeScaleAspectFill;
    //strategy_ .jpg \(Int(arc4random() % 17) + 1)
    self.coverImageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"strategy_%u.jpg", arc4random()%17+1]];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - action
- (IBAction)tagBtnAction:(id)sender {
    NSLog(@"标签店名");
}
- (IBAction)headBtnAction:(id)sender {
     NSLog(@"昵称");
}
- (IBAction)priseBtnAction:(id)sender {
     NSLog(@"喜欢23232");
}


@end
