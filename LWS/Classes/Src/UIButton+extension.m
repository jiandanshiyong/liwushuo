//
//  UIButton+extension.m
//  LWS
//
//  Created by 张凯 on 16/8/6.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "UIButton+extension.h"
#import "DEFINE.h"

@implementation UIButton (extension)

/// 导航栏返回按钮
+ (UIButton *)init_BackTarget:(nullable id)target action: (SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CustomRectMake(0, 0, 44.0, 44.0);
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

/// 导航栏取消按钮
+ (UIButton *)init_cancelTarget:(nullable id)target action: (SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CustomRectMake(0, 0, 44.0, 44.0);
    [button setTitle:@"取消" forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

///导航栏排序按钮
+ (UIButton *)init_SortTarget:(nullable id)target action: (SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CustomRectMake(0, 0, 44.0, 44.0);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    [button setImage:[UIImage imageNamed:@"icon_sort"] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

/// 选礼神器-筛选标签按钮
+ (UIButton *)init_SrotTagTarget:(nullable id)target action: (SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:UICOLOR_RGB(251, 45, 71, 1.0)] forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageWithColor:[UIColor redColor]] forState:UIControlStateHighlighted];
    
    [button setTitleColor:UICOLOR_RGB(102.0, 102.0, 102.0, 1.0) forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    button.layer.masksToBounds = true;
    button.layer.cornerRadius = 5.0;
    button.layer.borderColor = UICOLOR_RGB(223.0, 223.0, 223.0, 1.0).CGColor;
    button.layer.borderWidth = 0.5;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end
