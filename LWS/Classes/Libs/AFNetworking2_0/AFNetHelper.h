//
//  AFNetHelper.h
//  LOL
//
//  Created by RichyLeo on 16/3/2.
//  Copyright © 2016年 WTC. All rights reserved.
//

#import <Foundation/Foundation.h>

// 等价关系  SuccessBlock  ＝ void (^)(id responseObject)
typedef void (^SuccessBlock)(id response);
typedef void (^FailureBlock)(NSError * err);


@interface AFNetHelper : NSObject

+(void)GET:(NSString *)url parameters:(id)param success:(SuccessBlock)success failure:(FailureBlock)failure;

+(void)POST:(NSString *)url parameters:(id)param success:(SuccessBlock)success failure:(FailureBlock)failure;


@end
