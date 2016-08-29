//
//  SingleGifColumnCell.h
//  LWS
//
//  Created by 张凯 on 16/8/17.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleGifColumnCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *edgeLineView;
@property (strong, nonatomic) IBOutlet UIButton *titleBtn;


- (void)changeStatus:(BOOL)selected; //改变选中样式
@end
