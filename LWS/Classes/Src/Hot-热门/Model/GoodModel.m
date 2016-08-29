//
//  GoodModel.m
//  LWS
//
//  Created by 张凯 on 16/7/28.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "GoodModel.h"

@implementation GoodModel

-(id)initWithDataDic:(NSDictionary*)data{
    if (self = [super init]) {
        [self setAttributes:data];
    }
    return self;
}


- (void)_initWithCmtDic:(NSDictionary *)dataDic{
    
    self.myId             = [dataDic objectForKey:@"id"];
    self.cover_image_url  = [dataDic objectForKey:@"cover_image_url"];
    self.name             = [dataDic objectForKey:@"name"];
    self.price            = [dataDic objectForKey:@"price"];
    self.favorites_count  = [dataDic objectForKey:@"favorites_count"];
   
}

- (void)setAttributes:(NSDictionary *)dataDic {
    [self _initWithCmtDic:dataDic];
    
//    NSDictionary *dic = [dataDic objectForKey:@"author"];
//    if (dic != nil) {
//        AuthorModel *author = [[AuthorModel alloc] initWithDataDic:dic];
//        self.author = author;
//    }
}


@end
