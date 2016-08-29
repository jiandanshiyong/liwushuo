//
//  BaseViewController.h
//  MSJ
//
//  Created by 张凯 on 16/7/9.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSegment.h"

@interface BaseViewController : UIViewController

@property(nonatomic, strong) CustomSegment *mySeg ;     // 自定义segment
@property(nonatomic, strong) UIView *nav ;              //navbar

// 选中的segment的下标
@property (nonatomic , assign)NSInteger segment_index ;

// navgation
- (void)initNavTitle:(id)title
             leftImg:(NSString *)leftImgStr
            rightImg:(NSString *)rightImgStr
             bgColor:(UIColor *)bgColor;

- (void)leftAction ;

- (void)rightAction ;

@end
