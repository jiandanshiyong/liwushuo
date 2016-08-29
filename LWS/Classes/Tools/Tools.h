//
//  Tools.h
//  3_Tools
//
//  Created by 张凯 on 16/6/14.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tools : NSObject

/**
 *  创建图片
 */
+ (UIImage *)imageWithName:(NSString *)imageName;

/**
 *  创建textField
 */
+ (UITextField *)createTextFieldFrame:(CGRect)frame
                           placeholer:(NSString *)placeholderText
                        textAlignment:(NSTextAlignment)textAlign
                                 font:(UIFont *)font;

/**
 *  创建文字按钮
 */
+ (UIButton *)createTitleButton:(NSString *)title
                          frame:(CGRect)frame
                         target:(id)target
                         action:(SEL)action;

/**
 *  创建label
 */
+ (UILabel *)createLabel:(NSString *)title
                   frame:(CGRect)frame;

/**
 * 获取一个随机颜色
 */
+(UIColor *)randomColor;

@end
