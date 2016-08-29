//
//  OneModel.h
//  商品列表
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "BaseModel.h"

@interface OneModel : BaseModel

@property (nonatomic,copy) NSString *icon_url, *name;

/*
 
 {
 "icon_url": "http://img03.liwushuo.com/image/150615/urgs9vy8a.png-pw144",
 "id": 7,
 "items_count": -23,
 "name": "智能设备",
 "order": 7,
 "parent_id": 1,
 "status": 0
 },

 */

@end
