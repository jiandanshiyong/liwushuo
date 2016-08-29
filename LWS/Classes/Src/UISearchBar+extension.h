//
//  UISearchBar+extension.h
//  LWS
//
//  Created by 张凯 on 16/8/15.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (extension)

+ (UISearchBar *)init_searchGifdelegate:(id<UISearchBarDelegate>)searchGifdelegate
                        backgroundColor: (UIColor *)backgroundColor
                        backgroundImage: (UIImage *)backgroundImage;

@end
