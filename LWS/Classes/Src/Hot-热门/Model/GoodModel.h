//
//  GoodModel.h
//  LWS
//
//  Created by 张凯 on 16/7/28.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodModel : NSObject

@property(nonatomic, strong)    NSNumber   * myId; //id 系统关键字
@property(nonatomic, copy)      NSString   * cover_image_url;
@property(nonatomic, strong)    NSString   * name;
@property(nonatomic, copy)      NSString   * price;
@property(nonatomic, strong)    NSNumber   * favorites_count;


-(id)initWithDataDic:(NSDictionary*)data;
@end

/*
 {
 "data": {
 "ad_monitors": [
 
 ],
 "brand_id": null,
 "brand_order": null,
 "category_id": 2,
 "cover_image_url": "http://img02.liwushuo.com/image/151022/gso691c7u_w.jpg-w720",
 "cover_webp_url": "http://img02.liwushuo.com/image/151022/gso691c7u_w.jpg?imageView2/2/w/720/q/85/format/webp",
 "created_at": 1427876329,
 "description": "\u5728\u8bd7\u4eba\u7684\u6bd4\u55bb\u4e2d\uff0c\u7231\u60c5\u5c31\u50cf\u662f\u5317\u6781\u661f\u548c\u5317\u6597\u661f\u3002\u4e0a\u4e07\u5e74\u7684\u5149\u9634\u4e2d\u4ed6\u5011\u51dd\u89c6\u7740\u5f7c\u6b64\uff0c\u5b88\u671b\u8457\u5f7c\u6b64\uff0c\u6267\u7740\u4e8e\u7231\u60c5\uff0c\u5c31\u50cf\u76f8\u7231\u7684\u4f60\u548c\u5979\u3002\u9542\u7a7a\u9576\u5d4c\u7684\u65bd\u534e\u6d1b\u4e16\u5947\u767d\u6c34\u6676\uff0c\u8ba9\u5317\u6597\u4e03\u661f\u5728\u9633\u5149\u4e2d\u683c\u5916\u7480\u74a8\uff0c\u8c61\u5f81\u4f60\u4eec\u7480\u74a8\u822c\u7684\u672a\u6765\u3002",
 "editor_id": 1019,
 "favorites_count": 4950,
 "id": 1016771,
 "image_urls": [
 "http://img02.taobaocdn.com/imgextra/i2/360337206/TB2OBFUbXXXXXXqXpXXXXXXXXXX_!!360337206.jpg_480x480q60.jpg",
 "http://img03.taobaocdn.com/imgextra/i3/360337206/TB2YBl1bXXXXXXcXXXXXXXXXXXX_!!360337206.jpg_480x480q60.jpg",
 "http://img02.taobaocdn.com/imgextra/i2/360337206/TB2cVl1bXXXXXX9XpXXXXXXXXXX_!!360337206.jpg_480x480q60.jpg",
 "http://img01.liwushuo.com/image/150401/0r0geslmp_w.jpg-w720",
 "http://img03.liwushuo.com/image/151022/gso691c7u_w.jpg-w720"
 ],
 "is_favorite": false,
 "name": "INNO.PARK\u00b7\u5317\u6781\u661f\u4e4b\u604b\u60c5\u4fa3\u5bf9\u6212",
 "post_ids": [
 
 ],
 "price": "268.00",
 "purchase_id": "40568789231",
 "purchase_status": 1,
 "purchase_type": 1,
 "purchase_url": "http://s.click.taobao.com/t?e=m%3D2%26s%3DCDa1sOaQmQMcQipKwQzePOeEDrYVVa64XoO8tOebS%2BdRAdhuF14FMWNjT3ENvsXAt4hWD5k2kjOtgmtnxDX9deVMA5qBABUs5mPg1WiM1P5OS0OzHKBZzW1e2y4p13L5kEDx99T5HIvqfitZ8D7RYzyI2OIzOjIVxgxdTc00KD8%3D",
 "subcategory_id": 90,
 "updated_at": 1427876329,
 "url": "http://www.liwushuo.com/items/1016771",
 "webp_urls": [
 "http://img02.taobaocdn.com/imgextra/i2/360337206/TB2OBFUbXXXXXXqXpXXXXXXXXXX_!!360337206.jpg_480x480q60.jpg",
 "http://img03.taobaocdn.com/imgextra/i3/360337206/TB2YBl1bXXXXXXcXXXXXXXXXXXX_!!360337206.jpg_480x480q60.jpg",
 "http://img02.taobaocdn.com/imgextra/i2/360337206/TB2cVl1bXXXXXX9XpXXXXXXXXXX_!!360337206.jpg_480x480q60.jpg",
 "http://img01.liwushuo.com/image/150401/0r0geslmp_w.jpg?imageView2/2/w/720/q/85/format/webp",
 "http://img03.liwushuo.com/image/151022/gso691c7u_w.jpg?imageView2/2/w/720/q/85/format/webp"
 ]
 },
 "type": "item"
 }
 
 */