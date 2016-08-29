//
//  ChannelsModel.m
//  MSJ
//
//  Created by 张凯 on 16/7/16.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "ChannelsModel.h"

@implementation ChannelsModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.myId = value;
    }

}

- (void)setNilValueForKey:(NSString *)key{
}

@end
