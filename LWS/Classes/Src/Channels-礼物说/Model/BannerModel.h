//
//  BannerModel.h
//  LWS
//
//  Created by 张凯 on 16/7/18.
//  Copyright © 2016年 zk. All rights reserved.
//

/*
 {
 "ad_monitors": [],
 "channel": "all",
 "id": 655,
 "image_url": "http://img01.liwushuo.com/image/160713/11y8ugwh3.jpg-w720",
 "order": 124,
 "status": 0,
 "target": {
         "banner_image_url": "http://img01.liwushuo.com/image/160713/aayyc5gsm.jpg-w300",
         "banner_webp_url": "http://img01.liwushuo.com/image/160713/aayyc5gsm.jpg?imageView2/2/w/300/q/85/format/webp",
         "cover_image_url": "http://img01.liwushuo.com/image/160713/epr2b1m6f.jpg-w720",
         "cover_webp_url": "http://img01.liwushuo.com/image/160713/epr2b1m6f.jpg?imageView2/2/w/720/q/85/format/webp",
         "created_at": 1468389283,
         "id": 328,
         "posts_count": 7,
         "status": 1,
         "subtitle": "\u590f\u5929\u5c31\u662f\u65f6\u523b\u88c5\u201c\u88e4\u201d  ",
         "title": "\u590f\u5b63\u5fc5\u5907\u88e4\u88c5",
         "updated_at": 1468389454
 },
 "target_id": 328,
 "target_type": "url",
 "target_url": "liwushuo:///page?page_action=navigation&login=false&type=topic&topic_id=328",
 "type": "collection",
 "webp_url": "http://img01.liwushuo.com/image/160713/11y8ugwh3.jpg?imageView2/2/w/720/q/85/format/webp"
 }
 */

#import <Foundation/Foundation.h>

@interface BannerModel : NSObject

@property(nonatomic, copy) NSString * image_url; //图片

@property(nonatomic, strong) NSNumber * target_id;  //
@property(nonatomic, copy) NSString  * target_type;
@property(nonatomic, copy) NSString * target_url;
@property(nonatomic, copy) NSString * type;       //判断类型
@property(nonatomic, copy) NSString * webp_url;



-(id)initWithDataDic:(NSDictionary*)data;


@end
