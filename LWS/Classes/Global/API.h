//
//  API.h
//  LWS
//
//  Created by 张凯 on 16/7/28.
//  Copyright © 2016年 zk. All rights reserved.
//

#ifndef API_h
#define API_h

//-------------------------1. 首页 -----------------------------------------------------------

//顶部导航 - 频道
#define URL_channels @"http://api.liwushuo.com/v2/channels/preset?gender=1&generation=1"

//精选 100
#define URL_channel_100 @"http://api.liwushuo.com/v2/channels/100/items_v2?ad=2&gender=1&generation=1&limit=20&offset=0"
//格频首页 拼接
#define URL_channel_type @"http://api.liwushuo.com/v2/channels/%ld/items_v2?gender=1&generation=1&limit=20&offset=%ld"


//1.1 横幅滚动动画
#define URL_channels_banners @"http://api.liwushuo.com/v2/banners?channel=iOS"

//1.2 横幅2
#define URL_channels_secondary_banners @"http://api.liwushuo.com/v2/secondary_banners?gender=1&generation=1"



//-------------------------2. 热门-----------------------------------------------------------

#define URL_Hot @"http://api.liwushuo.com/v2/items?gender=1&generation=1&limit=50&offset=0"
//@"http://api.liwushuo.com/v2/items?generation=1&gender=1&limit=50&offset=50"

//1.单品 2.详细  3.评论
#define URL_Hot_detail @"http://api.liwushuo.com/v2/items/%ld"

//单品下方推荐 （12条）
#define URL_Hot_recommend  @"http://api.liwushuo.com/v2/items/%ld/recommend"




//-------------------------3.分类 -----------------------------------------------------------
#define URL_group @"http://api.liwushuo.com/v2/item_categories/tree"





#endif /* API_h */
