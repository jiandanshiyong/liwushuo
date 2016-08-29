//
//  ChannelsModel.h
//  MSJ
//
//  Created by 张凯 on 16/7/16.
//  Copyright © 2016年 zk. All rights reserved.
//
/*
{
    "editable": false,
    "id": 100,
    "name": "\u7cbe\u9009"
}
*/

#import <Foundation/Foundation.h>

@interface ChannelsModel : NSObject

@property(nonatomic, copy) NSString  * editable;
@property(nonatomic, copy) NSString  * myId;  //id 系统关键字
@property(nonatomic, copy) NSString  * name;


@end
