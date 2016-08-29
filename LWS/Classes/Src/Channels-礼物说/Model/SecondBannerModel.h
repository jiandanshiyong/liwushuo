//
//  SecondBannerModel.h
//  LWS
//
//  Created by 张凯 on 16/7/18.
//  Copyright © 2016年 zk. All rights reserved.
//
/*
 {
 "ad_monitors": [],
 "id": 43,
 "image_url": "http://img01.liwushuo.com/image/160517/8xb020ll2.jpg-w720",
 "target_url": "liwushuo:///page?type=dailylucky",
 "webp_url": "http://img01.liwushuo.com/image/160517/8xb020ll2.jpg?imageView2/2/w/720/q/85/format/webp"
 }
 */

#import <Foundation/Foundation.h>

@interface SecondBannerModel : NSObject

@property(nonatomic, copy) NSString * image_url; //图片
@property(nonatomic, copy) NSString * target_url; //url需要截取
@property(nonatomic, copy) NSString * webp_url;


-(id)initWithDataDic:(NSDictionary*)data;

@end
