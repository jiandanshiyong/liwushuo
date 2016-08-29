//
//  ShopModel.h
//  商品列表
//
//  Created by mac on 16/1/19.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "BaseModel.h"
#import "OneModel.h"

@interface ShopModel : BaseModel

@property (nonatomic,copy) NSString *icon_url, *name;

//@property (nonatomic,retain) NSArray *subcategories;

//@property (nonatomic,retain) OneModel *oneModel;

/*
 
 "icon_url": "http://img02.liwushuo.com/image/150615/3nc5tejwl.png-pw144",
 "id": 1,
 "name": "热门分类",
 "order": 11,
 "status": 0,
 "subcategories": [
 {
 "icon_url": "http://img03.liwushuo.com/image/150615/urgs9vy8a.png-pw144",
 "id": 7,
 "items_count": -23,
 "name": "智能设备",
 "order": 7,
 "parent_id": 1,
 "status": 0
 },
 {
 "icon_url": "http://img03.liwushuo.com/image/150615/d4dhjw1we.png-pw144",
 "id": 6,
 "items_count": -218,
 "name": "鲜花蛋糕",
 "order": 6,
 "parent_id": 1,
 "status": 0
 },
 
 */


@end
