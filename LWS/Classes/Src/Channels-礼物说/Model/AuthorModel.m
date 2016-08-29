//
//  AuthorModel.m
//  MSJ
//
//  Created by 张凯 on 16/7/16.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "AuthorModel.h"

@implementation AuthorModel

-(id)initWithDataDic:(NSDictionary*)data{
    if (self = [super init]) {
        [self setAttributes:data];
    }
    return self;
}


- (void)_initWithCmtDic:(NSDictionary *)dataDic{
    
    self.avatar_url = [dataDic objectForKey:@"avatar_url"];
    self.nickname   = [dataDic objectForKey:@"nickname"];
}

- (void)setAttributes:(NSDictionary *)dataDic {
    
    [self _initWithCmtDic:dataDic];
    
    
}

@end
