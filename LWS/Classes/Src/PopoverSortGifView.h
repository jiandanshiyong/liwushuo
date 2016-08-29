//
//  PopoverSortGifView.h
//  LWS
//
//  Created by 张凯 on 16/8/23.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopoverSortGifView : UIView

@property (strong, nonatomic) IBOutlet UIButton *subjectBtn;
@property (strong, nonatomic) IBOutlet UIButton *characterBtn;
@property (strong, nonatomic) IBOutlet UIButton *occasionBtn;
@property (strong, nonatomic) IBOutlet UIButton *priceBtn;



+ (instancetype)popoverSortGifView;

@end
