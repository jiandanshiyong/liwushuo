//
//  UIBarButtonItem+extension.h
//  LWS
//
//  Created by 张凯 on 16/8/6.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (extension)

+ (UIBarButtonItem *)init_GifTarget:(nullable id)target action: (SEL)action ;

+ (UIBarButtonItem *)init_SearchTarget:(nullable id)target action: (SEL)action ;

+ (UIBarButtonItem *)init_ChooseGifTarget:(nullable id)target action: (SEL)action ;


@end
