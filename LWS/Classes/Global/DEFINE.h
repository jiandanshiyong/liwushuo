//
//  CONSTS.h
//  HW1_RandomStudent
//
//  Created by 张凯 on 16/6/15.
//  Copyright © 2016年 zk. All rights reserved.
//

#ifndef DEFINE_h
#define DEFINE_h

// 屏幕宽
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
// 屏幕高
#define KScreenHeight [UIScreen mainScreen].bounds.size.height


// RGB色值
#define UICOLOR_RGB(r, g, b, al) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:al]

// 程序主颜色
#define Color_GlobalBackground  UICOLOR_RGB(240.0, 240.0, 240.0, 1.0)
#define Color_GlobalLine        UICOLOR_RGB(237.0, 240.0, 240.0, 1.0)
#define Color_NavBackground     UICOLOR_RGB(251.0, 45.0, 71.0, 1.0)


//预加载图片
#define Default_Image  [UIImage imageNamed:@"Icon.png"]



//基于iPhone5的等比例适配 与UIView+YZTCView重复
//// x轴比例
//#define YZScaleX KScreenWidth/320.0
//// y周比例
//#define YZScaleY KScreenHeight/568.0


//font
//#define CUSTOMFONT(x) [UIFont systemFontOfSize:x]
#define CUSTOMFONT(x) [NSObject fitFont:x]


#define iphone5 [UIScreen mainScreen].bounds.size.width==320
#define iphone6 [UIScreen mainScreen].bounds.size.width==375?YES:NO
#define iphone6Plus [UIScreen mainScreen].bounds.size.width==414?YES:NO



//异步
#define QUEUE_async dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)


// 导入其他文件
#import "API.h"
#import "UIView+YZTCView.h"
#import "Category.h"

#endif /* DEFINE_h */




