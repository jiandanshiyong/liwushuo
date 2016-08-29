//
//  NetManager.h
//  MSJ
//
//  Created by 张凯 on 16/7/11.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^SuccessBlock)(id responseObject);
typedef void(^FailureBlock)(NSError *error);

@interface NetManager : NSObject

+ (void)GET:(NSString *)urlStr
 parameters:(id)param
    success:(SuccessBlock)success
    failure:(FailureBlock)failure;

+ (void)POST:(NSString *)urlStr
  parameters:(id)param
     success:(SuccessBlock)success
     failure:(FailureBlock)failure;

+ (NSInteger)isOline;

@end
