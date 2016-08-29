//
//  ChannelItemModel.h
//  MSJ
//
//  Created by 张凯 on 16/7/16.
//  Copyright © 2016年 zk. All rights reserved.
//

/*
 {
 "ad_monitors": [],
 "author": {},
 "column": {},
 "content_type": 1,
 "content_url": "http://www.liwushuo.com/posts/1044611/content",
 "cover_image_url": "http://img02.liwushuo.com/image/160715/95g3u83li.jpg-w720",
 "cover_webp_url": "http://img02.liwushuo.com/image/160715/95g3u83li.jpg?imageView2/2/w/720/q/85/format/webp",
 "created_at": 1468638060,
 "editor_id": 1023,
 "feature_list": [],
 "hidden_cover_image": false,
 "id": 1044611,
 "labels": [],
 "liked": false,
 "likes_count": 798,
 "published_at": 1468638060,
 "share_msg": "\u5c45\u5bb6\u751f\u6d3b\u4e2d\u6e05\u6d01\u4e00\u76f4\u662f\u4e2a\u5927\u96be\u9898\uff0c\u8f9b\u82e6\u4e0d\u8bf4\uff0c\u8fd8\u4f1a\u628a\u81ea\u5df1\u5f04\u5f97\u810f\u516e\u516e\uff0c\u6709\u591a\u5c11\u4eba\u90fd\u5728\u82e6\u607c\u5bb6\u91cc\u7684\u6e05\u6d01\u95ee\u9898\u5462\uff0c\u8fd9\u4e9b\u65b9\u4fbf\u53c8\u5b9e\u7528\u7684\u5c0f\u5de5\u5177\uff0c\u5e2e\u4f60\u5c06\u5bb6\u91cc\u7684\u91cc\u91cc\u5916\u5916\uff0c\u5404\u79cd\u5c0f\u89d2\u843d\u90fd\u6e05\u6d01\u5e72\u51c0\uff0c\u4ee5\u540e\u518d\u4e5f\u4e0d\u7528\u62c5\u5fc3\u5bb6\u91cc\u9762\u7684\u536b\u751f\u95ee\u9898\u4e86\u5462\u3002\u6240\u4ee5\u522b\u770b\u5b83\u4eec\u957f\u5f97\u5c0f\uff0c\u5b83\u4eec\u7684\u672c\u4e8b\u53ef\u771f\u662f\u4e0d\u5c0f\u5462\u3002\u6709\u4e86\u8fd9\u4e9b\u5c0f\u4e1c\u897f\uff0c\u6bcf\u6708\u4e00\u6b21\u7684\u5927\u626b\u9664\u6beb\u4e0d\u8d39\u529b\u3002",
 "short_title": "\u6e05\u6d01\u795e\u5668",
 "status": 0,
 "template": "",
 "title": "\u6d01\u7656\u661f\u4eba\u6700\u7231\u7684\u6e05\u6d01\u795e\u5668\uff0c360\u5ea6\u65e0\u6b7b\u89d2",
 "type": "post",
 "updated_at": 1468599108,
 "url": "http://www.liwushuo.com/posts/1044611"
 }
 */

#import <Foundation/Foundation.h>
#import "AuthorModel.h"
#import "ColumnModel.h"

@interface ChannelItemModel : NSObject

@property(nonatomic, strong) NSMutableArray  * ad_monitors;
@property(nonatomic, strong) NSMutableArray  * feature_list;
@property(nonatomic, strong) NSMutableArray  * labels;

@property(nonatomic, strong) AuthorModel * author;
@property(nonatomic, strong) ColumnModel * column;

@property(nonatomic, copy) NSString  * content_type;
@property(nonatomic, copy) NSString  * content_url;
@property(nonatomic, copy) NSString  * cover_image_url;
@property(nonatomic, copy) NSString  * cover_webp_url;
@property(nonatomic, copy) NSString  * created_at;
@property(nonatomic, copy) NSString  * editor_id;

@property(nonatomic, copy) NSString  * hidden_cover_image;
@property(nonatomic, copy) NSString  * myId; //id关键字

@property(nonatomic, copy) NSString  * liked;
@property(nonatomic, retain) NSNumber  * likes_count;
@property(nonatomic, copy) NSString  * published_at;
@property(nonatomic, copy) NSString  * share_msg;
@property(nonatomic, copy) NSString  * short_title;
@property(nonatomic, copy) NSString  * status;
@property(nonatomic, copy) NSString  * temp; //template关键字
@property(nonatomic, copy) NSString  * title;
@property(nonatomic, copy) NSString  * type;
@property(nonatomic, copy) NSString  * updated_at;
@property(nonatomic, copy) NSString  * url;


-(id)initWithDataDic:(NSDictionary*)data;

@end
