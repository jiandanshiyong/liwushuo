//
//  BaseModel.h
//  Mtime
//
//  Created by Mac on 15/8/3.
//  Copyright (c) 2015年 wxk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

- (id)initWithDic:(NSDictionary *)dic;

- (void)setAtributes:(NSDictionary *)dic;

@property (nonatomic, retain)NSDictionary *map;


@end
