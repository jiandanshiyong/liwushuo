//
//  UISearchBar+extension.m
//  LWS
//
//  Created by 张凯 on 16/8/15.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "UISearchBar+extension.h"

@implementation UISearchBar (extension)

+ (UISearchBar *)init_searchGifdelegate:(id<UISearchBarDelegate>)searchGifdelegate
                        backgroundColor: (UIColor *)backgroundColor
                        backgroundImage: (UIImage *)backgroundImage {
    UISearchBar *searchbar = [[UISearchBar alloc] init];
    searchbar.delegate = searchGifdelegate;
    
    searchbar.placeholder = @"快选一份礼物，送给亲爱的Ta吧";
    searchbar.tintColor = [UIColor whiteColor];
    searchbar.barStyle = UIBarStyleBlackTranslucent;
    searchbar.layer.masksToBounds = true;
    searchbar.layer.cornerRadius = 5.0;
    searchbar.backgroundImage = backgroundImage;
    for (UIView *subView in searchbar.subviews) {
        for (UIView *subView1 in subView.subviews){
            if ([subView1 isKindOfClass:[UITextField class]]){
                subView1.backgroundColor = backgroundColor;
            }
        }
        
    }
    
    return searchbar;
}

@end
