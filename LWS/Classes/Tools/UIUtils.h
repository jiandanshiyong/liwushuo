//
//  UIUtils.h
//  HW2_WeChat
//
//  Created by 张凯 on 16/6/25.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIUtils : NSObject

//获取documents下的文件路径
+ (NSString *)getDocumentsPath:(NSString *)fileName;


// date 格式化为 string
+ (NSString*) stringFromFomate:(NSDate*)date formate:(NSString*)formate;

// string 格式化为 date
+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate;

//输入这样的格式 //Sat Jan 12 11:50:16 +0800 2013
+ (NSString *)fomateString:(NSString *)datestring;


//+ (NSString *)parseLink:(NSString *)text;

@end
