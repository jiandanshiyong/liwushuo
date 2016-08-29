//
//  ColumnModel.h
//  MSJ
//
//  Created by 张凯 on 16/7/16.
//  Copyright © 2016年 zk. All rights reserved.
//
/*
 {
 "banner_image_url": "http://img03.liwushuo.com/image/160608/muk9fdsya.jpg-w300",
 "category": "\u7f8e\u7269",
 "cover_image_url": "http://img02.liwushuo.com/image/160713/1p98sh06h.jpg-w720",
 "created_at": 1462501717,
 "description": "\u50fb\u9759\u7684\u8857\u89d2\u6709\u4e00\u5bb6\u6742\u8d27\u94fa\uff0c\u6216\u8bb8\u4f60\u5e26\u7740\u5fe7\u6101\u8d70\u8fdb\u5e97\u4e2d\uff0c\u4f46\u4e0d\u671f\u800c\u9047\u7684\u5c0f\u7269\u5374\u8ba9\u4f60\u5c55\u9732\u6b22\u989c\u3002",
 "id": 14,
 "order": 0,
 "post_published_at": 1468595057,
 "status": 0,
 "subtitle": "\u5df2\u5b8c\u7ed3",
 "title": "\u89e3\u5fe7\u6742\u8d27\u94fa",
 "updated_at": 1468598480
 }
 */

#import <Foundation/Foundation.h>

@interface ColumnModel : NSObject

@property(nonatomic, copy) NSString  * category;
@property(nonatomic, copy) NSString  * title;



-(id)initWithDataDic:(NSDictionary*)data;
@end
