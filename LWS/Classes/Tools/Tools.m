//
//  Tools.m
//  3_Tools
//
//  Created by 张凯 on 16/6/14.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "Tools.h"

@implementation Tools

//参数：imageName  完整的图片名称（带扩展名）
+ (UIImage *)imageWithName:(NSString *)imageName{
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
    
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return image;
}


//创建textField
+ (UITextField *)createTextFieldFrame:(CGRect)frame
                           placeholer:(NSString *)placeholderText
                        textAlignment:(NSTextAlignment)textAlign
                                 font:(UIFont *)font{

    UITextField *textField= [[UITextField alloc] initWithFrame:frame];
    
    textField.placeholder = placeholderText;
    textField.textAlignment = textAlign;
    textField.font = font;
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    return textField;
}

// 创建文字按钮
+ (UIButton *)createTitleButton:(NSString *)title
                          frame:(CGRect)frame
                         target:(id)target
                         action:(SEL)action{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame =frame;
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

//创建label
+ (UILabel *)createLabel:(NSString *)title
                   frame:(CGRect)frame{
    
    UILabel *label= [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    
    return label;
}

//获取一个随机颜色
+(UIColor *)randomColor{
    CGFloat r = arc4random() % 256 / 255.0;
    CGFloat g = arc4random() % 256 / 255.0;
    CGFloat b = arc4random() % 256 / 255.0;
    
    UIColor * color = [UIColor colorWithRed:r green:g blue:b alpha:1];
    return color;
}


@end
