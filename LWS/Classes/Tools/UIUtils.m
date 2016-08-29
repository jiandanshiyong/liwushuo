//
//  UIUtils.m
//  HW2_WeChat
//
//  Created by 张凯 on 16/6/25.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "UIUtils.h"

@implementation UIUtils

/**
 *  获取沙盒路径
 */
+ (NSString *)getDocumentsPath:(NSString *)fileName {
    
    //两种获取document路径的方式
    //    NSString *documents = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documents = [paths objectAtIndex:0];
    NSString *path = [documents stringByAppendingPathComponent:fileName];
    
    return path;
}

/**
 *  日期 转 字符串
 *
 *  @param datestring 日期时间
 *  @param formate    目标格式
 *
 *  @return 日期时间的字符串
 */
+ (NSString*) stringFromFomate:(NSDate*) date formate:(NSString*)formate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    
    NSString *str = [formatter stringFromDate:date];
    return str;
}

/**
 *  字符串 转 日期
 *
 *  @param datestring 日期时间的字符串
 *  @param formate    日期时间对应的标准格式
 *
 *  @return 日期
 */
+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    
    //将与国家和语言相关的信息进行简单的组合，包括货币、语言、国家等的信息。
    formatter.locale =[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
    NSDate *date = [formatter dateFromString:datestring];
    return date;
}

/**
 *  参数：字符串日期时间 Sat Jan 12 11:50:16 +0800 2013
 *  返回：字符串日期时间 01-12 11:50
 */
+ (NSString *)fomateString:(NSString *)datestring {
    NSString *formate = @"E M d HH:mm:ss Z yyyy";
    NSDate *createDate = [UIUtils dateFromFomate:datestring formate:formate];
    NSString *text = [UIUtils stringFromFomate:createDate formate:@"MM-dd HH:mm"];
    return text;
}

/*
+ (NSString *)parseLink:(NSString *)text{
    //表达式
    //\w配的是：匹配字母或数字或下划线或汉字
    //        NSString *regex = @"@\\w+";   //匹配 "@用户"
    //        NSString *regex = @"#\\w+#";  //匹配 "#话题#"
    //        NSString *regex = @"http(s)?://([A-Za-z0-9._-]+(/)?)*";   //匹配 “http://...”
    //三种表达式集成一起
    NSString *regex = @"(@\\w+)|(#\\w+#)|(http(s)?://([A-Za-z0-9._-]+(/)?)*)";
    NSArray *array = [text componentsMatchedByRegex:regex];
    
    NSString *taget =nil ;
    for (NSString *linkString in array) {
        if ([linkString hasPrefix:@"@"]) {
            taget = [NSString stringWithFormat:@"<a href='user://%@'>%@</a>",[linkString URLEncodedString],linkString];
        }
        else if ([linkString hasPrefix:@"#"]) {
            taget = [NSString stringWithFormat:@"<a href='topic://%@'>%@</a>",[linkString URLEncodedString],linkString];
        }
        else if ([linkString hasPrefix:@"http"]) {
            taget = [NSString stringWithFormat:@"<a href='%@'>%@</a>",linkString,linkString];
        }
        
        if (taget != nil) {
            text = [text stringByReplacingOccurrencesOfString:linkString withString:taget];
        }
    }
    
    return text;
}
*/

@end
