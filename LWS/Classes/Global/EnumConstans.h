//
//  EnumConstans.h
//  LOL001
//
//  Created by 张凯 on 16/7/5.
//  Copyright © 2016年 zk. All rights reserved.
//

#ifndef EnumConstans_h
#define EnumConstans_h


// 新闻页面
typedef enum : NSInteger{
    latestPage = 0, //
    ActivePage,     //活动
    GamePage,       //赛事
    VideoPage,      //视频
    EnjoyPage,      //娱乐
    Officalpage,    //官方
    BeautyPage,     //美女
    StrategyPage    //攻略

} PageType;


//英雄页面
typedef enum : NSUInteger {
    LimitHero = 0, //周免
    AllHero        //全部
    
} HeroType;


#endif /* EnumConstans_h */
