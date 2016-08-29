//
//  SecondBannerModel.m
//  LWS
//
//  Created by 张凯 on 16/7/18.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "SecondBannerModel.h"

@implementation SecondBannerModel

-(id)initWithDataDic:(NSDictionary*)data{
    if (self = [super init]) {
        [self setAttributes:data];
    }
    return self;
}


- (void)_initWithCmtDic:(NSDictionary *)dataDic{
    self.image_url  = [dataDic objectForKey:@"image_url"];
    self.target_url = [dataDic objectForKey:@"target_url"];
    self.webp_url   = [dataDic objectForKey:@"webp_url"];

    
}

- (void)setAttributes:(NSDictionary *)dataDic {
    [self _initWithCmtDic:dataDic];
    
}

@end
