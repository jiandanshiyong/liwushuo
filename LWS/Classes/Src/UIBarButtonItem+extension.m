//
//  UIBarButtonItem+extension.m
//  LWS
//
//  Created by 张凯 on 16/8/6.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "UIBarButtonItem+extension.h"
#import "DEFINE.h"

@implementation UIBarButtonItem (extension)
/// 礼物
+ (UIBarButtonItem *)init_GifTarget:(nullable id)target action: (SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CustomRectMake(0, 0, 44.0, 44.0);
    [button setImage:[UIImage imageNamed:@"feed_signin"] forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

/// 搜索
+ (UIBarButtonItem *)init_SearchTarget:(nullable id)target action: (SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CustomRectMake(0, 0, 44.0, 44.0);
    [button setImage:[UIImage imageNamed:@"icon_navigation_search"] forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

// 选礼神器
+ (UIBarButtonItem *)init_ChooseGifTarget:(nullable id)target action: (SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CustomRectMake(0, 0, 60.0, 44.0);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    [button setTitle:@"选礼神器" forState:UIControlStateNormal];
    button.titleLabel.font = CUSTOMFONT(15);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
