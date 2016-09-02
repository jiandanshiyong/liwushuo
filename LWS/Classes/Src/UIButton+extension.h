//
//  UIButton+extension.h
//  LWS
//
//  Created by 张凯 on 16/8/6.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (extension)

+ (UIButton *)init_ButtonWithX:(CGFloat)x
                      iconName:(NSString *)iconName
                        target:(nullable id)target
                        action:(SEL)action
               imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets;

+ (UIButton *)init_BackTarget:(nullable id)target action: (SEL)action;
+ (UIButton *)init_cancelTarget:(nullable id)target action: (SEL)action;
+ (UIButton *)init_SortTarget:(nullable id)target action: (SEL)action;
+ (UIButton *)init_SrotTagTarget:(nullable id)target action: (SEL)action;

@end
