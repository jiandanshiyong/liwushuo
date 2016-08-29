//
//  ColumnModel.m
//  MSJ
//
//  Created by 张凯 on 16/7/16.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "ColumnModel.h"

@implementation ColumnModel


-(id)initWithDataDic:(NSDictionary*)data{
    if (self = [super init]) {
        [self setAttributes:data];
    }
    return self;
}


- (void)_initWithCmtDic:(NSDictionary *)dataDic{
    
//    self.category = [dataDic objectForKey:@"category"];
//    self.title = [dataDic objectForKey:@"title"];

}

- (void)setAttributes:(NSDictionary *)dataDic {
    
    [self _initWithCmtDic:dataDic];
    
}

@end
