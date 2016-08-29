//
//  AuthorModel.h
//  MSJ
//
//  Created by 张凯 on 16/7/16.
//  Copyright © 2016年 zk. All rights reserved.
//
/*
 {
 "avatar_url": "http://img03.liwushuo.com/image/160617/hzkkl1ohn.jpg",
 "avatar_webp_url": null,
 "created_at": 1465802857,
 "id": 1,
 "nickname": "\u5c0f\u793c\u541b"
 }
 
 */


#import <Foundation/Foundation.h>

@interface AuthorModel : NSObject

@property(nonatomic, copy) NSString  * avatar_url;
@property(nonatomic, copy) NSString  * nickname;

-(id)initWithDataDic:(NSDictionary*)data;
@end
