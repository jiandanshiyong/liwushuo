//
//  AFNetHelper.m
//  LOL
//
//  Created by RichyLeo on 16/3/2.
//  Copyright © 2016年 WTC. All rights reserved.
//

#import "AFNetHelper.h"
#import "AFNetworking.h"

@implementation AFNetHelper

+(void)GET:(NSString *)url parameters:(id)param success:(SuccessBlock)success failure:(FailureBlock)failure
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 网络超时设置
    manager.requestSerializer.timeoutInterval = 30;
 
    [manager GET:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // responseObject  解析数据
        if(success){
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // 给用户提示，显示失败的原因
        if(failure){
            failure(error);
        }
    }];
}

+(void)POST:(NSString *)url parameters:(id)param success:(SuccessBlock)success failure:(FailureBlock)failure
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 网络超时设置
    manager.requestSerializer.timeoutInterval = 30;
    
    [manager POST:url parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // responseObject  解析数据
        if(success){
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // 给用户提示，显示失败的原因
        if(failure){
            failure(error);
        }
    }];
}

@end
