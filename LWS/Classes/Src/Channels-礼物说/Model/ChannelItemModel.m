//
//  ChannelItemModel.m
//  MSJ
//
//  Created by 张凯 on 16/7/16.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "ChannelItemModel.h"

@implementation ChannelItemModel


-(id)initWithDataDic:(NSDictionary*)data{
    if (self = [super init]) {
        [self setAttributes:data];
    }
    return self;
}




- (void)_initWithCmtDic:(NSDictionary *)dataDic{
    
    self.content_url = [dataDic objectForKey:@"content_url"];
    self.cover_image_url = [dataDic objectForKey:@"cover_image_url"];
    self.cover_webp_url = [dataDic objectForKey:@"cover_webp_url"];

    self.hidden_cover_image = [dataDic objectForKey:@"hidden_cover_image"];
    self.myId = [dataDic objectForKey:@"id"];
    
    self.likes_count = [dataDic objectForKey:@"likes_count"];
    self.temp = [dataDic objectForKey:@"template"];
    self.title = [dataDic objectForKey:@"title"];
    self.url = [dataDic objectForKey:@"url"];
}

- (void)setAttributes:(NSDictionary *)dataDic {
    
    [self _initWithCmtDic:dataDic];
    
    NSDictionary *dic = [dataDic objectForKey:@"author"];
    if (dic != nil) {
        AuthorModel *author = [[AuthorModel alloc] initWithDataDic:dic];
        self.author = author;
    }
    
     NSDictionary *dic2 = [dataDic objectForKey:@"column"];
    if (dic2 != nil) {
        ColumnModel *column = [[ColumnModel alloc] initWithDataDic:dic2];
        self.column = column;
    }

}


@end
