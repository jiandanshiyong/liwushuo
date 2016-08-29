//
//  BannerModel.m
//  LWS
//
//  Created by 张凯 on 16/7/18.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "BannerModel.h"

@implementation BannerModel

-(id)initWithDataDic:(NSDictionary*)data{
    if (self = [super init]) {
        [self setAttributes:data];
    }
    return self;
}


- (void)_initWithCmtDic:(NSDictionary *)dataDic{
    self.image_url  = [dataDic objectForKey:@"image_url"];
    
    self.target_id   = [dataDic objectForKey:@"target_id"];
    self.target_type = [dataDic objectForKey:@"target_type"];
    self.target_url = [dataDic objectForKey:@"target_url"];
    self.type       = [dataDic objectForKey:@"type"];
    self.webp_url   = [dataDic objectForKey:@"webp_url"];
    
}

- (void)setAttributes:(NSDictionary *)dataDic {
    [self _initWithCmtDic:dataDic];
    
    
}

@end
